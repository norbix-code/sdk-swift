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

    /// The gateway reads the caller's project id only from `norbix-project-id` and the account
    /// id only from `norbix-account-id`; the old `X-CM-ProjectId` / `X-CM-AccountId` names are
    /// not read, so they are never sent (same as the TypeScript SDK).
    func testSendsNorbixProjectAndAccountIdHeaders() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixHubClient(projectId: "p1", bearerToken: "token", executor: mock)
        client.setScope(projectId: "p1", accountId: "acc_1")

        _ = try await client.echo.echo([:])

        let request = try XCTUnwrap(mock.lastRequest)
        XCTAssertEqual(request.value(forHTTPHeaderField: "norbix-project-id"), "p1")
        XCTAssertEqual(request.value(forHTTPHeaderField: "norbix-account-id"), "acc_1")
        XCTAssertNil(request.value(forHTTPHeaderField: "X-CM-ProjectId"))
        XCTAssertNil(request.value(forHTTPHeaderField: "X-CM-AccountId"))
        XCTAssertNil(request.value(forHTTPHeaderField: "nb-project-id"))
    }

    /// No account id (nil or empty) sends no account header at all.
    func testSendsNoAccountIdHeaderWithoutAnAccountId() async throws {
        for accountId in [nil, ""] as [String?] {
            let mock = MockHTTPExecutor()
            let client = try NorbixHubClient(projectId: "p1", bearerToken: "token", executor: mock)
            client.setScope(projectId: "p1", accountId: accountId)

            _ = try await client.echo.echo([:])

            let request = try XCTUnwrap(mock.lastRequest)
            XCTAssertEqual(request.value(forHTTPHeaderField: "norbix-project-id"), "p1")
            XCTAssertNil(request.value(forHTTPHeaderField: "norbix-account-id"))
            XCTAssertNil(request.value(forHTTPHeaderField: "X-CM-AccountId"))
        }
    }
}
