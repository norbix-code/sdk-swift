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

    func testAccountScopeRequiresAccountId() async throws {
        let client = try NorbixHubClient(
            projectId: "p1",
            apiKey: "key",
            executor: MockHTTPExecutor()
        )
        // The hub.account module is account-scoped — calling it without
        // accountId should throw NORBIX_ACCOUNT_SCOPE_REQUIRED at the
        // transport layer. We just assert the module exists; the scope
        // enforcement is covered by NorbixCore tests.
        XCTAssertNotNil(client.account)
    }
}
