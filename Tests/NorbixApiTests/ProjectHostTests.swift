import XCTest
@testable import NorbixApi
import NorbixCore

/// On the SDK's default address every API call of a project goes to the
/// project's own host — devops docs/tasks/clients-project-host.md.
final class ProjectHostTests: XCTestCase {
    private let virginia = "pr_5XvmrTA6JVggZdmEE5bGdm"
    private let virginiaHost = "pr-022c4aca9f9e4df787ab0a20c83c44b6.api.norbix.ai"
    private let germany = "pr_3vlTD52e9VK8lXzdv0SmWG"
    private let germanyHost = "pr-184336d00e2141c3be5138e8dcf52e81.api.norbix.ai"

    private func header(_ mock: MockHTTPExecutor, _ name: String) -> String? {
        mock.lastRequest?.value(forHTTPHeaderField: name)
    }

    // MARK: - Default base URL

    func testApiCallsGoToTheProjectHostAndStillSendTheProjectHeader() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixApiClient(projectId: virginia, apiKey: "k", executor: mock)

        _ = try await client.database.find(["collectionName": "orders"])

        XCTAssertEqual(mock.lastRequest?.url?.scheme, "https")
        XCTAssertEqual(mock.lastRequest?.url?.host, virginiaHost)
        XCTAssertEqual(mock.lastRequest?.url?.path.hasPrefix("/v3/"), true)
        XCTAssertEqual(header(mock, "norbix-project-id"), virginia)
        XCTAssertNil(header(mock, "nb-region"))
    }

    func testAClientBuiltFromAConfigOnTheDefaultAddressUsesTheProjectHost() async throws {
        let mock = MockHTTPExecutor()
        let config = try NorbixConfig.fromEnvironment(
            target: .api,
            environment: ["NORBIX_PROJECT_ID": germany, "NORBIX_API_KEY": "k"]
        )
        let client = NorbixApiClient(config: config, executor: mock)

        _ = try await client.echo.echo([:])

        XCTAssertEqual(mock.lastRequest?.url?.host, germanyHost)
        XCTAssertEqual(header(mock, "norbix-project-id"), germany)
    }

    func testLoginGoesToTheProjectHost() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"bearerToken":"t"}"#.utf8)
        let client = try NorbixApiClient(projectId: virginia, executor: mock)

        _ = try await client.login(LoginCredentials(userName: "alice", password: "x"))

        XCTAssertEqual(mock.lastRequest?.url?.host, virginiaHost)
        XCTAssertEqual(mock.lastRequest?.url?.path, "/auth")
    }

    func testAProjectIdThatIsNotANorbixIdKeepsTheSharedHost() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixApiClient(projectId: "p1", apiKey: "k", executor: mock)

        _ = try await client.database.find(["collectionName": "orders"])

        XCTAssertEqual(mock.lastRequest?.url?.host, "api.norbix.ai")
        XCTAssertEqual(header(mock, "norbix-project-id"), "p1")
    }

    func testSetScopeMovesTheCallsToTheNewProjectHostAndHeaderAgree() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixApiClient(projectId: virginia, apiKey: "k", executor: mock)

        client.setScope(projectId: germany)
        _ = try await client.database.find(["collectionName": "orders"])
        XCTAssertEqual(mock.lastRequest?.url?.host, germanyHost)
        XCTAssertEqual(header(mock, "norbix-project-id"), germany)

        client.setScope(projectId: "p1")
        _ = try await client.database.find(["collectionName": "orders"])
        XCTAssertEqual(mock.lastRequest?.url?.host, "api.norbix.ai")
        XCTAssertEqual(header(mock, "norbix-project-id"), "p1")

        client.setScope(projectId: virginia)
        _ = try await client.database.find(["collectionName": "orders"])
        XCTAssertEqual(mock.lastRequest?.url?.host, virginiaHost)
        XCTAssertEqual(header(mock, "norbix-project-id"), virginia)
    }

    func testTheSocialSignInLinkStaysOnTheSharedHost() throws {
        let client = try NorbixApiClient(projectId: virginia, apiKey: "k", executor: MockHTTPExecutor())

        let url = try XCTUnwrap(URL(string: client.membership.socialSignInUrl("google")))

        XCTAssertEqual(url.host, "api.norbix.ai")
        XCTAssertEqual(url.path, "/v3/membership/auth/social/google")
        XCTAssertEqual(url.query, "projectId=\(virginia)")
    }

    // MARK: - With a region

    func testWithARegionTheApiHostHasNoRegionLabelAndTheHeaderIsStillSent() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixApiClient(
            projectId: germany, apiKey: "k", region: "nb-eu-germany", executor: mock
        )

        _ = try await client.database.find(["collectionName": "orders"])

        XCTAssertEqual(mock.lastRequest?.url?.host, germanyHost)
        XCTAssertEqual(header(mock, "nb-region"), "nb-eu-germany")
        XCTAssertEqual(header(mock, "norbix-project-id"), germany)
    }

    func testSetRegionDoesNotChangeTheProjectHost() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixApiClient(projectId: germany, apiKey: "k", executor: mock)

        client.setRegion("nb-eu-germany")
        _ = try await client.database.find(["collectionName": "orders"])
        XCTAssertEqual(mock.lastRequest?.url?.host, germanyHost)
        XCTAssertEqual(header(mock, "nb-region"), "nb-eu-germany")

        client.setRegion(nil)
        _ = try await client.database.find(["collectionName": "orders"])
        XCTAssertEqual(mock.lastRequest?.url?.host, germanyHost)
        XCTAssertNil(header(mock, "nb-region"))
    }

    func testWithARegionAnIdThatDoesNotDecodeKeepsTheRegionalHost() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixApiClient(
            projectId: "p1", apiKey: "k", region: "nb-eu-germany", executor: mock
        )

        _ = try await client.database.find(["collectionName": "orders"])
        XCTAssertEqual(mock.lastRequest?.url?.host, "nb-eu-germany.api.norbix.ai")
        XCTAssertEqual(header(mock, "nb-region"), "nb-eu-germany")

        client.setRegion(nil)
        _ = try await client.database.find(["collectionName": "orders"])
        XCTAssertEqual(mock.lastRequest?.url?.host, "api.norbix.ai")
    }

    func testTheSocialSignInLinkUsesTheRegionalSharedHost() throws {
        let client = try NorbixApiClient(
            projectId: germany, apiKey: "k", region: "nb-eu-germany", executor: MockHTTPExecutor()
        )

        let url = try XCTUnwrap(URL(string: client.membership.socialSignInUrl("google")))

        XCTAssertEqual(url.host, "nb-eu-germany.api.norbix.ai")
        XCTAssertEqual(url.path, "/v3/membership/auth/social/google")
    }

    // MARK: - A custom base URL is never rewritten

    func testACustomBaseUrlIsNeverRewritten() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixApiClient(
            projectId: virginia, apiKey: "k", region: "nb-eu-germany",
            baseUrl: "https://api.norbix.io", executor: mock
        )

        _ = try await client.database.find(["collectionName": "orders"])
        XCTAssertEqual(mock.lastRequest?.url?.host, "api.norbix.io")
        XCTAssertEqual(header(mock, "norbix-project-id"), virginia)
        XCTAssertEqual(header(mock, "nb-region"), "nb-eu-germany")

        client.setScope(projectId: germany)
        _ = try await client.database.find(["collectionName": "orders"])
        XCTAssertEqual(mock.lastRequest?.url?.host, "api.norbix.io")
        XCTAssertEqual(header(mock, "norbix-project-id"), germany)

        client.setRegion(nil)
        _ = try await client.echo.echo([:])
        XCTAssertEqual(mock.lastRequest?.url?.host, "api.norbix.io")

        let link = try XCTUnwrap(URL(string: client.membership.socialSignInUrl("google")))
        XCTAssertEqual(link.host, "api.norbix.io")
    }

    func testACustomBaseUrlInAConfigIsNeverRewritten() async throws {
        let mock = MockHTTPExecutor()
        let config = try NorbixConfig.fromEnvironment(
            target: .api,
            environment: [
                "NORBIX_PROJECT_ID": virginia,
                "NORBIX_API_KEY": "k",
                "NORBIX_API_URL": "http://localhost:5002"
            ]
        )
        let client = NorbixApiClient(config: config, executor: mock)

        _ = try await client.database.find(["collectionName": "orders"])

        XCTAssertEqual(mock.lastRequest?.url?.host, "localhost")
        XCTAssertEqual(mock.lastRequest?.url?.port, 5002)
        XCTAssertEqual(header(mock, "norbix-project-id"), virginia)
    }
}
