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
        XCTAssertNil(projects.value(forHTTPHeaderField: "nb-project-id"))
        XCTAssertNil(projects.value(forHTTPHeaderField: "nb-account-id"))
    }

    // The gateway reads nb-project-id / nb-account-id; it never read X-CM-*.
    func testProjectScopedCallSendsTheGatewayProjectAndAccountHeaders() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"list":[]}"#.utf8)
        let client = try NorbixHubClient(bearerToken: "tok", executor: mock)
        client.setScope(projectId: "prj_1", accountId: "acc_1")

        _ = try await client.membership.getRoles()

        let request = try XCTUnwrap(mock.lastRequest)
        XCTAssertEqual(request.value(forHTTPHeaderField: "nb-project-id"), "prj_1")
        XCTAssertEqual(request.value(forHTTPHeaderField: "nb-account-id"), "acc_1")
        XCTAssertNil(request.value(forHTTPHeaderField: "X-CM-ProjectId"))
        XCTAssertNil(request.value(forHTTPHeaderField: "X-CM-AccountId"))
    }

    // On /auth, norbix-project-id turns the login into a project-user login,
    // so the Hub (account owner) login must never send it.
    func testHubLoginDoesNotSendTheLoginProjectHeader() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"bearerToken":"tok"}"#.utf8)
        let client = try NorbixHubClient(projectId: "prj_1", executor: mock)

        _ = try await client.login(LoginCredentials(userName: "a@b.c", password: "pw"))

        XCTAssertNil(mock.lastRequest?.value(forHTTPHeaderField: "norbix-project-id"))
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
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "nb-project-id"), "p1")
    }
}
