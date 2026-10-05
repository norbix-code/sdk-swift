import XCTest
@testable import NorbixHub
import NorbixCore

final class NorbixHubClientTests: XCTestCase {
    func testDefaultBaseUrlIsProductionHub() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixHubClient(
            projectId: "p1",
            apiKey: "key",
            executor: mock
        )
        _ = try await client.echo.echo([:])
        XCTAssertTrue(
            mock.lastRequest?.url?.absoluteString.hasPrefix("https://hub.norbix.ai") == true,
            "expected default hub.norbix.ai, got \(mock.lastRequest?.url?.absoluteString ?? "nil")"
        )
    }

    func testCustomBaseUrlForLocalDev() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixHubClient(
            projectId: "p1",
            apiKey: "key",
            baseUrl: "http://localhost:5000",
            executor: mock
        )
        _ = try await client.echo.echo([:])
        XCTAssertTrue(
            mock.lastRequest?.url?.absoluteString.hasPrefix("http://localhost:5000") == true
        )
    }

    func testAccountModuleExists() async throws {
        let client = try NorbixHubClient(
            projectId: "p1",
            apiKey: "key",
            executor: MockHTTPExecutor()
        )
        // No hub.account call needs accountId: the signed-in ones work with a
        // token only (HubAccountTokenOnlyScopeTests), and sign-up, invitation,
        // regions and verify need no token at all (HubAccountNoTokenScopeTests).
        // Here we just assert the module exists.
        XCTAssertNotNil(client.account)
    }
}
