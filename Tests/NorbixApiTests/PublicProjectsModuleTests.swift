import XCTest
@testable import NorbixApi
import NorbixCore

/// The public project routes on the mock executor: verb, resolved path, and
/// no `Authorization` header even though the client has a key.
final class PublicProjectsModuleTests: XCTestCase {
    private func makeClient(_ mock: MockHTTPExecutor) throws -> NorbixApiClient {
        try NorbixApiClient(projectId: "p1", apiKey: "k", executor: mock)
    }

    func testGetPublicProjectConfigHitsThePublicRouteWithoutAuth() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"displayName":"Shop"}"#.utf8)
        let client = try makeClient(mock)

        let res = try await client.publicProjects.getPublicProjectConfig(projectId: "p1")

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/public/projects/p1/config")
        XCTAssertNil(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"),
                     "the public config must be readable before sign-in")
        XCTAssertEqual((res as? [String: Any])?["displayName"] as? String, "Shop")
    }

    func testGetPublicProjectLegalHitsThePublicRouteWithoutAuth() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(##"{"kind":"terms","body":"# Terms","available":true}"##.utf8)
        let client = try makeClient(mock)

        _ = try await client.publicProjects.getPublicProjectLegal(projectId: "p1", kind: "terms")

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/public/projects/p1/legal/terms")
        XCTAssertNil(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"),
                     "a legal page link must work without signing in")
    }
}
