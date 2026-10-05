import XCTest
@testable import NorbixHub
import NorbixCore

/// The signed-in team member's own record (`GET /account/me`) and own phone number
/// (`PUT /account/me/phone`) on `account`, checked on the mock executor (verb,
/// resolved path, auth header, body). Never a real gateway.
final class HubAccountMeRoutesTests: XCTestCase {
    private func makeClient(_ mock: MockHTTPExecutor) throws -> NorbixHubClient {
        mock.responseBody = Data(#"{"responseStatus":{}}"#.utf8)
        return try NorbixHubClient(projectId: "proj", bearerToken: "token", accountId: "acc", executor: mock)
    }

    func testGetMyAccountUserProfile() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.account.getMyAccountUserProfile()

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/account/me")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testUpdateMyAccountUserPhoneSendsThePhoneInThePutBody() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.account.updateMyAccountUserPhone(["phone": "+37060000000"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/account/me/phone")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
        let data = try XCTUnwrap(mock.lastRequest?.httpBody)
        let body = try XCTUnwrap(JSONSerialization.jsonObject(with: data) as? [String: Any])
        XCTAssertEqual(body["phone"] as? String, "+37060000000")
    }
}
