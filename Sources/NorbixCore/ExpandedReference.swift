import Foundation

/// One reference value as the gateway returns it when a record read is sent
/// with `expandReferences: true` (gateway campaign schema-content, 2026-10).
///
/// A reference field (a user, a role, a taxonomy term, a record of another
/// collection, a file) normally stores only the target's id. With
/// `expandReferences` every such value comes back as
/// `{ "id": "...", "display": ... }`, and a `multiple` reference as a list
/// of them. Nested forms and arrays are expanded in place, at any depth.
///
/// Use it two ways:
///
/// - **Typed reads** (`find(collection:as:)`, `findOne(collection:id:as:)`,
///   `findOwn(collection:as:)` in `NorbixApi`): declare the field as
///   `ExpandedReference` (or `[ExpandedReference]` for a `multiple`
///   reference) in your `Codable` record. A bare id — a read made without
///   the flag — decodes too, as an unresolved reference with that id.
/// - **Untyped reads** (`[String: Any]` answers): read a pair out of the
///   record with ``from(_:)`` or ``listFrom(_:)``.
///
/// ```swift
/// struct Post: Codable, Sendable {
///     let title: String
///     let author: ExpandedReference          // "author": {"id":"usr_1","display":"Jane Doe"}
///     let tags: [ExpandedReference]          // a multiple reference
/// }
/// let page: Page<Post> = try await client.database.find(
///     collection: "posts", expandReferences: true, as: Post.self
/// )
/// print(page.items[0].author.displayText() ?? "?")      // Jane Doe
/// ```
public struct ExpandedReference: Codable, Sendable, Equatable {
    /// What the schema's `displayField` names on the target.
    public enum Display: Sendable, Equatable {
        /// A plain value — a string, or a number / date / boolean the gateway
        /// rendered as text.
        case text(String)
        /// A translatable name, one entry per language (`["en": "News"]`).
        case translated([String: String])
    }

    /// The stored id, exactly as the record holds it. `nil` only when the
    /// stored value was `null`.
    public let id: String?
    /// The display value, or `nil` when the target is gone or the caller may
    /// not read it (a read without the flag has no display either).
    public let display: Display?

    public init(id: String?, display: Display? = nil) {
        self.id = id
        self.display = display
    }

    /// `true` when the gateway found a target to show.
    public var isResolved: Bool { display != nil }

    /// `display` as plain text: the text itself, or for a translated name the
    /// value under `language` (then `"en"`, then the first language in
    /// alphabetical order). `nil` when there is nothing to show.
    public func displayText(language: String? = nil) -> String? {
        switch display {
        case .none:
            return nil
        case .text(let text):
            return text
        case .translated(let map):
            if let language, let hit = map[language] { return hit }
            if let en = map["en"] { return en }
            return map.keys.sorted().first.flatMap { map[$0] }
        }
    }

    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case id
        case display
    }

    public init(from decoder: Decoder) throws {
        let single = try decoder.singleValueContainer()
        if single.decodeNil() {
            self.init(id: nil, display: nil)
            return
        }
        // A read without the flag: the stored id alone.
        if let bare = try? single.decode(String.self) {
            self.init(id: bare, display: nil)
            return
        }
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decodeIfPresent(String.self, forKey: .id)
        self.init(id: id, display: Self.decodeDisplay(container))
    }

    private static func decodeDisplay(_ container: KeyedDecodingContainer<CodingKeys>) -> Display? {
        guard container.contains(.display) else { return nil }
        if (try? container.decodeNil(forKey: .display)) == true { return nil }
        if let text = try? container.decode(String.self, forKey: .display) { return .text(text) }
        if let map = try? container.decode([String: String?].self, forKey: .display) {
            return .translated(map.compactMapValues { $0 })
        }
        if let int = try? container.decode(Int.self, forKey: .display) { return .text(String(int)) }
        if let number = try? container.decode(Double.self, forKey: .display) { return .text(String(number)) }
        if let flag = try? container.decode(Bool.self, forKey: .display) { return .text(String(flag)) }
        return nil
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        switch display {
        case .none: try container.encodeNil(forKey: .display)
        case .text(let text): try container.encode(text, forKey: .display)
        case .translated(let map): try container.encode(map, forKey: .display)
        }
    }

    // MARK: - Untyped answers

    /// Reads one expanded pair out of an untyped record (`[String: Any]`).
    /// Accepts the `{ id, display }` dictionary the gateway returns; a bare
    /// string (a read made without the flag) is handed back as an unresolved
    /// reference with that id; `nil`, `NSNull` and anything else give `nil`.
    public static func from(_ value: Any?) -> ExpandedReference? {
        switch value {
        case nil, is NSNull:
            return nil
        case let reference as ExpandedReference:
            return reference
        case let id as String:
            return ExpandedReference(id: id, display: nil)
        case let pair as [String: Any]:
            return ExpandedReference(id: pair["id"] as? String, display: Display.from(pair["display"]))
        default:
            return nil
        }
    }

    /// Reads a `multiple` reference out of an untyped record: a list of
    /// expanded pairs. A single pair is wrapped in a one-item list; `nil`
    /// gives an empty list.
    public static func listFrom(_ value: Any?) -> [ExpandedReference] {
        if let list = value as? [Any] { return list.compactMap { from($0) } }
        return [from(value)].compactMap { $0 }
    }
}

extension ExpandedReference.Display {
    /// Reads a display value out of an untyped answer.
    static func from(_ value: Any?) -> ExpandedReference.Display? {
        switch value {
        case nil, is NSNull:
            return nil
        case let text as String:
            return .text(text)
        case let map as [String: Any]:
            var translated: [String: String] = [:]
            for (language, name) in map {
                if let name = name as? String { translated[language] = name }
            }
            return .translated(translated)
        case let number as NSNumber:
            // JSONSerialization hands booleans back as NSNumber too.
            if CFGetTypeID(number) == CFBooleanGetTypeID() { return .text(String(number.boolValue)) }
            return .text(number.stringValue)
        default:
            return nil
        }
    }
}
