import XCTest
@testable import NorbixApi
import NorbixCore

/// `client.code` — the four Workflows Beta routes of the Api host
/// (`Code.Workflows.md` §7, "App users resume from the API host"), through the
/// mock executor: verb, full path, and where each parameter goes.
final class ApiCodeModuleTests: XCTestCase {

    private func makeClient(_ mock: MockHTTPExecutor) throws -> NorbixApiClient {
        try NorbixApiClient(projectId: "p1", apiKey: "k", executor: mock)
    }

    private func body(_ mock: MockHTTPExecutor) throws -> [String: Any] {
        let data = try XCTUnwrap(mock.lastRequest?.httpBody)
        return try XCTUnwrap(JSONSerialization.jsonObject(with: data) as? [String: Any])
    }

    private func query(_ mock: MockHTTPExecutor) throws -> [String: String] {
        let url = try XCTUnwrap(mock.lastRequest?.url)
        let items = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems ?? []
        return Dictionary(uniqueKeysWithValues: items.map { ($0.name, $0.value ?? "") })
    }

    func testGetCodeWorkflowWaitingRuns() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.code.getCodeWorkflowWaitingRuns(["assignee": "me", "status": "Waiting", "pageSize": 20])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/code/workflows/runs")
        XCTAssertEqual(try query(mock), ["assignee": "me", "status": "Waiting", "pageSize": "20"])
        XCTAssertNil(mock.lastRequest?.httpBody)
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer k")
    }

    func testResumeCodeWorkflowRun() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.code.resumeCodeWorkflowRun([
            "runId": "run_1",
            "stepId": "approve",
            "decision": "approved",
            "payload": ["note": "ok"],
        ])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/code/workflows/runs/run_1/resume")
        XCTAssertEqual(try query(mock), [:])
        let sent = try body(mock)
        XCTAssertNil(sent["runId"])
        XCTAssertEqual(sent["stepId"] as? String, "approve")
        XCTAssertEqual(sent["decision"] as? String, "approved")
        XCTAssertEqual((sent["payload"] as? [String: Any])?["note"] as? String, "ok")
    }

    func testOpenCodeWorkflowResumeLink() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.code.openCodeWorkflowResumeLink(["token": "sig.abc-123"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/code/workflows/resume/sig.abc-123")
        XCTAssertEqual(try query(mock), [:])
        XCTAssertNil(mock.lastRequest?.httpBody)
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer k")
    }

    func testUseCodeWorkflowResumeLink() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.code.useCodeWorkflowResumeLink(["token": "sig.abc-123"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/code/workflows/resume/sig.abc-123")
        XCTAssertEqual(try query(mock), [:])
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    /// The signed links need no session: a client with no credentials still
    /// sends both calls, with no Authorization header.
    func testResumeLinksWithNoCredentialsSendNoAuthorization() async throws {
        let calls: [(String, (CodeModule) async throws -> Any?)] = [
            ("GET", { try await $0.openCodeWorkflowResumeLink(["token": "sig.abc-123"]) }),
            ("POST", { try await $0.useCodeWorkflowResumeLink(["token": "sig.abc-123"]) }),
        ]
        for (method, call) in calls {
            let mock = MockHTTPExecutor()
            let config = try NorbixConfig(projectId: "p1", baseUrl: "https://api.example.test", version: "v2")
            let client = NorbixApiClient(config: config, executor: mock)

            _ = try await call(client.code)

            let request = try XCTUnwrap(mock.lastRequest, method)
            XCTAssertEqual(request.httpMethod, method)
            XCTAssertEqual(request.url?.path, "/v2/code/workflows/resume/sig.abc-123", method)
            XCTAssertNil(request.value(forHTTPHeaderField: "Authorization"), method)
        }
    }
}
