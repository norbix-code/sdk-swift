import XCTest
@testable import NorbixHub
import NorbixCore

/// `hub.code` — the 26 Workflows Beta routes of the gateway contract
/// `Code.Workflows.md` §7, against `MockHTTPExecutor` (the same pattern as
/// `HubCodeModuleTests`). One test per method: the verb, the full path with
/// every id substituted, and where each parameter goes (path / query / body).
final class HubCodeWorkflowsTests: XCTestCase {

    private func makeClient(_ mock: MockHTTPExecutor) throws -> NorbixHubClient {
        try NorbixHubClient(
            projectId: "proj",
            bearerToken: "token",
            accountId: "acc",
            executor: mock
        )
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

    /// Runs one call and checks the verb and the path.
    private func send(
        _ method: String,
        _ path: String,
        _ call: (CodeModule) async throws -> Any?,
        file: StaticString = #filePath,
        line: UInt = #line
    ) async throws -> MockHTTPExecutor {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)
        _ = try await call(client.code)
        XCTAssertEqual(mock.lastRequest?.httpMethod, method, file: file, line: line)
        XCTAssertEqual(mock.lastRequest?.url?.path, path, file: file, line: line)
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token", file: file, line: line)
        return mock
    }

    // MARK: - Definitions

    func testGetCodeWorkflows() async throws {
        let mock = try await send("GET", "/v3/code/workflows") {
            try await $0.getCodeWorkflows(["isEnabled": true, "pageSize": 25, "startingAfter": "wf_0"])
        }
        XCTAssertEqual(try query(mock), ["isEnabled": "true", "pageSize": "25", "startingAfter": "wf_0"])
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    func testSaveCodeWorkflow() async throws {
        let mock = try await send("PUT", "/v3/code/workflows") {
            try await $0.saveCodeWorkflow(["definition": ["id": "order-approval", "steps": [Any]()]])
        }
        XCTAssertEqual(try query(mock), [:])
        let definition = try XCTUnwrap(try body(mock)["definition"] as? [String: Any])
        XCTAssertEqual(definition["id"] as? String, "order-approval")
    }

    func testGetCodeWorkflow() async throws {
        let mock = try await send("GET", "/v3/code/workflows/wf_1") {
            try await $0.getCodeWorkflow(["id": "wf_1", "pinnedVersion": 3])
        }
        XCTAssertEqual(try query(mock), ["pinnedVersion": "3"])
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    func testDeleteCodeWorkflow() async throws {
        let mock = try await send("DELETE", "/v3/code/workflows/wf_1") {
            try await $0.deleteCodeWorkflow(["id": "wf_1"])
        }
        XCTAssertEqual(try query(mock), [:])
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    func testGetCodeWorkflowDraft() async throws {
        let mock = try await send("GET", "/v3/code/workflows/wf_1/draft") {
            try await $0.getCodeWorkflowDraft(["id": "wf_1"])
        }
        XCTAssertEqual(try query(mock), [:])
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    func testDiscardCodeWorkflowDraft() async throws {
        let mock = try await send("DELETE", "/v3/code/workflows/wf_1/draft") {
            try await $0.discardCodeWorkflowDraft(["id": "wf_1"])
        }
        XCTAssertEqual(try query(mock), [:])
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    func testPublishCodeWorkflow() async throws {
        let mock = try await send("POST", "/v3/code/workflows/wf_1/publish") {
            try await $0.publishCodeWorkflow(["id": "wf_1"])
        }
        XCTAssertEqual(try query(mock), [:])
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    func testGetCodeWorkflowVersions() async throws {
        let mock = try await send("GET", "/v3/code/workflows/wf_1/versions") {
            try await $0.getCodeWorkflowVersions(["id": "wf_1"])
        }
        XCTAssertEqual(try query(mock), [:])
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    func testGetCodeWorkflowVersionDiff() async throws {
        let mock = try await send("GET", "/v3/code/workflows/wf_1/versions/diff") {
            try await $0.getCodeWorkflowVersionDiff(["id": "wf_1", "fromVersion": 1, "toVersion": 2])
        }
        XCTAssertEqual(try query(mock), ["fromVersion": "1", "toVersion": "2"])
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    func testEnableCodeWorkflow() async throws {
        let mock = try await send("PUT", "/v3/code/workflows/wf_1/enable") {
            try await $0.enableCodeWorkflow(["id": "wf_1"])
        }
        XCTAssertEqual(try query(mock), [:])
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    func testDisableCodeWorkflow() async throws {
        let mock = try await send("PUT", "/v3/code/workflows/wf_1/disable") {
            try await $0.disableCodeWorkflow(["id": "wf_1"])
        }
        XCTAssertEqual(try query(mock), [:])
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    func testInvokeCodeWorkflow() async throws {
        let mock = try await send("POST", "/v3/code/workflows/wf_1/invoke") {
            try await $0.invokeCodeWorkflow([
                "id": "wf_1",
                "payload": ["orderId": "ord_1"],
                "waitSeconds": 10,
                "runVersion": "draft",
            ])
        }
        XCTAssertEqual(try query(mock), [:])
        let sent = try body(mock)
        XCTAssertNil(sent["id"])
        XCTAssertEqual((sent["payload"] as? [String: Any])?["orderId"] as? String, "ord_1")
        XCTAssertEqual(sent["waitSeconds"] as? Int, 10)
        XCTAssertEqual(sent["runVersion"] as? String, "draft")
    }

    func testGetCodeWorkflowRuns() async throws {
        let mock = try await send("GET", "/v3/code/workflows/wf_1/runs") {
            try await $0.getCodeWorkflowRuns([
                "id": "wf_1",
                "status": "Waiting",
                "from": "2026-10-01T00:00:00Z",
                "to": "2026-10-27T00:00:00Z",
                "pageSize": 20,
            ])
        }
        XCTAssertEqual(
            try query(mock),
            ["status": "Waiting", "from": "2026-10-01T00:00:00Z", "to": "2026-10-27T00:00:00Z", "pageSize": "20"]
        )
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    func testResumeCodeWorkflowRunByKey() async throws {
        let mock = try await send("POST", "/v3/code/workflows/wf_1/resume") {
            try await $0.resumeCodeWorkflowRunByKey([
                "id": "wf_1",
                "key": "order-42",
                "stepId": "approve",
                "decision": "approved",
                "payload": ["note": "ok"],
            ])
        }
        XCTAssertEqual(try query(mock), [:])
        let sent = try body(mock)
        XCTAssertNil(sent["id"])
        XCTAssertEqual(sent["key"] as? String, "order-42")
        XCTAssertEqual(sent["stepId"] as? String, "approve")
        XCTAssertEqual(sent["decision"] as? String, "approved")
        XCTAssertEqual((sent["payload"] as? [String: Any])?["note"] as? String, "ok")
    }

    // MARK: - Module-level routes

    func testValidateCodeWorkflow() async throws {
        let mock = try await send("POST", "/v3/code/workflows/validate") {
            try await $0.validateCodeWorkflow(["definition": ["id": "order-approval"]])
        }
        XCTAssertEqual(try query(mock), [:])
        let definition = try XCTUnwrap(try body(mock)["definition"] as? [String: Any])
        XCTAssertEqual(definition["id"] as? String, "order-approval")
    }

    func testGetCodeWorkflowSchema() async throws {
        let mock = try await send("GET", "/v3/code/workflows/schema") {
            try await $0.getCodeWorkflowSchema()
        }
        XCTAssertEqual(try query(mock), [:])
        XCTAssertNil(mock.lastRequest?.url?.query)
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    func testEnableCodeWorkflows() async throws {
        let mock = try await send("PUT", "/v3/code/workflows/enable") {
            try await $0.enableCodeWorkflows()
        }
        XCTAssertEqual(try query(mock), [:])
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    func testDisableCodeWorkflows() async throws {
        let mock = try await send("PUT", "/v3/code/workflows/disable") {
            try await $0.disableCodeWorkflows()
        }
        XCTAssertEqual(try query(mock), [:])
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    // MARK: - Runs

    func testGetCodeWorkflowWaitingRuns() async throws {
        let mock = try await send("GET", "/v3/code/workflows/runs") {
            try await $0.getCodeWorkflowWaitingRuns([
                "status": "Waiting",
                "waitingKind": "approval",
                "assignee": "me",
                "workflowId": "wf_1",
                "key": "order-42",
                "endingBefore": "run_9",
            ])
        }
        XCTAssertEqual(
            try query(mock),
            [
                "status": "Waiting", "waitingKind": "approval", "assignee": "me",
                "workflowId": "wf_1", "key": "order-42", "endingBefore": "run_9",
            ]
        )
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    func testGetCodeWorkflowRun() async throws {
        let mock = try await send("GET", "/v3/code/workflows/runs/run_1") {
            try await $0.getCodeWorkflowRun(["runId": "run_1"])
        }
        XCTAssertEqual(try query(mock), [:])
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    func testGetCodeWorkflowRunLogs() async throws {
        let mock = try await send("GET", "/v3/code/workflows/runs/run_1/logs") {
            try await $0.getCodeWorkflowRunLogs(["runId": "run_1", "stepId": "approve", "level": "Error", "pageSize": 50])
        }
        XCTAssertEqual(try query(mock), ["stepId": "approve", "level": "Error", "pageSize": "50"])
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    func testResumeCodeWorkflowRun() async throws {
        let mock = try await send("POST", "/v3/code/workflows/runs/run_1/resume") {
            try await $0.resumeCodeWorkflowRun([
                "runId": "run_1",
                "stepId": "approve",
                "decision": "rejected",
                "payload": ["reason": "too expensive"],
            ])
        }
        XCTAssertEqual(try query(mock), [:])
        let sent = try body(mock)
        XCTAssertNil(sent["runId"])
        XCTAssertEqual(sent["stepId"] as? String, "approve")
        XCTAssertEqual(sent["decision"] as? String, "rejected")
        XCTAssertEqual((sent["payload"] as? [String: Any])?["reason"] as? String, "too expensive")
    }

    func testRetryCodeWorkflowRunStep() async throws {
        let mock = try await send("POST", "/v3/code/workflows/runs/run_1/retry") {
            try await $0.retryCodeWorkflowRunStep(["runId": "run_1", "stepId": "charge"])
        }
        XCTAssertEqual(try query(mock), [:])
        let sent = try body(mock)
        XCTAssertNil(sent["runId"])
        XCTAssertEqual(sent["stepId"] as? String, "charge")
    }

    func testCancelCodeWorkflowRun() async throws {
        let mock = try await send("POST", "/v3/code/workflows/runs/run_1/cancel") {
            try await $0.cancelCodeWorkflowRun(["runId": "run_1", "reason": "duplicate order"])
        }
        XCTAssertEqual(try query(mock), [:])
        let sent = try body(mock)
        XCTAssertNil(sent["runId"])
        XCTAssertEqual(sent["reason"] as? String, "duplicate order")
    }

    // MARK: - Signed resume links

    func testOpenCodeWorkflowResumeLink() async throws {
        let mock = try await send("GET", "/v3/code/workflows/resume/sig.abc-123") {
            try await $0.openCodeWorkflowResumeLink(["token": "sig.abc-123"])
        }
        XCTAssertEqual(try query(mock), [:])
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    func testUseCodeWorkflowResumeLink() async throws {
        let mock = try await send("POST", "/v3/code/workflows/resume/sig.abc-123") {
            try await $0.useCodeWorkflowResumeLink(["token": "sig.abc-123"])
        }
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
            let config = try NorbixConfig(projectId: "proj", baseUrl: "https://hub.example.test", version: "v2")
            let client = NorbixHubClient(config: config, executor: mock)

            _ = try await call(client.code)

            let request = try XCTUnwrap(mock.lastRequest, method)
            XCTAssertEqual(request.httpMethod, method)
            XCTAssertEqual(request.url?.path, "/v2/code/workflows/resume/sig.abc-123", method)
            XCTAssertNil(request.value(forHTTPHeaderField: "Authorization"), method)
        }
    }
}
