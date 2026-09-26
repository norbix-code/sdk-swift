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

    // An account owner logs in and lists projects before choosing one.
    func testLoginAndAccountCallsWorkWithoutProjectOrAccountId() async throws {
        let mock = MockHTTPExecutor()
        mock.responseQueue = [
            (200, Data(#"{"bearerToken":"tok"}"#.utf8), [:]),
            (200, Data(#"{"list":[]}"#.utf8), [:])
        ]
        let client = try NorbixHubClient(baseUrl: "http://localhost:5001", version: "v3", executor: mock)

        _ = try await client.login(LoginCredentials(userName: "a@b.c", password: "pw"))
        _ = try await client.account.getProjects()

        let projects = mock.capturedRequests[1]
        XCTAssertEqual(projects.url?.absoluteString, "http://localhost:5001/v3/account/projects")
        XCTAssertEqual(projects.value(forHTTPHeaderField: "Authorization"), "Bearer tok")
        XCTAssertNil(projects.value(forHTTPHeaderField: "X-CM-ProjectId"))
        XCTAssertNil(projects.value(forHTTPHeaderField: "X-CM-AccountId"))
    }

    func testProjectCallWithoutProjectThrowsUntilScopeIsSet() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixHubClient(bearerToken: "tok", executor: mock)

        do {
            _ = try await client.echo.echo([:])
            XCTFail("expected NORBIX_PROJECT_SCOPE_REQUIRED")
        } catch let error as NorbixError {
            XCTAssertEqual(error.code, "NORBIX_PROJECT_SCOPE_REQUIRED")
        }
        XCTAssertNil(mock.lastRequest, "nothing should be sent without a project")

        client.setScope(projectId: "p1")
        _ = try await client.echo.echo([:])
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "X-CM-ProjectId"), "p1")
    }
}
