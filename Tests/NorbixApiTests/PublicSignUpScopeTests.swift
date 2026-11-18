import XCTest
@testable import NorbixApi
import NorbixCore

/// The routes the gateway does not authenticate — public sign-up and the
/// password reset request — go out from a client that has no API key and no
/// bearer token. A token is sent when the client has one, never required;
/// the project id header is always sent. A route that needs sign-in still
/// refuses before anything is sent.
final class PublicSignUpScopeTests: XCTestCase {

    private static let projectId = "proj_signup"

    /// A client with a project id and no credentials. Built from a config so
    /// `NORBIX_API_KEY` / `NORBIX_BEARER_TOKEN` in the process environment
    /// cannot leak in.
    private func makeClient(_ mock: MockHTTPExecutor, auth: NorbixAuth = .unauthenticated) throws -> NorbixApiClient {
        let config = try NorbixConfig(
            projectId: Self.projectId,
            auth: auth,
            baseUrl: "https://gateway.example.test",
            version: "v2"
        )
        return NorbixApiClient(config: config, executor: mock)
    }

    func testSaveEmailUserGoesOutWithNoToken() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.membership.saveEmailUser(["email": "new@example.test", "password": "secret1"])

        XCTAssertEqual(mock.capturedRequests.count, 1)
        let sent = try XCTUnwrap(mock.lastRequest)
        XCTAssertEqual(sent.httpMethod, "POST")
        XCTAssertEqual(sent.url?.absoluteString, "https://gateway.example.test/v2/membership/auth/register/email")
        XCTAssertEqual(sent.url?.path, "/v2/membership/auth/register/email")
        XCTAssertNil(sent.value(forHTTPHeaderField: "Authorization"))
        XCTAssertEqual(sent.value(forHTTPHeaderField: "norbix-project-id"), "proj_signup")

        let body = try XCTUnwrap(sent.httpBody)
        let json = try XCTUnwrap(JSONSerialization.jsonObject(with: body) as? [String: String])
        XCTAssertEqual(json, ["email": "new@example.test", "password": "secret1"])
    }

    func testSaveUserNameUserGoesOutWithNoToken() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.membership.saveUserNameUser(["userName": "newbie", "password": "secret1"])

        XCTAssertEqual(mock.capturedRequests.count, 1)
        let sent = try XCTUnwrap(mock.lastRequest)
        XCTAssertEqual(sent.httpMethod, "POST")
        XCTAssertEqual(sent.url?.path, "/v2/membership/auth/register/user-name")
        XCTAssertNil(sent.value(forHTTPHeaderField: "Authorization"))
        XCTAssertEqual(sent.value(forHTTPHeaderField: "norbix-project-id"), "proj_signup")
    }

    func testRequestPasswordResetGoesOutWithNoToken() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.membership.requestPasswordReset(["email": "new@example.test"])

        XCTAssertEqual(mock.capturedRequests.count, 1)
        let sent = try XCTUnwrap(mock.lastRequest)
        XCTAssertEqual(sent.httpMethod, "POST")
        XCTAssertEqual(sent.url?.path, "/v2/membership/userauth/password/reset/request")
        XCTAssertNil(sent.value(forHTTPHeaderField: "Authorization"))
        XCTAssertEqual(sent.value(forHTTPHeaderField: "norbix-project-id"), "proj_signup")
    }

    func testConfirmPasswordResetGoesOutWithNoToken() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.membership.confirmPasswordReset(["token": "t1", "password": "secret2"])

        XCTAssertEqual(mock.capturedRequests.count, 1)
        let sent = try XCTUnwrap(mock.lastRequest)
        XCTAssertEqual(sent.httpMethod, "POST")
        XCTAssertEqual(sent.url?.path, "/v2/membership/userauth/password/reset/confirm")
        XCTAssertNil(sent.value(forHTTPHeaderField: "Authorization"))
    }

    func testSaveEmailUserCarriesTheApiKeyWhenTheClientHasOne() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock, auth: .apiKey("key_123"))

        _ = try await client.membership.saveEmailUser(["email": "new@example.test", "password": "secret1"])

        XCTAssertEqual(mock.capturedRequests.count, 1)
        let sent = try XCTUnwrap(mock.lastRequest)
        XCTAssertEqual(sent.url?.path, "/v2/membership/auth/register/email")
        XCTAssertEqual(sent.value(forHTTPHeaderField: "Authorization"), "Bearer key_123")
        XCTAssertEqual(sent.value(forHTTPHeaderField: "norbix-project-id"), "proj_signup")
    }

    func testSaveEmailUserCarriesThePerCallBearerToken() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.membership.saveEmailUser(["email": "new@example.test"], bearerToken: "call_token")

        let sent = try XCTUnwrap(mock.lastRequest)
        XCTAssertEqual(sent.value(forHTTPHeaderField: "Authorization"), "Bearer call_token")
    }

    func testBlockUserStillNeedsSignInAndSendsNothing() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        do {
            _ = try await client.membership.blockUser(["id": "usr_1"])
            XCTFail("expected NORBIX_NOT_AUTHENTICATED")
        } catch let error as NorbixError {
            XCTAssertEqual(error.code, "NORBIX_NOT_AUTHENTICATED")
            XCTAssertEqual(error.message, "Not authenticated. Set apiKey or bearerToken.")
        }
        XCTAssertEqual(mock.capturedRequests.count, 0)
        XCTAssertNil(mock.lastRequest)
    }
}
