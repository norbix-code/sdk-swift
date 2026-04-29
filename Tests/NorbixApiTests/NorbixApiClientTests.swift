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
