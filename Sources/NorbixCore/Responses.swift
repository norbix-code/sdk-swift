import Foundation

/// Authentication response returned by `/auth` (login).
public struct AuthResponse: Codable, Sendable, Equatable {
    public let bearerToken: String
    public let userId: String?
    public let email: String?
    public let displayName: String?
    public let expiration: Date?

    public init(
        bearerToken: String,
        userId: String? = nil,
        email: String? = nil,
        displayName: String? = nil,
        expiration: Date? = nil
    ) {
        self.bearerToken = bearerToken
        self.userId = userId
        self.email = email
        self.displayName = displayName
        self.expiration = expiration
    }
}

/// Generic paginated list response returned by collection endpoints.
///
/// Known answer shapes, tried in this order:
/// 1. `{"list": {"items": [...], "hasMore": ..., "startingAfter": ...}}` —
///    database `find`, membership user lists (the gateway's paginated answer)
/// 2. `{"items": [...], "total": ...}`
/// 3. a bare JSON array
///
/// Any other shape throws, so a changed answer is an error and never a
/// silently empty page.
public struct Page<Item: Codable & Sendable>: Codable, Sendable {
    public let items: [Item]
    public let total: Int?
    public let take: Int?
    public let skip: Int?
    /// Cursor paging, as the gateway sends it inside `list`.
    public let hasMore: Bool?
    public let hasPrevious: Bool?
    public let startingAfter: String?
    public let endingBefore: String?

    public init(
        items: [Item],
        total: Int? = nil,
        take: Int? = nil,
        skip: Int? = nil,
        hasMore: Bool? = nil,
        hasPrevious: Bool? = nil,
        startingAfter: String? = nil,
        endingBefore: String? = nil
    ) {
        self.items = items
        self.total = total
        self.take = take
        self.skip = skip
        self.hasMore = hasMore
        self.hasPrevious = hasPrevious
        self.startingAfter = startingAfter
        self.endingBefore = endingBefore
    }

    enum CodingKeys: String, CodingKey {
        case items
        case total
        case take
        case skip
        case hasMore
        case hasPrevious
        case startingAfter
        case endingBefore
    }

    private enum AnswerKeys: String, CodingKey {
        case list
        case items
        case total
        case totalCount
        case take
        case skip
        case hasMore
        case hasPrevious
        case startingAfter
        case endingBefore
    }

    public init(from decoder: Decoder) throws {
        guard let root = try? decoder.container(keyedBy: AnswerKeys.self) else {
            do {
                self.init(items: try decoder.singleValueContainer().decode([Item].self))
            } catch {
                throw DecodingError.dataCorrupted(.init(
                    codingPath: decoder.codingPath,
                    debugDescription: "Page: expected an object or an array of items.",
                    underlyingError: error
                ))
            }
            return
        }

        let page: KeyedDecodingContainer<AnswerKeys>
        if root.contains(.list), try !root.decodeNil(forKey: .list) {
            page = try root.nestedContainer(keyedBy: AnswerKeys.self, forKey: .list)
        } else {
            page = root
        }
        guard page.contains(.items) else {
            throw DecodingError.dataCorrupted(.init(
                codingPath: decoder.codingPath,
                debugDescription: "Page: none of the known shapes matched (list.items, items, array). Keys: \(root.allKeys.map(\.stringValue))."
            ))
        }

        self.init(
            items: try page.decode([Item].self, forKey: .items),
            total: try page.decodeIfPresent(Int.self, forKey: .total)
                ?? page.decodeIfPresent(Int.self, forKey: .totalCount),
            take: try page.decodeIfPresent(Int.self, forKey: .take),
            skip: try page.decodeIfPresent(Int.self, forKey: .skip),
            hasMore: try page.decodeIfPresent(Bool.self, forKey: .hasMore),
            hasPrevious: try page.decodeIfPresent(Bool.self, forKey: .hasPrevious),
            startingAfter: try page.decodeIfPresent(String.self, forKey: .startingAfter),
            endingBefore: try page.decodeIfPresent(String.self, forKey: .endingBefore)
        )
    }
}

/// Use this when the endpoint succeeds with no body (`204 No Content`,
/// `{}`, etc.).
public struct EmptyResponse: Codable, Sendable, Equatable {
    public init() {}
    public init(from decoder: Decoder) throws {}
    public func encode(to encoder: Encoder) throws {}
}

/// Lightweight metadata for a file stored in Norbix.
public struct FileInfo: Codable, Sendable, Equatable {
    public let id: String
    public let originalFileName: String?
    public let `extension`: String?
    public let sizeBytes: Int?
    public let storedFileName: String?
    public let contentType: String?
    public let createdOn: Date?

    public init(
        id: String,
        originalFileName: String? = nil,
        extension: String? = nil,
        sizeBytes: Int? = nil,
        storedFileName: String? = nil,
        contentType: String? = nil,
        createdOn: Date? = nil
    ) {
        self.id = id
        self.originalFileName = originalFileName
        self.extension = `extension`
        self.sizeBytes = sizeBytes
        self.storedFileName = storedFileName
        self.contentType = contentType
        self.createdOn = createdOn
    }
}

/// Response returned by `files.sign(...)`: a pre-signed URL the client uses
/// to upload (PUT/POST) directly to the cloud provider, plus optional fields
/// some providers (e.g. S3 POST policy) require alongside the URL.
///
/// The SDK does **not** perform the upload itself — call sites are expected
/// to PUT/POST the file body to `url` directly so the bytes never round-trip
/// through Norbix.
public struct SignedUploadResponse: Codable, Sendable, Equatable {
    public let url: String
    public let method: String?
    public let headers: [String: String]?
    public let fields: [String: String]?
    public let expiresAt: Date?
    public let fileId: String?

    public init(
        url: String,
        method: String? = nil,
        headers: [String: String]? = nil,
        fields: [String: String]? = nil,
        expiresAt: Date? = nil,
        fileId: String? = nil
    ) {
        self.url = url
        self.method = method
        self.headers = headers
        self.fields = fields
        self.expiresAt = expiresAt
        self.fileId = fileId
    }
}

public extension JSONDecoder {
    /// Decoder configured for the Norbix API: ISO-8601 dates with optional
    /// fractional seconds, default (camelCase) key strategy.
    static var norbixDefault: JSONDecoder {
        let d = JSONDecoder()
        d.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let str = try container.decode(String.self)

            let withFraction = ISO8601DateFormatter()
            withFraction.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
            if let date = withFraction.date(from: str) { return date }

            let plain = ISO8601DateFormatter()
            plain.formatOptions = [.withInternetDateTime]
            if let date = plain.date(from: str) { return date }

            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid ISO-8601 date: \(str)"
            )
        }
        return d
    }
}
