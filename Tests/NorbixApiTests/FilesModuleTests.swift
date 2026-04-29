import XCTest
@testable import NorbixApi
import NorbixCore

final class FilesModuleTests: XCTestCase {
    func testListReturnsTypedPage() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"""
        {"items":[{"id":"f1","originalFileName":"a.pdf","sizeBytes":12}],"total":1,"take":50,"skip":0}
        """#.utf8)
        let client = try NorbixApiClient(
            projectId: "p1", apiKey: "k", executor: mock
        )

        let page = try await client.files.list(take: 50)
        XCTAssertEqual(page.items.count, 1)
        XCTAssertEqual(page.items.first?.id, "f1")
        XCTAssertEqual(page.items.first?.sizeBytes, 12)
    }

    func testGetInfoReturnsTypedFileInfo() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"""
        {"id":"f_123","originalFileName":"invoice.pdf","sizeBytes":4096}
        """#.utf8)
        let client = try NorbixApiClient(
            projectId: "p1", apiKey: "k", executor: mock
        )

        let info = try await client.files.getInfo(id: "f_123")
        XCTAssertEqual(info.id, "f_123")
        XCTAssertEqual(info.originalFileName, "invoice.pdf")
    }

    func testSignReturnsSignedUploadResponse() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"""
        {"url":"https://s3.example.com/upload?token=abc","method":"PUT","fileId":"f_new"}
        """#.utf8)
        let client = try NorbixApiClient(
            projectId: "p1", apiKey: "k", executor: mock
        )

        let signed = try await client.files.sign(
            originalFileName: "report.pdf",
            contentType: "application/pdf",
            sizeBytes: 1024
        )
        XCTAssertTrue(signed.url.hasPrefix("https://s3.example.com"))
        XCTAssertEqual(signed.method, "PUT")
        XCTAssertEqual(signed.fileId, "f_new")
    }

    func testDownloadReturnsRawData() async throws {
        let mock = MockHTTPExecutor()
        let raw = Data("PDF-binary-bytes".utf8)
        mock.responseBody = raw
        let client = try NorbixApiClient(
            projectId: "p1", apiKey: "k", executor: mock
        )

        let bytes = try await client.files.download(id: "f_123")
        XCTAssertEqual(bytes, raw)
        XCTAssertEqual(
            mock.lastRequest?.url?.path,
            "/v2/files/f_123/download"
        )
    }

    func testDownloadToFile() async throws {
        let mock = MockHTTPExecutor()
        let raw = Data("hello".utf8)
        mock.responseBody = raw
        let client = try NorbixApiClient(
            projectId: "p1", apiKey: "k", executor: mock
        )

        let dest = FileManager.default.temporaryDirectory
            .appendingPathComponent("norbix-test-\(UUID().uuidString).bin")
        try await client.files.download(id: "f_123", to: dest)
        defer { try? FileManager.default.removeItem(at: dest) }

        let onDisk = try Data(contentsOf: dest)
        XCTAssertEqual(onDisk, raw)
    }
}
