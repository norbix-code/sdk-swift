import XCTest
@testable import NorbixHub
import NorbixCore

/// `hub.triggers` and the execution identity routes, against `MockHTTPExecutor`.
/// Never a real gateway.
final class HubTriggersModuleTests: XCTestCase {

    private func makeClient(_ mock: MockHTTPExecutor) throws -> NorbixHubClient {
        try NorbixHubClient(projectId: "proj", bearerToken: "token", accountId: "acc", executor: mock)
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

    func testGetTriggerRunsSendsTheFiltersOnTheQuery() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.triggers.getTriggerRuns(["triggerType": "Schema", "triggerId": "trg_1", "status": "failed"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/triggers/runs")
        XCTAssertEqual(try query(mock), ["triggerType": "Schema", "triggerId": "trg_1", "status": "failed"])
    }

    func testGetTriggerRunPutsTheIdInThePathAndKeepsTheType() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.triggers.getTriggerRun(["id": "trr_1", "triggerType": "Membership"])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/triggers/runs/trr_1")
        XCTAssertEqual(try query(mock), ["triggerType": "Membership"])
    }

    func testCheckTriggerExecutionIdentityPostsTheAction() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.triggers.checkTriggerExecutionIdentity(["triggerType": "Schema", "action": ["type": "Email"]])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/triggers/execution-identity/check")
        XCTAssertEqual(try body(mock)["triggerType"] as? String, "Schema")
    }

    func testExecutionIdentitiesListAndCreate() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.membership.getExecutionIdentities()
        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/membership/execution-identities")

        _ = try await client.membership.createExecutionIdentity(["name": "Orders bot", "roleIds": ["Editor"]])
        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(try body(mock)["name"] as? String, "Orders bot")
    }
}
