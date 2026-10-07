import XCTest
@testable import NorbixHub
import NorbixCore

/// Every admin-portal and legal settings route on `account` and the method that calls it, checked on
/// the mock executor (verb, resolved path, auth and project headers). Never a
/// real gateway, never a real provider.
final class HubAccountProjectSettingsRoutesTests: XCTestCase {
    private typealias Case = (name: String, verb: String, path: String, call: (NorbixHubClient) async throws -> Void)

    private let cases: [Case] = [
            ("updateProjectAdminUrl", "PATCH", "/v3/account/projects/projectId1/settings/admin-url", { c in _ = try await c.account.updateProjectAdminUrl(["projectId": "projectId1", "probe": "value"]) }),
            ("updateProjectLegalDocuments", "PATCH", "/v3/account/projects/projectId1/settings/legal", { c in _ = try await c.account.updateProjectLegalDocuments(["projectId": "projectId1", "probe": "value"]) }),
            ("updateProjectExposeLegal", "PATCH", "/v3/account/projects/projectId1/settings/legal/expose", { c in _ = try await c.account.updateProjectExposeLegal(["projectId": "projectId1", "probe": "value"]) }),
            ("updateProjectExposeBrand", "PATCH", "/v3/account/projects/projectId1/settings/brand/expose", { c in _ = try await c.account.updateProjectExposeBrand(["projectId": "projectId1", "exposed": true]) }),
            ("updateProjectExposeAuth", "PATCH", "/v3/account/projects/projectId1/settings/auth/expose", { c in _ = try await c.account.updateProjectExposeAuth(["projectId": "projectId1", "exposed": true]) }),
            ("getAdminPortalStructure", "GET", "/v3/account/projects/projectId1/admin-portal/structure", { c in _ = try await c.account.getAdminPortalStructure(["projectId": "projectId1", "probe": "value"]) }),
            ("assignAdminPortalServiceUser", "PUT", "/v3/account/projects/projectId1/settings/admin-portal/service-user", { c in _ = try await c.account.assignAdminPortalServiceUser(["projectId": "projectId1", "probe": "value"]) }),
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
