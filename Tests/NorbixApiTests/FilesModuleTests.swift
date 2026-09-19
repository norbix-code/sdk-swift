import XCTest
@testable import NorbixApi
import NorbixCore

final class FilesModuleTests: XCTestCase {

    private func makeClient(_ mock: MockHTTPExecutor) throws -> NorbixApiClient {
        try NorbixApiClient(projectId: "p1", apiKey: "k", executor: mock)
    }

    // MARK: - Upload

    func testRequestUploadUrlReturnsUrlAndHitsUploadUrlRoute() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"""
        {"url":"https://provider/put?sig=abc","responseStatus":{}}
        """#.utf8)
        let client = try makeClient(mock)

        let url = try await client.files.requestUploadUrl(
            integrationId: "nbin_1",
            path: "docs/x.pdf",
            contentType: "application/pdf"
        )

        XCTAssertEqual(url, "https://provider/put?sig=abc")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/files/nbin_1/upload-url")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")

        let body = try XCTUnwrap(mock.lastRequest?.httpBody)
        let json = try XCTUnwrap(
            JSONSerialization.jsonObject(with: body) as? [String: Any]
        )
        XCTAssertEqual(json["path"] as? String, "docs/x.pdf")
        XCTAssertEqual(json["contentType"] as? String, "application/pdf")
        // The integration id is consumed by the route, not the body.
        XCTAssertNil(json["filesIntegrationId"])
    }

    func testRequestUploadUrlThrowsWhenNoUrlReturned() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"responseStatus":{}}"#.utf8)
        let client = try makeClient(mock)

        do {
            _ = try await client.files.requestUploadUrl(
                integrationId: "nbin_1", path: "docs/x.pdf", contentType: "application/pdf"
            )
            XCTFail("Expected an error when the gateway returns no URL")
        } catch let error as NorbixError {
            XCTAssertEqual(error.code, "NORBIX_EMPTY_RESPONSE")
        }
    }

    func testCommitUploadHitsCommitRoute() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"responseStatus":{}}"#.utf8)
        let client = try makeClient(mock)

        try await client.files.commitUpload(
            integrationId: "nbin_1",
            path: "docs/x.pdf",
            contentType: "application/pdf",
            sizeBytes: 2048,
            fileName: "x.pdf"
        )

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/files/nbin_1/commit")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")

        let body = try XCTUnwrap(mock.lastRequest?.httpBody)
        let json = try XCTUnwrap(
            JSONSerialization.jsonObject(with: body) as? [String: Any]
        )
        XCTAssertEqual(json["path"] as? String, "docs/x.pdf")
        XCTAssertEqual(json["sizeBytes"] as? Int, 2048)
        XCTAssertEqual(json["fileName"] as? String, "x.pdf")
    }

    // MARK: - Browse

    func testListDecodesFilesAndFolders() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"""
        {
          "list": {
            "items": [
              {
                "resource": {
                  "id": "nbfl_1", "originalFileName": "a.pdf",
                  "extension": "pdf", "storedFileName": "s.pdf", "sizeBytes": 12
                },
                "integrationId": "nbin_1", "provider": "AwsS3",
                "path": "docs", "publicUrl": "docs/s.pdf"
              }
            ],
            "hasMore": true,
            "startingAfter": "CURSOR2"
          },
          "folders": ["docs/", "images/"],
          "responseStatus": {}
        }
        """#.utf8)
        let client = try makeClient(mock)

        let page = try await client.files.list(integrationId: "nbin_1", path: "docs")

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/files/nbin_1")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(page.files.count, 1)
        XCTAssertEqual(page.files.first?.resource.id, "nbfl_1")
        XCTAssertEqual(page.files.first?.resource.sizeBytes, 12)
        XCTAssertEqual(page.files.first?.resource.fileExtension, "pdf")
        XCTAssertEqual(page.files.first?.provider, .awsS3)
        XCTAssertEqual(page.folders, ["docs/", "images/"])
        XCTAssertTrue(page.hasMore)
        XCTAssertEqual(page.nextCursor, "CURSOR2")
    }

    func testListToleratesEmptyResponseBody() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"responseStatus":{}}"#.utf8)
        let client = try makeClient(mock)

        let page = try await client.files.list(integrationId: "nbin_1")

        XCTAssertTrue(page.files.isEmpty)
        XCTAssertTrue(page.folders.isEmpty)
        XCTAssertFalse(page.hasMore)
        XCTAssertNil(page.nextCursor)
    }

    func testGetInfoDecodesDetailsAndNumericProvider() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"""
        {
          "file": {
            "resource": { "id": "nbfl_9", "originalFileName": "invoice.pdf" },
            "integrationId": "nbin_1", "provider": 1, "path": "docs"
          },
          "isPublic": true,
          "publicUrl": "https://cdn/x.pdf",
          "responseStatus": {}
        }
        """#.utf8)
        let client = try makeClient(mock)

        let details = try await client.files.getInfo(
            integrationId: "nbin_1", path: "docs/invoice.pdf"
        )

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/files/nbin_1/info")
        XCTAssertEqual(details.file?.resource.id, "nbfl_9")
        // Provider sent as numeric ordinal 1 -> AwsS3.
        XCTAssertEqual(details.file?.provider, .awsS3)
        XCTAssertEqual(details.isPublic, true)
        XCTAssertEqual(details.publicUrl, "https://cdn/x.pdf")
    }

    // MARK: - Download

    func testGetSignedUrlReturnsUrlAndHitsSignRoute() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"""
        {"url":"https://provider/get?sig=xyz","responseStatus":{}}
        """#.utf8)
        let client = try makeClient(mock)

        let url = try await client.files.getSignedUrl(
            integrationId: "nbin_1", path: "docs/x.pdf"
        )

        XCTAssertEqual(url, "https://provider/get?sig=xyz")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/files/nbin_1/sign")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
    }

    func testDownloadReturnsRawData() async throws {
        let mock = MockHTTPExecutor()
        let raw = Data("PDF-binary-bytes".utf8)
        mock.responseBody = raw
        let client = try makeClient(mock)

        let bytes = try await client.files.download(
            integrationId: "nbin_1", path: "docs/x.pdf"
        )

        XCTAssertEqual(bytes, raw)
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/files/nbin_1/download")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
    }

    func testDownloadToFile() async throws {
        let mock = MockHTTPExecutor()
        let raw = Data("hello".utf8)
        mock.responseBody = raw
        let client = try makeClient(mock)

        let dest = FileManager.default.temporaryDirectory
            .appendingPathComponent("norbix-test-\(UUID().uuidString).bin")
        try await client.files.download(
            integrationId: "nbin_1", path: "docs/x.pdf", to: dest
        )
        defer { try? FileManager.default.removeItem(at: dest) }

        let onDisk = try Data(contentsOf: dest)
        XCTAssertEqual(onDisk, raw)
    }

    // MARK: - Delete

    func testDeleteHitsDeleteRoute() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"responseStatus":{}}"#.utf8)
        let client = try makeClient(mock)

        try await client.files.delete(integrationId: "nbin_1", path: "docs/x.pdf")

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/files/nbin_1")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "DELETE")
    }

    func testDeleteManyUsesBulkRouteAndPathsParam() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"responseStatus":{}}"#.utf8)
        let client = try makeClient(mock)

        try await client.files.deleteMany(
            integrationId: "nbin_1", paths: ["docs/a.pdf", "docs/b.pdf"]
        )

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/files/nbin_1/bulk")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "DELETE")
        let query = mock.lastRequest?.url?.query ?? ""
        XCTAssertTrue(query.contains("paths"), "expected paths in query, got: \(query)")
    }

    // MARK: - Integration test

    func testTestFilesIntegrationPostsToTestRouteAndParsesItems() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"""
        {
          "items": [
            {"operation":"Upload","result":"OK"},
            {"operation":"Read","result":"OK","errors":[]},
            {"operation":"List","result":"OK"},
            {"operation":"Delete","result":"Failed","errors":["Access denied"]}
          ],
          "responseStatus": {}
        }
        """#.utf8)
        let client = try makeClient(mock)

        let result = try await client.files.testFilesIntegration(integrationId: "nbin_1")

        XCTAssertEqual(mock.capturedRequests.count, 1)
        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/files/nbin_1/test")
        XCTAssertNil(mock.lastRequest?.url?.query)
        // Project scope, like the other Api Files calls.
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer k")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "X-CM-ProjectId"), "p1")
        // The integration id is consumed by the route, so nothing is left for a body.
        XCTAssertNil(mock.lastRequest?.httpBody)

        XCTAssertEqual(result.items, [
            IntegrationTestResultItem(operation: "Upload", result: "OK"),
            IntegrationTestResultItem(operation: "Read", result: "OK", errors: []),
            IntegrationTestResultItem(operation: "List", result: "OK"),
            IntegrationTestResultItem(operation: "Delete", result: "Failed", errors: ["Access denied"])
        ])
    }

    func testTestFilesIntegrationToleratesMissingItems() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"responseStatus":{}}"#.utf8)
        let client = try makeClient(mock)

        let result = try await client.files.testFilesIntegration(integrationId: "nbin_1")

        XCTAssertTrue(result.items.isEmpty)
    }

    func testTestFilesIntegrationSurfacesErrorStatus() async throws {
        let mock = MockHTTPExecutor()
        mock.responseStatus = 400
        mock.responseBody = Data(#"""
        {"responseStatus":{"errorCode":"ValidationFailed","message":"Integration not found"}}
        """#.utf8)
        let client = try makeClient(mock)

        do {
            _ = try await client.files.testFilesIntegration(integrationId: "nbin_missing")
            XCTFail("Expected a 400 to throw")
        } catch let error as NorbixError {
            XCTAssertEqual(error.status, 400)
            XCTAssertEqual(error.rawBody?.contains("Integration not found"), true)
        }
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/files/nbin_missing/test")
    }

    // MARK: - Public links

    func testGetPublicFileSendsNoAuthorizationHeader() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data("PDF-BYTES".utf8)
        let client = try makeClient(mock)

        _ = try await client.files.getPublicFile(publicId: "nbpf_abc", name: "report.pdf")

        XCTAssertNil(
            mock.lastRequest?.value(forHTTPHeaderField: "Authorization"),
            "a public link must work without signing in"
        )
    }

    func testGetPublicFileHitsPublicRouteAndReturnsBytes() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data("PDF-BYTES".utf8)
        let client = try makeClient(mock)

        let data = try await client.files.getPublicFile(
            publicId: "nbpf_abc", name: "report.pdf"
        )

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/files/public/nbpf_abc/report.pdf")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(String(data: data, encoding: .utf8), "PDF-BYTES")
    }

    func testGetPublicFileKeepsSlashesInFolderRelativeName() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data("X".utf8)
        let client = try makeClient(mock)

        _ = try await client.files.getPublicFile(
            publicId: "nbpf_folder", name: "2026/q1/report.pdf"
        )

        // The gateway route ends in a wildcard token, so the slashes of a
        // folder-relative name have to survive as slashes.
        XCTAssertEqual(
            mock.lastRequest?.url?.path,
            "/v2/files/public/nbpf_folder/2026/q1/report.pdf"
        )
    }

    func testGetPublicFileSurfacesNotFound() async throws {
        let mock = MockHTTPExecutor()
        mock.responseStatus = 404
        mock.responseBody = Data(#"{"responseStatus":{"message":"Not Found"}}"#.utf8)
        let client = try makeClient(mock)

        do {
            _ = try await client.files.getPublicFile(publicId: "nbpf_gone", name: "x.pdf")
            XCTFail("Expected a 404 to throw")
        } catch let error as NorbixError {
            XCTAssertEqual(error.status, 404)
        }
    }

    // MARK: - Public fields on the listings

    func testListDecodesIsPublicAndPublicUrlOnAFile() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"""
        {"list":{"items":[{"resource":{"id":"nbfl_1","originalFileName":"a.pdf"},
        "integrationId":"nbin_1","provider":"AwsS3","path":"docs/a.pdf",
        "isPublic":true,"publicUrl":"https://api.norbix.ai/v2/files/public/nbpf_a/a.pdf"}],
        "hasMore":false}}
        """#.utf8)
        let client = try makeClient(mock)

        let page = try await client.files.list(integrationId: "nbin_1", path: "docs")

        XCTAssertEqual(page.files.first?.isPublic, true)
        XCTAssertEqual(
            page.files.first?.publicUrl,
            "https://api.norbix.ai/v2/files/public/nbpf_a/a.pdf"
        )
    }

    func testListDecodesPublicFolders() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"""
        {"list":{"items":[],"hasMore":false},
         "folders":["docs","private"],
         "publicFolders":[{"path":"docs","publicId":"nbpf_docs",
         "publicUrl":"https://api.norbix.ai/v2/files/public/nbpf_docs/","inherited":false}]}
        """#.utf8)
        let client = try makeClient(mock)

        let page = try await client.files.list(integrationId: "nbin_1")

        XCTAssertEqual(page.folders, ["docs", "private"])
        XCTAssertEqual(page.publicFolders.count, 1)
        XCTAssertEqual(page.publicFolders.first?.path, "docs")
        XCTAssertEqual(page.publicFolders.first?.publicId, "nbpf_docs")
        XCTAssertEqual(page.publicFolders.first?.inherited, false)
    }

    func testListWithoutPublicFoldersDecodesToEmpty() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"list":{"items":[],"hasMore":false},"folders":["docs"]}"#.utf8)
        let client = try makeClient(mock)

        let page = try await client.files.list(integrationId: "nbin_1")

        XCTAssertTrue(page.publicFolders.isEmpty)
    }

}
