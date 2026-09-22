import Foundation

/// All errors thrown by the Norbix SDK.
///
/// `code` is a stable string id (e.g. `NORBIX_NOT_AUTHENTICATED`) that you can
/// pattern-match on. `status` is the HTTP status when the error came from the
/// server (0 otherwise). `details` carries the parsed server payload as
/// stringified key/value pairs (so the type stays `Sendable` and `Equatable`),
/// and `rawBody` carries the raw response body for callers who need the full
/// JSON.
public struct NorbixError: Error, LocalizedError, Sendable, Equatable {
    public let message: String
    public let status: Int
    public let code: String
    public let details: [String: String]
    public let rawBody: String?
    /// Every error the gateway sent, in the order it sent them.
    public let errors: [NorbixErrorItem]

    public init(
        message: String,
        status: Int = 0,
        code: String = "NORBIX_ERROR",
        details: [String: String] = [:],
        rawBody: String? = nil,
        errors: [NorbixErrorItem] = []
    ) {
        self.message = message
        self.status = status
        self.code = code
        self.details = details
        self.rawBody = rawBody
        self.errors = errors
    }

    /// Same value as `status`. The name every Norbix SDK uses for it.
    public var httpStatus: Int { status }

    /// Same value as `code`. The name every Norbix SDK uses for it.
    public var errorCode: String { code }

    /// Same value as `rawBody` — the answer exactly as it arrived.
    public var body: String? { rawBody }

    public var errorDescription: String? {
        "\(code) (\(status)): \(message)"
    }

    /// Build the error a gateway answer describes.
    ///
    /// The gateway puts its message and its error code inside
    /// `responseStatus.errors[]`, not at the top of the block, so that list is
    /// read first: the first entry gives `message` and `code`, and every entry
    /// is kept in `errors`. Only when the body has no `responseStatus` are the
    /// top-level `message` and `errorCode` read. `Request failed (HTTP N)` is
    /// the last fallback, used when the body says nothing at all — a 500 page
    /// that is not JSON, say.
    ///
    /// Top-level JSON values are flattened into `String` so the resulting
    /// error stays `Sendable` / `Equatable`.
    public static func fromHTTPResponse(
        status: Int,
        data: Data
    ) -> NorbixError {
        let rawBody = String(data: data, encoding: .utf8)
        guard
            let parsed = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any]
        else {
            return NorbixError(
                message: "Request failed (HTTP \(status))",
                status: status,
                code: "HTTP_\(status)",
                rawBody: rawBody
            )
        }

        var flat: [String: String] = [:]
        for (key, value) in parsed {
            flat[key] = stringify(value)
        }

        // `source` is responseStatus when the body has one, the body itself
        // when it has none — so the top-level fields are read only then.
        let source = responseStatus(of: parsed) ?? parsed
        let items = errorItems(from: source["errors"])
        let first = items.first { $0.message != nil || $0.errorCode != nil }

        return NorbixError(
            message: first?.message
                ?? text(source["message"])
                ?? "Request failed (HTTP \(status))",
            status: status,
            // Callers pattern-match on `code`, so it is never left empty; the
            // gateway's own code wins whenever the gateway sent one.
            code: first?.errorCode ?? text(source["errorCode"]) ?? "HTTP_\(status)",
            details: flat,
            rawBody: rawBody,
            errors: items
        )
    }

    /// `true` when the body carries `responseStatus.isSuccess == false`.
    ///
    /// The gateway answers a business refusal — an unknown id, a rule that
    /// says no — with HTTP 200 and that flag. Without this check the SDK would
    /// hand such an answer back as a value and the caller would carry on as if
    /// the call had worked (10b-files, issue #67).
    public static func saysItFailed(data: Data) -> Bool {
        guard
            let parsed = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any],
            let status = responseStatus(of: parsed)
        else { return false }
        for key in ["isSuccess", "IsSuccess"] {
            if let flag = status[key] as? Bool { return !flag }
            if let number = status[key] as? NSNumber { return !number.boolValue }
        }
        return false
    }

    /// The `responseStatus` block of a body, whatever the casing of the key.
    private static func responseStatus(of body: [String: Any]) -> [String: Any]? {
        for key in ["responseStatus", "ResponseStatus"] {
            if let value = body[key] as? [String: Any] { return value }
        }
        return nil
    }

    private static func errorItems(from value: Any?) -> [NorbixErrorItem] {
        guard let list = value as? [Any] else { return [] }
        return list.compactMap { entry in
            guard let map = entry as? [String: Any] else { return nil }
            var context: [String: String] = [:]
            if let raw = map["context"] as? [String: Any] {
                for (key, value) in raw { context[key] = stringify(value) }
            }
            return NorbixErrorItem(
                errorCode: text(map["errorCode"]),
                message: text(map["message"]),
                fieldName: text(map["fieldName"]),
                context: context
            )
        }
    }

    private static func text(_ value: Any?) -> String? {
        guard let s = value as? String, !s.isEmpty else { return nil }
        return s
    }

    private static func stringify(_ value: Any) -> String {
        switch value {
        case let s as String: return s
        case let n as NSNumber: return n.stringValue
        case is NSNull: return ""
        default:
            if let data = try? JSONSerialization.data(withJSONObject: value),
               let s = String(data: data, encoding: .utf8) {
                return s
            }
            return String(describing: value)
        }
    }
}

/// One error inside the gateway's `responseStatus.errors` list.
public struct NorbixErrorItem: Sendable, Equatable {
    /// The gateway's own code, e.g. `CM-ERRORS-FILES-016`.
    public let errorCode: String?
    /// The gateway's own text.
    public let message: String?
    /// The request field the error is about, when it is about one.
    public let fieldName: String?
    /// Extra values the gateway attached to this error.
    public let context: [String: String]

    public init(
        errorCode: String? = nil,
        message: String? = nil,
        fieldName: String? = nil,
        context: [String: String] = [:]
    ) {
        self.errorCode = errorCode
        self.message = message
        self.fieldName = fieldName
        self.context = context
    }
}
