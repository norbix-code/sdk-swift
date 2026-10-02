import XCTest
@testable import NorbixHub
import NorbixCore

/// Every wave-3 route on `account` and the method that calls it, checked on
/// the mock executor (verb, resolved path, auth and project headers). Never a
/// real gateway, never a real provider.
final class HubAccountAiRoutesTests: XCTestCase {
    private typealias Case = (name: String, verb: String, path: String, call: (NorbixHubClient) async throws -> Void)

    private let cases: [Case] = [
            ("getProjectAiSettings", "GET", "/v2/account/projects/projectId1/ai/settings", { c in _ = try await c.account.getProjectAiSettings(["projectId": "projectId1", "probe": "value"]) }),
            ("updateProjectAiSettings", "PUT", "/v2/account/projects/projectId1/ai/settings", { c in _ = try await c.account.updateProjectAiSettings(["projectId": "projectId1", "probe": "value"]) }),
            ("createProjectAiAssistant", "POST", "/v2/account/projects/projectId1/ai/assistants", { c in _ = try await c.account.createProjectAiAssistant(["projectId": "projectId1", "probe": "value"]) }),
            ("updateProjectAiAssistant", "PUT", "/v2/account/projects/projectId1/ai/assistants/assistantId1", { c in _ = try await c.account.updateProjectAiAssistant(["projectId": "projectId1", "assistantId": "assistantId1", "probe": "value"]) }),
            ("deleteProjectAiAssistant", "DELETE", "/v2/account/projects/projectId1/ai/assistants/assistantId1", { c in _ = try await c.account.deleteProjectAiAssistant(["projectId": "projectId1", "assistantId": "assistantId1", "probe": "value"]) }),
            ("getProjectAiUsage", "GET", "/v2/account/projects/projectId1/ai/usage", { c in _ = try await c.account.getProjectAiUsage(["projectId": "projectId1", "probe": "value"]) }),
            ("setAdminPortalEnabled", "PUT", "/v2/account/projects/projectId1/admin-portal/enabled", { c in _ = try await c.account.setAdminPortalEnabled(["projectId": "projectId1", "probe": "value"]) }),
    ]

    func testEveryRouteHitsTheExpectedPathAndVerb() async throws {
        XCTAssertEqual(cases.count, 7)
        for c in cases {
            let mock = MockHTTPExecutor()
            mock.responseBody = Data(#"{"responseStatus":{}}"#.utf8)
            let client = try NorbixHubClient(projectId: "proj", bearerToken: "token", accountId: "acc", executor: mock)
            try await c.call(client)
            XCTAssertEqual(mock.lastRequest?.httpMethod, c.verb, c.name)
            XCTAssertEqual(mock.lastRequest?.url?.path, c.path, c.name)
            XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token", c.name)
            XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "X-CM-ProjectId"), "proj", c.name)
        }
    }
}
