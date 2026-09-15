import XCTest
@testable import NorbixHub
import NorbixCore

final class HubFilesModuleTests: XCTestCase {

    private func makeClient(_ mock: MockHTTPExecutor) throws -> NorbixHubClient {
        try NorbixHubClient(
            projectId: "proj",
            bearerToken: "token",
            accountId: "acc",
            executor: mock
        )
    }

    func testModuleSurface() async throws {
        let client = try makeClient(MockHTTPExecutor())
        XCTAssertNotNil(client.files)
    }

    // MARK: - Browse

    func testGetFolderFilesHitsFolderRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.files.getFolderFiles([
            "filesIntegrationId": "nbin_1",
            "path": "docs"
        ])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/files/folder")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        let query = mock.lastRequest?.url?.query ?? ""
        XCTAssertTrue(query.contains("path=docs"), "got: \(query)")
    }

    func testGetFileHitsItemRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.files.getFile([
            "filesIntegrationId": "nbin_1",
            "path": "docs/a.pdf"
        ])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/files/item")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
    }

    // MARK: - Integrations

    func testTestFilesIntegrationPostsToIntegrationsTest() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.files.testFilesIntegration([
            "provider": "AwsS3",
            "settings": ["bucket": "b"]
        ])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/files/integrations/test")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")

        let body = try XCTUnwrap(mock.lastRequest?.httpBody)
        let json = try XCTUnwrap(JSONSerialization.jsonObject(with: body) as? [String: Any])
        XCTAssertEqual(json["provider"] as? String, "AwsS3")
    }

    // MARK: - Public links

    func testMakeFilePublicPostsToItemPublic() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.files.makeFilePublic([
            "filesIntegrationId": "nbin_1",
            "path": "docs/a.pdf"
        ])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/files/item/public")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")

        let body = try XCTUnwrap(mock.lastRequest?.httpBody)
        let json = try XCTUnwrap(JSONSerialization.jsonObject(with: body) as? [String: Any])
        XCTAssertEqual(json["filesIntegrationId"] as? String, "nbin_1")
        XCTAssertEqual(json["path"] as? String, "docs/a.pdf")
    }

    func testMakeFilePrivatePostsToItemPrivate() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.files.makeFilePrivate([
            "filesIntegrationId": "nbin_1",
            "path": "docs/a.pdf"
        ])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/files/item/private")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
    }

    func testMakeFolderPublicPostsToFolderPublic() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.files.makeFolderPublic([
            "filesIntegrationId": "nbin_1",
            "path": "docs"
        ])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/files/folder/public")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
    }

    func testMakeFolderPrivatePostsToFolderPrivate() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.files.makeFolderPrivate([
            "filesIntegrationId": "nbin_1",
            "path": "docs"
        ])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/files/folder/private")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
    }

    func testMakeFilePublicIsAuthenticated() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.files.makeFilePublic([
            "filesIntegrationId": "nbin_1",
            "path": "docs/a.pdf"
        ])

        // Publishing is a dashboard action — it needs the caller's token even
        // though reading the resulting link does not.
        XCTAssertEqual(
            mock.lastRequest?.value(forHTTPHeaderField: "Authorization"),
            "Bearer token"
        )
    }

    // MARK: - Integration routes already covered, asserted here for the record

    func testIntegrationRoutesUseTheGatewaySpelling() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.files.deleteFilesIntegration(["Id": "nbin_1"])
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/files/integrations/nbin_1")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "DELETE")

        _ = try await client.files.setFilesIntegrationAsDefault(["Id": "nbin_1"])
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/files/integrations/nbin_1/default")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
    }
}
