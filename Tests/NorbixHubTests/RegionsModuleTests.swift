import XCTest
@testable import NorbixHub
import NorbixCore

final class RegionsModuleTests: XCTestCase {
    func testUnsetRegionOmitsHeaderAndKeepsDefaultUrl() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixHubClient(projectId: "p1", apiKey: "key", accountId: "a1", executor: mock)
        XCTAssertNil(client.region)
        _ = try await client.regions.getAccountRegions([:])
        XCTAssertNil(mock.lastRequest?.value(forHTTPHeaderField: "nb-region"))
        XCTAssertTrue(
            mock.lastRequest?.url?.absoluteString
                .hasPrefix("https://hub.norbix.ai/") == true
        )
        // `path` rather than `absoluteString` — GET requests may carry a
        // (possibly empty) query component.
        XCTAssertTrue(
            mock.lastRequest?.url?.path
                .hasSuffix("/account/regions") == true
        )
    }

    func testConfiguredRegionSetsHeaderAndComposesUrl() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixHubClient(
            projectId: "p1", apiKey: "key", accountId: "a1",
            region: "nb-eu-germany", executor: mock
        )
        XCTAssertEqual(client.region, "nb-eu-germany")
        _ = try await client.regions.getAccountRegions([:])
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "nb-region"), "nb-eu-germany")
        XCTAssertTrue(
            mock.lastRequest?.url?.absoluteString
                .hasPrefix("https://nb-eu-germany.hub.norbix.ai/") == true
        )
    }

    func testPerCallRegionOverridesHeaderOnly() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixHubClient(
            projectId: "p1", apiKey: "key", accountId: "a1",
            region: "nb-eu-germany", executor: mock
        )
        _ = try await client.regions.getAccountRegions([:], region: "nb-us-east")
        // The override wins for the header...
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "nb-region"), "nb-us-east")
        // ...but never rewrites the request URL.
        XCTAssertTrue(
            mock.lastRequest?.url?.absoluteString
                .hasPrefix("https://nb-eu-germany.hub.norbix.ai/") == true
        )
    }

    func testCustomBaseUrlIsNeverRewritten() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixHubClient(
            projectId: "p1", apiKey: "key", accountId: "a1",
            region: "nb-eu-germany", baseUrl: "http://localhost:5000", executor: mock
        )
        _ = try await client.regions.getAccountRegions([:])
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "nb-region"), "nb-eu-germany")
        XCTAssertTrue(
            mock.lastRequest?.url?.absoluteString
                .hasPrefix("http://localhost:5000/") == true
        )

        // setRegion on a custom base URL changes the header, not the URL.
        client.setRegion("nb-us-east")
        _ = try await client.regions.getAccountRegions([:])
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "nb-region"), "nb-us-east")
        XCTAssertTrue(
            mock.lastRequest?.url?.absoluteString
                .hasPrefix("http://localhost:5000/") == true
        )
    }

    func testSetRegionRuntimeAndUnsetClears() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixHubClient(projectId: "p1", apiKey: "key", accountId: "a1", executor: mock)
        client.setRegion("nb-eu-germany")
        XCTAssertEqual(client.region, "nb-eu-germany")
        _ = try await client.regions.getAccountRegions([:])
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "nb-region"), "nb-eu-germany")
        XCTAssertTrue(
            mock.lastRequest?.url?.absoluteString
                .hasPrefix("https://nb-eu-germany.hub.norbix.ai/") == true
        )

        client.setRegion(nil)
        XCTAssertNil(client.region)
        _ = try await client.regions.getAccountRegions([:])
        XCTAssertNil(mock.lastRequest?.value(forHTTPHeaderField: "nb-region"))
        XCTAssertTrue(
            mock.lastRequest?.url?.absoluteString
                .hasPrefix("https://hub.norbix.ai/") == true
        )
    }

    func testNorbixRegionEnvironmentVariableFallback() async throws {
        let mock = MockHTTPExecutor()
        let config = try NorbixConfig.fromEnvironment(
            target: .hub,
            environment: [
                "NORBIX_PROJECT_ID": "p1",
                "NORBIX_ACCOUNT_ID": "a1",
                "NORBIX_API_KEY": "key",
                "NORBIX_REGION": "nb-eu-germany"
            ]
        )
        let client = NorbixHubClient(config: config, executor: mock)
        XCTAssertEqual(client.region, "nb-eu-germany")
        _ = try await client.regions.getAccountRegions([:])
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "nb-region"), "nb-eu-germany")
        XCTAssertTrue(
            mock.lastRequest?.url?.absoluteString
                .hasPrefix("https://nb-eu-germany.hub.norbix.ai/") == true
        )
    }

    func testListAndUpdateRoutes() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixHubClient(projectId: "p1", apiKey: "key", accountId: "a1", executor: mock)

        _ = try await client.regions.getAccountRegions([:])
        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertTrue(
            mock.lastRequest?.url?.path
                .hasSuffix("/account/regions") == true
        )

        _ = try await client.regions.updateProjectRegions(
            projectId: "p1",
            primaryRegion: "nb-eu-germany",
            additionalRegions: ["nb-us-east"]
        )
        XCTAssertEqual(mock.lastRequest?.httpMethod, "PATCH")
        XCTAssertTrue(
            mock.lastRequest?.url?.path
                .hasSuffix("/account/projects/p1/settings/regions") == true
        )
        let body = try XCTUnwrap(mock.lastRequest?.httpBody)
        let json = try XCTUnwrap(JSONSerialization.jsonObject(with: body) as? [String: Any])
        XCTAssertEqual(json["primaryRegion"] as? String, "nb-eu-germany")
        XCTAssertEqual(json["additionalRegions"] as? [String], ["nb-us-east"])
        XCTAssertNil(json["projectId"], "projectId is a path parameter, not body")
    }
}
