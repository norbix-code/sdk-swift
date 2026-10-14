import XCTest
@testable import NorbixHub
import NorbixCore

/// The `language` option mirrors `region`: no default, sent as the standard
/// `Accept-Language` header (the gateway's only language input), per-call
/// override wins, runtime `setLanguage` and the `NORBIX_LANGUAGE` env var.
final class LanguageTests: XCTestCase {
    func testUnsetLanguageOmitsHeader() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixHubClient(projectId: "p1", apiKey: "key", accountId: "a1", executor: mock)
        XCTAssertNil(client.language)
        _ = try await client.regions.getAccountRegions([:])
        XCTAssertNil(mock.lastRequest?.value(forHTTPHeaderField: "Accept-Language"))
    }

    func testConfiguredLanguageSetsAcceptLanguage() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixHubClient(
            projectId: "p1", apiKey: "key", accountId: "a1",
            language: "lt", executor: mock
        )
        XCTAssertEqual(client.language, "lt")
        _ = try await client.regions.getAccountRegions([:])
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Accept-Language"), "lt")
        // The language never changes the request URL.
        XCTAssertTrue(
            mock.lastRequest?.url?.absoluteString
                .hasPrefix("https://hub.norbix.ai/") == true
        )
    }

    func testQValueListIsSentVerbatim() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixHubClient(
            projectId: "p1", apiKey: "key", accountId: "a1",
            language: "lt-LT, en;q=0.8", executor: mock
        )
        _ = try await client.regions.getAccountRegions([:])
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Accept-Language"), "lt-LT, en;q=0.8")
    }

    func testPerCallLanguageOverridesClientLanguage() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixHubClient(
            projectId: "p1", apiKey: "key", accountId: "a1",
            language: "lt", executor: mock
        )
        _ = try await client.regions.getAccountRegions([:], language: "en")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Accept-Language"), "en")
        // The override is for that call only.
        _ = try await client.regions.getAccountRegions([:])
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Accept-Language"), "lt")
    }

    func testSetLanguageRuntimeAndUnsetClears() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixHubClient(projectId: "p1", apiKey: "key", accountId: "a1", executor: mock)
        client.setLanguage("lt-LT")
        XCTAssertEqual(client.language, "lt-LT")
        _ = try await client.regions.getAccountRegions([:])
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Accept-Language"), "lt-LT")

        client.setLanguage(nil)
        XCTAssertNil(client.language)
        _ = try await client.regions.getAccountRegions([:])
        XCTAssertNil(mock.lastRequest?.value(forHTTPHeaderField: "Accept-Language"))

        client.setLanguage("")
        XCTAssertNil(client.language)
    }

    func testNorbixLanguageEnvironmentVariableFallback() async throws {
        let mock = MockHTTPExecutor()
        let config = try NorbixConfig.fromEnvironment(
            target: .hub,
            environment: [
                "NORBIX_PROJECT_ID": "p1",
                "NORBIX_ACCOUNT_ID": "a1",
                "NORBIX_API_KEY": "key",
                "NORBIX_LANGUAGE": "lt-LT, en;q=0.8"
            ]
        )
        let client = NorbixHubClient(config: config, executor: mock)
        XCTAssertEqual(client.language, "lt-LT, en;q=0.8")
        _ = try await client.regions.getAccountRegions([:])
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Accept-Language"), "lt-LT, en;q=0.8")
    }

    func testNoLegacyLanguageInputsAreSent() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixHubClient(
            projectId: "p1", apiKey: "key", accountId: "a1",
            language: "lt", executor: mock
        )
        _ = try await client.regions.updateProjectRegions(projectId: "p1", primaryRegion: "nb-eu-germany")
        XCTAssertNil(mock.lastRequest?.value(forHTTPHeaderField: "CultureCode"))
        XCTAssertNil(mock.lastRequest?.value(forHTTPHeaderField: "norbix-language"))
        let body = try XCTUnwrap(mock.lastRequest?.httpBody)
        let json = try XCTUnwrap(JSONSerialization.jsonObject(with: body) as? [String: Any])
        XCTAssertNil(json["cultureCode"])
    }
}
