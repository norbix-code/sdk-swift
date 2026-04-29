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

    public init(
        message: String,
        status: Int = 0,
        code: String = "NORBIX_ERROR",
        details: [String: String] = [:],
        rawBody: String? = nil
    ) {
        self.message = message
        self.status = status
        self.code = code
        self.details = details
        self.rawBody = rawBody
    }

    public var errorDescription: String? {
        "\(code) (\(status)): \(message)"
    }

    /// Helper used by the transport to build a `NorbixError` from an HTTP error
    /// response. Flattens any top-level JSON value into a `String` so the
    /// resulting error is `Sendable`/`Equatable`.
    public static func fromHTTPResponse(
        status: Int,
        data: Data
    ) -> NorbixError {
        let rawBody = String(data: data, encoding: .utf8)
        guard
            let parsed = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any]
        else {
            return NorbixError(
                message: "Request failed",
                status: status,
                code: "HTTP_\(status)",
                rawBody: rawBody
            )
        }

        var flat: [String: String] = [:]
        for (key, value) in parsed {
            flat[key] = stringify(value)
        }

        return NorbixError(
            message: parsed["message"] as? String ?? "Request failed",
            status: status,
            code: parsed["errorCode"] as? String ?? "HTTP_\(status)",
            details: flat,
            rawBody: rawBody
        )
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
