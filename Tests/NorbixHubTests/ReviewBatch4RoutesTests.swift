import XCTest
@testable import NorbixHub
import NorbixCore

/// Review batch 4 (gateway refactoringV2 c21fcfbce): one team member, one
/// user's AI plan, the new workflow filters, and `rememberMe` / the renewed
/// session token on the Hub client.
final class ReviewBatch4RoutesTests: XCTestCase {
    private func makeClient(_ mock: MockHTTPExecutor) throws -> NorbixHubClient {
        try NorbixHubClient(projectId: "proj", bearerToken: "token", accountId: "acc", executor: mock)
    }

    private func query(_ mock: MockHTTPExecutor) throws -> [String: String] {
        let url = try XCTUnwrap(mock.lastRequest?.url)
        let items = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems ?? []
        return Dictionary(uniqueKeysWithValues: items.map { ($0.name, $0.value ?? "") })
    }

    func testGetTeamMember() async throws {
        let mock = MockHTTPExecutor()
        _ = try await makeClient(mock).account.getTeamMember(["memberId": "usr_7"])
        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/account/team/member/usr_7")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testGetUserAiPlan() async throws {
        let mock = MockHTTPExecutor()
        _ = try await makeClient(mock).membership.getUserAiPlan(["userId": "usr_1"])
        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/membership/users/usr_1/ai-plan")
    }

    func testWorkflowsSearchGoesToTheQuery() async throws {
        let mock = MockHTTPExecutor()
        _ = try await makeClient(mock).code.getCodeWorkflows(["search": "invoice", "pageSize": 10])
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/code/workflows")
        XCTAssertEqual(try query(mock), ["search": "invoice", "pageSize": "10"])
    }

    func testWorkflowRunsVersionFilterGoesToTheQuery() async throws {
        let mock = MockHTTPExecutor()
        _ = try await makeClient(mock).code.getCodeWorkflowRuns(["id": "wf_1", "workflowVersion": 3])
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/code/workflows/wf_1/runs")
        XCTAssertEqual(try query(mock), ["workflowVersion": "3"])
    }

    func testLoginSendsRememberMe() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"bearerToken":"jwt-1"}"#.utf8)
        _ = try await makeClient(mock).login(.init(userName: "a@b.c", password: "pw", rememberMe: true))
        let data = try XCTUnwrap(mock.lastRequest?.httpBody)
        let body = try XCTUnwrap(JSONSerialization.jsonObject(with: data) as? [String: Any])
        XCTAssertEqual(body["rememberMe"] as? Bool, true)
    }

    func testRenewedTokenIsSwappedOnTheHubToo() async throws {
        let mock = MockHTTPExecutor()
        mock.responseQueue = [
            (200, Data("{}".utf8), ["norbix-session-token": "token-2"]),
            (200, Data("{}".utf8), [:]),
        ]
        let client = try makeClient(mock)
        _ = try await client.account.getAccountProfile()
        _ = try await client.account.getAccountProfile()
        XCTAssertEqual(mock.capturedRequests[1].value(forHTTPHeaderField: "Authorization"), "Bearer token-2")
    }
}
