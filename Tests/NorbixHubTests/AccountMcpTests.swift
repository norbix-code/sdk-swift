import XCTest
@testable import NorbixHub
import NorbixCore

/// The developer MCP endpoint on the mock executor: verb, path, the MCP
/// headers going out, and the session id, JSON and SSE coming back.
final class HubAccountMcpTests: XCTestCase {
    private func makeClient(_ mock: MockHTTPExecutor) throws -> NorbixHubClient {
        try NorbixHubClient(projectId: "proj", bearerToken: "token", accountId: "acc", executor: mock)
    }

    func testInitializeReadsTheSessionIdFromTheAnswerHeader() async throws {
        let mock = MockHTTPExecutor()
        mock.responseQueue = [(200, Data(#"{"jsonrpc":"2.0","id":1,"result":{}}"#.utf8),
                               ["Content-Type": "application/json", "Mcp-Session-Id": "sess_1"])]
        let client = try makeClient(mock)

        let res = try await client.account.sendMcpMessage(
            ["jsonrpc": "2.0", "id": 1, "method": "initialize"], toolsets: "ai:campaigns")

        let req = try XCTUnwrap(mock.lastRequest)
        XCTAssertEqual(req.httpMethod, "POST")
        XCTAssertEqual(req.url?.path, "/v3/account/mcp")
        XCTAssertEqual(URLComponents(url: req.url!, resolvingAgainstBaseURL: false)?.queryItems?.first?.value, "ai:campaigns")
        XCTAssertEqual(req.value(forHTTPHeaderField: "Accept"), "application/json, text/event-stream")
        XCTAssertEqual(req.value(forHTTPHeaderField: "Authorization"), "Bearer token")
        let sent = try XCTUnwrap(req.httpBody.flatMap { try JSONSerialization.jsonObject(with: $0) as? [String: Any] })
        XCTAssertEqual(sent["method"] as? String, "initialize")
        XCTAssertEqual(res.sessionId, "sess_1")
        XCTAssertEqual((res.json as? [String: Any])?["jsonrpc"] as? String, "2.0")
    }

    func testAStreamedAnswerIsKeptAsRawSseText() async throws {
        let mock = MockHTTPExecutor()
        mock.responseQueue = [(200, Data("id: 1\ndata: {}\n\n".utf8), ["Content-Type": "text/event-stream"])]
        let client = try makeClient(mock)

        let res = try await client.account.sendMcpMessage(
            ["jsonrpc": "2.0", "id": 2, "method": "tools/call"], sessionId: "sess_1")

        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Mcp-Session-Id"), "sess_1")
        XCTAssertTrue(res.isEventStream)
        XCTAssertNil(res.json)
        XCTAssertEqual(res.text, "id: 1\ndata: {}\n\n")
    }

    func testOpenMcpStreamAsksForSseWithTheSession() async throws {
        let mock = MockHTTPExecutor()
        mock.responseQueue = [(200, Data(), ["Content-Type": "text/event-stream"])]
        let client = try makeClient(mock)

        _ = try await client.account.openMcpStream(sessionId: "sess_1", lastEventId: "ev_9")

        let req = try XCTUnwrap(mock.lastRequest)
        XCTAssertEqual(req.httpMethod, "GET")
        XCTAssertEqual(req.url?.path, "/v3/account/mcp")
        XCTAssertEqual(req.value(forHTTPHeaderField: "Accept"), "text/event-stream")
        XCTAssertEqual(req.value(forHTTPHeaderField: "Mcp-Session-Id"), "sess_1")
        XCTAssertEqual(req.value(forHTTPHeaderField: "Last-Event-ID"), "ev_9")
        XCTAssertNil(req.httpBody)
    }

    func testEndMcpSessionSendsDeleteWithTheSession() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data()
        let client = try makeClient(mock)

        _ = try await client.account.endMcpSession(sessionId: "sess_1")

        XCTAssertEqual(mock.lastRequest?.httpMethod, "DELETE")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/account/mcp")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Mcp-Session-Id"), "sess_1")
    }

    func testAnErrorStatusThrows() async throws {
        let mock = MockHTTPExecutor()
        mock.responseStatus = 400
        mock.responseBody = Data(#"{"jsonrpc":"2.0","error":{"code":-32600,"message":"no session"}}"#.utf8)
        let client = try makeClient(mock)

        do {
            _ = try await client.account.sendMcpMessage(["jsonrpc": "2.0", "id": 3, "method": "tools/list"])
            XCTFail("expected a NorbixError")
        } catch let error as NorbixError {
            XCTAssertEqual(error.status, 400)
        }
    }
}
