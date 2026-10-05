import XCTest
@testable import NorbixApi
import NorbixCore

/// The rules the gateway checks on Database calls (gateway refactoringV2,
/// the last Database wave): the `allRecords` flag on bulk writes and the
/// error codes of the new refusals. The fake transport (MockHTTPExecutor)
/// records the request or plays back the gateway's error answer. No real
/// server is called.
final class DatabaseContractTests: XCTestCase {

    private func makeClient(_ mock: MockHTTPExecutor) throws -> NorbixApiClient {
        try NorbixApiClient(projectId: "proj", bearerToken: "token", executor: mock)
    }

    private func bodyJSON(_ mock: MockHTTPExecutor) throws -> [String: Any] {
        let body = try XCTUnwrap(mock.lastRequest?.httpBody)
        return try XCTUnwrap(JSONSerialization.jsonObject(with: body) as? [String: Any])
    }

    private func queryItems(_ mock: MockHTTPExecutor) -> [String: String] {
        guard let url = mock.lastRequest?.url,
              let items = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems else { return [:] }
        return Dictionary(items.map { ($0.name, $0.value ?? "") }, uniquingKeysWith: { a, _ in a })
    }

    private func refusal(_ code: String, status: Int = 400, context: String = "{}", call: (NorbixApiClient) async throws -> Any?) async throws -> NorbixError {
        let mock = MockHTTPExecutor()
        mock.responseStatus = status
        mock.responseBody = Data(#"{"responseStatus":{"isSuccess":false,"errors":[{"message":"refused","errorCode":"\#(code)","context":\#(context)}]}}"#.utf8)
        let client = try makeClient(mock)
        do {
            _ = try await call(client)
            XCTFail("expected \(code)")
            return NorbixError(message: "no error")
        } catch let error as NorbixError {
            return error
        }
    }

    // MARK: - allRecords on bulk writes

    func testUpdateManySendsAllRecordsInTheBody() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.updateMany([
            "collectionName": "books",
            "filter": "{}",
            "update": #"{"status":"archived"}"#,
            "allRecords": true
        ])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/collections/books/many")
        let json = try bodyJSON(mock)
        XCTAssertEqual(json["allRecords"] as? Bool, true)
        XCTAssertEqual(json["filter"] as? String, "{}")
        XCTAssertNil(json["collectionName"], "path parameter collectionName leaked into the body")
    }

    func testDeleteManySendsAllRecordsInTheQuery() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.deleteMany([
            "collectionName": "books",
            "filter": "{}",
            "allRecords": true
        ])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "DELETE")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/collections/books/many")
        let query = queryItems(mock)
        XCTAssertEqual(query["allRecords"], "true")
        XCTAssertEqual(query["filter"], "{}")
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    func testUpdateManyWithoutAllRecordsSendsNoFlag() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.updateMany([
            "collectionName": "books",
            "filter": #"{"status":"draft"}"#,
            "update": #"{"status":"archived"}"#
        ])

        XCTAssertNil(try bodyJSON(mock)["allRecords"])
    }

    // MARK: - New refusal codes keep the gateway's code

    func testEmptyFilterRefusalIsDatabase037() async throws {
        let error = try await refusal("CM-ERRORS-DATABASE-037") { client in
            try await client.database.deleteMany(["collectionName": "books", "filter": "{}"])
        }
        XCTAssertEqual(error.errorCode, "CM-ERRORS-DATABASE-037")
        XCTAssertEqual(error.httpStatus, 400)
    }

    func testOperatorUpdateRefusalIsDatabase035() async throws {
        let error = try await refusal("CM-ERRORS-DATABASE-035") { client in
            try await client.database.updateOne([
                "collectionName": "books",
                "id": "rec_1",
                "update": #"{"$inc":{"n":1}}"#
            ])
        }
        XCTAssertEqual(error.errorCode, "CM-ERRORS-DATABASE-035")
    }

    func testInvalidRecordDocumentIsDatabase036WithTheIndex() async throws {
        let error = try await refusal("CM-ERRORS-DATABASE-036", context: #"{"Index":"1"}"#) { client in
            try await client.database.insertMany([
                "collectionName": "books",
                "documents": #"[{"title":"ok"},{broken]"#
            ])
        }
        XCTAssertEqual(error.errorCode, "CM-ERRORS-DATABASE-036")
        XCTAssertEqual(error.errors.first?.context["Index"], "1")
    }

    func testOwnerWhoIsNotAProjectUserIsMembershipUsers012() async throws {
        let error = try await refusal("CM-ERRORS-MEMBERSHIP-USERS-012") { client in
            try await client.database.changeResponsibility([
                "collectionName": "books",
                "id": "rec_1",
                "newResponsibleUserId": "usr_elsewhere"
            ])
        }
        XCTAssertEqual(error.errorCode, "CM-ERRORS-MEMBERSHIP-USERS-012")
    }

    func testServerSideJavaScriptInATermFilterIsDatabase031() async throws {
        let error = try await refusal("CM-ERRORS-DATABASE-031") { client in
            try await client.database.findTerms([
                "taxonomyName": "services",
                "filter": #"{"$where":"true"}"#
            ])
        }
        XCTAssertEqual(error.errorCode, "CM-ERRORS-DATABASE-031")
    }

    func testUnknownTaxonomyNameIsTaxonomies010() async throws {
        let error = try await refusal("CM-ERRORS-TAXONOMIES-010", status: 404) { client in
            try await client.database.findMergedTermTree(["taxonomyName": "nope"])
        }
        XCTAssertEqual(error.errorCode, "CM-ERRORS-TAXONOMIES-010")
        XCTAssertEqual(error.httpStatus, 404)
    }

    func testTooLargeTermTreeIsTaxonomies011() async throws {
        let error = try await refusal("CM-ERRORS-TAXONOMIES-011") { client in
            try await client.database.findTermTree(["taxonomyName": "products"])
        }
        XCTAssertEqual(error.errorCode, "CM-ERRORS-TAXONOMIES-011")
    }
}
