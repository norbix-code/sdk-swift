import XCTest
@testable import NorbixApi
import NorbixCore

/// A project's API calls go to its own host wherever the address serves one
/// (the SDK default, a norbix.ai address written out, a `{projectHostLabel}`
/// template, a pasted project host); any other address is used as given —
/// devops docs/tasks/clients-project-host.md, rounds 1 and 2.
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

    // MARK: - Another address is used as given

    func testAnotherBaseUrlIsUsedAsGiven() async throws {
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

    func testAnotherBaseUrlInAConfigIsUsedAsGiven() async throws {
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

    func testAPlainOwnDomainStagingLocalhostAndHttpNorbixAiAreUsedAsGiven() async throws {
        for address in [
            "https://api.customer.com",
            "https://api.norbix.io",
            "http://localhost:5002",
            "http://api.norbix.ai"
        ] {
            let mock = MockHTTPExecutor()
            let client = try NorbixApiClient(
                projectId: virginia, apiKey: "k", baseUrl: address, executor: mock
            )
            _ = try await client.database.find(["collectionName": "orders"])

            let given = try XCTUnwrap(URLComponents(string: address))
            let url = try XCTUnwrap(mock.lastRequest?.url)
            XCTAssertEqual(url.scheme, given.scheme, address)
            XCTAssertEqual(url.host, given.host, address)
            XCTAssertEqual(url.port, given.port, address)
            XCTAssertEqual(url.path.hasPrefix("/v3/"), true, address)
        }
    }

    // MARK: - A norbix.ai address written out (round 2)

    func testTheDefaultAddressWrittenOutGoesToTheProjectHost() async throws {
        let mock = MockHTTPExecutor()
        let config = try NorbixConfig.fromEnvironment(
            target: .api,
            environment: [
                "NORBIX_PROJECT_ID": virginia,
                "NORBIX_API_KEY": "k",
                "NORBIX_API_URL": "https://api.norbix.ai"
            ]
        )
        let client = NorbixApiClient(config: config, executor: mock)

        _ = try await client.database.find(["collectionName": "orders"])

        XCTAssertEqual(mock.lastRequest?.url?.host, virginiaHost)
    }

    func testARegionalNorbixAiAddressWrittenOutGoesToTheProjectHost() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixApiClient(
            projectId: germany, apiKey: "k",
            baseUrl: "https://nb-eu-germany.api.norbix.ai", executor: mock
        )

        _ = try await client.database.find(["collectionName": "orders"])
        XCTAssertEqual(mock.lastRequest?.url?.scheme, "https")
        XCTAssertEqual(mock.lastRequest?.url?.host, germanyHost)
        XCTAssertEqual(mock.lastRequest?.url?.path.hasPrefix("/v3/"), true)
        XCTAssertEqual(header(mock, "norbix-project-id"), germany)

        let link = try XCTUnwrap(URL(string: client.membership.socialSignInUrl("google")))
        XCTAssertEqual(link.host, "nb-eu-germany.api.norbix.ai")
        XCTAssertEqual(link.path, "/v3/membership/auth/social/google")
    }

    // MARK: - An install on its own domain (round 2)

    private let template = "https://{projectHostLabel}.api.customer.com"

    func testATemplateIsFilledWithTheLabelAndFollowsSetScope() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixApiClient(
            projectId: virginia, apiKey: "k", baseUrl: template, executor: mock
        )

        _ = try await client.database.find(["collectionName": "orders"])
        XCTAssertEqual(mock.lastRequest?.url?.scheme, "https")
        XCTAssertEqual(mock.lastRequest?.url?.host, "pr-022c4aca9f9e4df787ab0a20c83c44b6.api.customer.com")
        XCTAssertEqual(mock.lastRequest?.url?.path.hasPrefix("/v3/"), true)
        XCTAssertEqual(header(mock, "norbix-project-id"), virginia)

        client.setScope(projectId: germany)
        _ = try await client.database.find(["collectionName": "orders"])
        XCTAssertEqual(mock.lastRequest?.url?.host, "pr-184336d00e2141c3be5138e8dcf52e81.api.customer.com")
        XCTAssertEqual(header(mock, "norbix-project-id"), germany)

        let link = try XCTUnwrap(URL(string: client.membership.socialSignInUrl("google")))
        XCTAssertEqual(link.host, "api.customer.com")
        XCTAssertEqual(link.path, "/v3/membership/auth/social/google")
        XCTAssertEqual(link.query, "projectId=\(germany)")
    }

    func testATemplateFromTheEnvironmentWithAPort() async throws {
        let mock = MockHTTPExecutor()
        let config = try NorbixConfig.fromEnvironment(
            target: .api,
            environment: [
                "NORBIX_PROJECT_ID": virginia,
                "NORBIX_API_KEY": "k",
                "NORBIX_API_URL": "http://{projectHostLabel}.api.local.norbix.test:8443"
            ]
        )
        let client = NorbixApiClient(config: config, executor: mock)

        _ = try await client.database.find(["collectionName": "orders"])

        let url = try XCTUnwrap(mock.lastRequest?.url)
        XCTAssertEqual(url.scheme, "http")
        XCTAssertEqual(url.host, "pr-022c4aca9f9e4df787ab0a20c83c44b6.api.local.norbix.test")
        XCTAssertEqual(url.port, 8443)
        XCTAssertEqual(url.path.hasPrefix("/v3/"), true)
    }

    func testATemplateWithAnIdThatIsNotANorbixIdDropsTheLabel() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixApiClient(
            projectId: "p1", apiKey: "k", baseUrl: template, executor: mock
        )

        _ = try await client.database.find(["collectionName": "orders"])

        XCTAssertEqual(mock.lastRequest?.url?.host, "api.customer.com")
        XCTAssertEqual(header(mock, "norbix-project-id"), "p1")
    }

    func testAPastedProjectHostFollowsTheClientsProject() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixApiClient(
            projectId: germany, apiKey: "k",
            baseUrl: "https://pr-022c4aca9f9e4df787ab0a20c83c44b6.api.customer.com", executor: mock
        )

        _ = try await client.database.find(["collectionName": "orders"])
        XCTAssertEqual(mock.lastRequest?.url?.host, "pr-184336d00e2141c3be5138e8dcf52e81.api.customer.com")
        XCTAssertEqual(header(mock, "norbix-project-id"), germany)

        let link = try XCTUnwrap(URL(string: client.membership.socialSignInUrl("google")))
        XCTAssertEqual(link.host, "api.customer.com")
    }
}
