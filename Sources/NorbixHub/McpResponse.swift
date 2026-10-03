import Foundation
import NorbixCore

/// The answer of the developer MCP endpoint (`/{version}/account/mcp`).
///
/// MCP is not a plain JSON API: `initialize` hands out the session id in the
/// `Mcp-Session-Id` answer header, a `tools/call` may answer with an SSE
/// stream, and a notification answers `202` with no body. So the SDK keeps the
/// whole answer instead of only a parsed body.
public struct McpResponse: Sendable {
    /// HTTP status: 200 with a body, 202 for an accepted notification.
    public let statusCode: Int
    /// The answer's headers as the server sent them.
    public let headers: [String: String]
    /// The raw body: JSON-RPC JSON, or SSE text (`event:` / `data:` lines).
    public let body: Data

    init(_ raw: NorbixRawResponse) {
        self.statusCode = raw.statusCode
        self.headers = raw.headers
        self.body = raw.body
    }

    /// The `Mcp-Session-Id` header — set on the `initialize` answer. Pass it
    /// back as `sessionId` on every later call.
    public var sessionId: String? { header("Mcp-Session-Id") }

    /// The answer's content type: `application/json` or `text/event-stream`.
    public var contentType: String? { header("Content-Type") }

    /// True when the server answered with an SSE stream.
    public var isEventStream: Bool {
        contentType?.range(of: "text/event-stream", options: .caseInsensitive) != nil
    }

    /// The body as text.
    public var text: String { String(decoding: body, as: UTF8.self) }

    /// The JSON-RPC message when the body is JSON; nil for SSE or no body.
    public var json: Any? {
        guard !isEventStream, !body.isEmpty else { return nil }
        return try? JSONSerialization.jsonObject(with: body)
    }

    /// A header of the answer, matched without regard to case.
    public func header(_ name: String) -> String? {
        headers.first { $0.key.caseInsensitiveCompare(name) == .orderedSame }?.value
    }
}
