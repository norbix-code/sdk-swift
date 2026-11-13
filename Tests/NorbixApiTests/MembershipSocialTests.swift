import XCTest
@testable import NorbixApi
import NorbixCore

/// Project social sign-in and link identity (gateway 3fb6f5569): the start URL
/// builder, the code exchange and the two link calls. Each call test pins the
/// exact verb, path and body on the mock executor.
final class MembershipSocialTests: XCTestCase {
    private func makeClient(_ mock: MockHTTPExecutor, env: String = "PROD") throws -> NorbixApiClient {
        try NorbixApiClient(
            projectId: "pr_1", bearerToken: "jwt-1", env: env,
            baseUrl: "https://api.test", executor: mock
        )
    }

    private func body(_ mock: MockHTTPExecutor) throws -> [String: String] {
        let data = try XCTUnwrap(mock.lastRequest?.httpBody)
        return try XCTUnwrap(JSONSerialization.jsonObject(with: data) as? [String: String])
    }

    func testSocialSignInUrlCarriesTheProjectIdAndNoEnvForProd() throws {
        let mock = MockHTTPExecutor()
        let url = try makeClient(mock).membership.socialSignInUrl("google")
        XCTAssertEqual(url, "https://api.test/v3/membership/auth/social/google?projectId=pr_1")
        XCTAssertNil(mock.lastRequest)
    }

    func testSocialSignInUrlEncodesModeAndReturnUrl() throws {
        let url = try makeClient(MockHTTPExecutor()).membership.socialSignInUrl(
            "github",
            mode: "Admin portal & app",
            returnUrl: "https://app.example.com/oauth/callback?next=/a b&x=1"
        )
        XCTAssertEqual(
            url,
            "https://api.test/v3/membership/auth/social/github?projectId=pr_1"
                + "&mode=Admin%20portal%20%26%20app"
                + "&returnUrl=https%3A%2F%2Fapp.example.com%2Foauth%2Fcallback%3Fnext%3D%2Fa%20b%26x%3D1"
        )
        let items = URLComponents(string: url)?.queryItems ?? []
        XCTAssertEqual(items.first { $0.name == "mode" }?.value, "Admin portal & app")
        XCTAssertEqual(
            items.first { $0.name == "returnUrl" }?.value,
            "https://app.example.com/oauth/callback?next=/a b&x=1"
        )
    }

    func testSocialSignInUrlPutsANonProdEnvInTheQuery() throws {
        let url = try makeClient(MockHTTPExecutor(), env: "TEST").membership.socialSignInUrl("okta")
        XCTAssertEqual(url, "https://api.test/v3/membership/auth/social/okta?projectId=pr_1&env=TEST")
    }

    func testSocialSignInUrlEscapesTheProvider() throws {
        let url = try makeClient(MockHTTPExecutor()).membership.socialSignInUrl("a/b")
        XCTAssertEqual(url, "https://api.test/v3/membership/auth/social/a%2Fb?projectId=pr_1")
    }

    func testExchangeSocialSignInCodePostsTheCode() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"bearerToken":"a.b.c","userId":"usr_1"}"#.utf8)
        let res = try await makeClient(mock).membership.exchangeSocialSignInCode(
            ["provider": "google", "code": "one-time"]
        )
        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.absoluteString,
                       "https://api.test/v3/membership/auth/social/google/exchange")
        XCTAssertEqual(try body(mock), ["code": "one-time"])
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "norbix-project-id"), "pr_1")
        XCTAssertEqual((res as? [String: Any])?["bearerToken"] as? String, "a.b.c")
    }

    func testStartLinkIdentityPostsProviderModeAndReturnUrl() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"authorizeUrl":"https://accounts.example/authorize"}"#.utf8)
        _ = try await makeClient(mock).membership.startLinkIdentity([
            "userId": "usr_1", "provider": "google", "mode": "app",
            "returnUrl": "https://app.example.com/settings",
        ])
        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.absoluteString,
                       "https://api.test/v3/membership/auth/usr_1/link-identity/start")
        XCTAssertEqual(try body(mock), [
            "provider": "google", "mode": "app", "returnUrl": "https://app.example.com/settings",
        ])
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer jwt-1")
    }

    func testLinkIdentityPostsTheLinkCode() async throws {
        let mock = MockHTTPExecutor()
        _ = try await makeClient(mock).membership.linkIdentity(["userId": "usr_1", "code": "link-code"])
        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.absoluteString,
                       "https://api.test/v3/membership/auth/usr_1/link-identity")
        XCTAssertEqual(try body(mock), ["code": "link-code"])
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer jwt-1")
    }
}
