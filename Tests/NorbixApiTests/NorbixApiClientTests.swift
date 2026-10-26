import XCTest
@testable import NorbixApi
import NorbixCore

final class NorbixApiClientTests: XCTestCase {
    func testAuthenticationState() async throws {
        let client = try NorbixApiClient(
            projectId: "p1",
            apiKey: "key",
            executor: MockHTTPExecutor()
        )
        XCTAssertTrue(client.isAuthenticated)
        client.setApiKey(nil)
        XCTAssertFalse(client.isAuthenticated)
        client.setBearerToken("jwt")
        XCTAssertTrue(client.isAuthenticated)
    }

    func testLoginStoresBearerToken() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data("{\"bearerToken\":\"new-token\"}".utf8)
        let client = try NorbixApiClient(projectId: "p1", executor: mock)
        let result: AuthResponse = try await client.login(
            LoginCredentials(userName: "alice", password: "secret")
        )
        XCTAssertEqual(result.bearerToken, "new-token")
        XCTAssertTrue(client.isAuthenticated)
    }

    /// Gateway 2.3.9 (N-29) puts the login's credential version in
    /// `meta.credentialVersion`; the typed answer carries it, and a gateway
    /// that sends no `meta` (or another shape of it) still logs in.
    func testLoginReadsCredentialVersionFromMeta() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"bearerToken":"t","userId":"usr_1","meta":{"credentialVersion":"cv_7","other":"x"}}"#.utf8)
        let client = try NorbixApiClient(projectId: "p1", executor: mock)
        let result = try await client.login(LoginCredentials(userName: "alice", password: "secret"))
        XCTAssertEqual(result.credentialVersion, "cv_7")
        XCTAssertEqual(result.userId, "usr_1")

        mock.responseBody = Data(#"{"bearerToken":"t2","meta":{"count":3}}"#.utf8)
        let noVersion = try await client.login(LoginCredentials(userName: "alice", password: "secret"))
        XCTAssertEqual(noVersion.bearerToken, "t2")
        XCTAssertNil(noVersion.credentialVersion)

        // Round trip: the version is written back under `meta`.
        let encoded = try JSONEncoder().encode(result)
        let decoded = try JSONDecoder().decode(AuthResponse.self, from: encoded)
        XCTAssertEqual(decoded, result)
    }

    func testDefaultBaseUrlIsProductionApi() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixApiClient(
            projectId: "p1",
            apiKey: "key",
            executor: mock
        )
        _ = try await client.echo.echo([:])
        XCTAssertTrue(
            mock.lastRequest?.url?.absoluteString.hasPrefix("https://api.norbix.ai") == true,
            "expected default api.norbix.ai, got \(mock.lastRequest?.url?.absoluteString ?? "nil")"
        )
    }

    func testCustomBaseUrlForSelfHosted() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixApiClient(
            projectId: "p1",
            apiKey: "key",
            baseUrl: "https://api.norbix.isidos.lt",
            executor: mock
        )
        _ = try await client.echo.echo([:])
        XCTAssertTrue(
            mock.lastRequest?.url?.absoluteString.hasPrefix("https://api.norbix.isidos.lt") == true
        )
    }

    func testThrowsWhenProjectIdMissing() {
        XCTAssertThrowsError(try NorbixApiClient(executor: MockHTTPExecutor())) { error in
            guard let nbx = error as? NorbixError else {
                XCTFail("expected NorbixError, got \(error)")
                return
            }
            XCTAssertEqual(nbx.code, "NORBIX_CONFIG_INVALID")
        }
    }
}
