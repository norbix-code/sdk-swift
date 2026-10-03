import XCTest
@testable import NorbixHub
import NorbixCore

/// Every AI service user route on `account` and the method that calls it, checked on
/// the mock executor (verb, resolved path, auth and project headers). Never a
/// real gateway, never a real provider.
final class HubAccountAiServiceUsersRoutesTests: XCTestCase {
    private typealias Case = (name: String, verb: String, path: String, call: (NorbixHubClient) async throws -> Void)

    private let cases: [Case] = [
            ("createAiServiceUser", "POST", "/v2/account/ai/service-users", { c in _ = try await c.account.createAiServiceUser(["probe": "value"]) }),
            ("listAiServiceUsers", "GET", "/v2/account/ai/service-users", { c in _ = try await c.account.listAiServiceUsers(["probe": "value"]) }),
            ("rotateAiServiceUserKey", "POST", "/v2/account/ai/service-users/su1/keys", { c in _ = try await c.account.rotateAiServiceUserKey(["Id": "su1", "probe": "value"]) }),
            ("revokeAiServiceUserKey", "DELETE", "/v2/account/ai/service-users/su1/keys/key1", { c in _ = try await c.account.revokeAiServiceUserKey(["Id": "su1", "KeyId": "key1", "probe": "value"]) }),
            ("deleteAiServiceUser", "DELETE", "/v2/account/ai/service-users/su1", { c in _ = try await c.account.deleteAiServiceUser(["Id": "su1", "probe": "value"]) }),
    ]

    func testEveryRouteHitsTheExpectedPathAndVerb() async throws {
        XCTAssertEqual(cases.count, 5)
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
