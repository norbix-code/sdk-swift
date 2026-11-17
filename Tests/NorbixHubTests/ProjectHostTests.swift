import XCTest
@testable import NorbixHub
import NorbixCore

/// Hub calls never move to a project's own host: they stay on the shared
/// (or regional) Hub address — devops docs/tasks/clients-project-host.md.
final class ProjectHostTests: XCTestCase {
    private let germany = "pr_3vlTD52e9VK8lXzdv0SmWG"

    func testHubCallsStayOnTheSharedHost() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixHubClient(projectId: germany, apiKey: "k", accountId: "a1", executor: mock)

        _ = try await client.regions.getAccountRegions([:])

        XCTAssertEqual(mock.lastRequest?.url?.host, "hub.norbix.ai")
        XCTAssertEqual(mock.lastRequest?.url?.path.hasSuffix("/account/regions"), true)
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "norbix-project-id"), germany)
    }

    func testWithARegionHubCallsUseTheRegionalHost() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixHubClient(
            projectId: germany, apiKey: "k", accountId: "a1", region: "nb-eu-germany", executor: mock
        )

        _ = try await client.regions.getAccountRegions([:])
        XCTAssertEqual(mock.lastRequest?.url?.host, "nb-eu-germany.hub.norbix.ai")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "nb-region"), "nb-eu-germany")

        client.setRegion(nil)
        _ = try await client.regions.getAccountRegions([:])
        XCTAssertEqual(mock.lastRequest?.url?.host, "hub.norbix.ai")
    }

    func testACustomHubUrlIsNeverRewritten() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixHubClient(
            projectId: germany, apiKey: "k", accountId: "a1",
            region: "nb-eu-germany", baseUrl: "https://hub.norbix.io", executor: mock
        )

        _ = try await client.regions.getAccountRegions([:])

        XCTAssertEqual(mock.lastRequest?.url?.host, "hub.norbix.io")
    }
}
