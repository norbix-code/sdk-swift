import XCTest
@testable import NorbixApi
import NorbixCore

/// The `language` option on the API client: `Accept-Language` header, no
/// default, runtime `setLanguage`, and the `NORBIX_LANGUAGE` env var.
final class LanguageTests: XCTestCase {
    func testUnsetLanguageOmitsHeader() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixApiClient(projectId: "p1", apiKey: "key", executor: mock)
        XCTAssertNil(client.language)
        _ = try await client.echo.echo([:])
        XCTAssertNil(mock.lastRequest?.value(forHTTPHeaderField: "Accept-Language"))
    }

    func testConfiguredLanguageSetsAcceptLanguage() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixApiClient(
            projectId: "p1", apiKey: "key", language: "lt-LT, en;q=0.8", executor: mock
        )
        XCTAssertEqual(client.language, "lt-LT, en;q=0.8")
        _ = try await client.echo.echo([:])
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Accept-Language"), "lt-LT, en;q=0.8")
    }

    func testSetLanguageRuntimeAndUnsetClears() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixApiClient(projectId: "p1", apiKey: "key", executor: mock)
        client.setLanguage("lt")
        XCTAssertEqual(client.language, "lt")
        _ = try await client.echo.echo([:])
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Accept-Language"), "lt")

        client.setLanguage(nil)
        XCTAssertNil(client.language)
        _ = try await client.echo.echo([:])
        XCTAssertNil(mock.lastRequest?.value(forHTTPHeaderField: "Accept-Language"))
    }

    func testNorbixLanguageEnvironmentVariableFallback() async throws {
        let mock = MockHTTPExecutor()
        let config = try NorbixConfig.fromEnvironment(
            target: .api,
            environment: [
                "NORBIX_PROJECT_ID": "p1",
                "NORBIX_API_KEY": "key",
                "NORBIX_LANGUAGE": "lt"
            ]
        )
        let client = NorbixApiClient(config: config, executor: mock)
        XCTAssertEqual(client.language, "lt")
        _ = try await client.echo.echo([:])
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Accept-Language"), "lt")
    }
}
