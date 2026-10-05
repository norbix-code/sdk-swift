import XCTest
@testable import NorbixApi
import NorbixCore

/// One test per Database method: the fake transport (MockHTTPExecutor)
/// records the request, and each test checks the verb, the path (with its
/// path parameters filled in) and where the other fields go (query string
/// for GET / DELETE, JSON body otherwise). No real server is called.
final class DatabaseModuleTests: XCTestCase {

    private func makeClient(_ mock: MockHTTPExecutor) throws -> NorbixApiClient {
        try NorbixApiClient(
            projectId: "proj",
            bearerToken: "token",
            executor: mock
        )
    }

    private func assertQuery(_ mock: MockHTTPExecutor, contains item: String, file: StaticString = #filePath, line: UInt = #line) {
        let query = mock.lastRequest?.url?.query ?? ""
        XCTAssertTrue(query.contains(item), "query was: \(query)", file: file, line: line)
        XCTAssertNil(mock.lastRequest?.httpBody, file: file, line: line)
    }

    private func assertBody(_ mock: MockHTTPExecutor, _ key: String, equals value: String, file: StaticString = #filePath, line: UInt = #line) throws {
        let body = try XCTUnwrap(mock.lastRequest?.httpBody, file: file, line: line)
        let json = try XCTUnwrap(JSONSerialization.jsonObject(with: body) as? [String: Any], file: file, line: line)
        XCTAssertEqual(json[key] as? String, value, file: file, line: line)
    }

    private func queryNames(_ mock: MockHTTPExecutor) -> [String] {
        guard let url = mock.lastRequest?.url,
              let items = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems else { return [] }
        return items.map(\.name)
    }

    func testModuleSurface() throws {
        XCTAssertNotNil(try makeClient(MockHTTPExecutor()).database)
    }

    func testFindTermsSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.findTerms(["taxonomyName": "services", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/taxonomies/services/terms")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("taxonomyName"), "path parameter taxonomyName leaked into the query")
    }

    func testFindTermsChildrenSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.findTermsChildren(["taxonomyName": "services", "parentId": "term_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/taxonomies/services/terms/term_1/children")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("taxonomyName"), "path parameter taxonomyName leaked into the query")
        XCTAssertFalse(queryNames(mock).contains("parentId"), "path parameter parentId leaked into the query")
    }

    func testFindTermTreeSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.findTermTree(["taxonomyName": "services", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/taxonomies/services/terms/tree")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("taxonomyName"), "path parameter taxonomyName leaked into the query")
    }

    func testFindTaxonomyTreeSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.findTaxonomyTree(["databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/taxonomies/tree")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
    }

    func testGetDatabaseSchemaSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.getDatabaseSchema(["id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/schemas/rec_1")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("id"), "path parameter id leaked into the query")
    }

    func testGetDatabaseSchemasSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.getDatabaseSchemas(["databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/schemas")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
    }

    func testAggregateSendsToPostRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.aggregate(["collectionName": "orders", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/collections/orders/aggregate")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testChangeResponsibilitySendsToPutRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.changeResponsibility(["collectionName": "orders", "id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/collections/orders/rec_1/responsibility")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testCountSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.count(["collectionName": "orders", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/collections/orders/count")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("collectionName"), "path parameter collectionName leaked into the query")
    }

    func testDeleteManySendsToDeleteRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.deleteMany(["collectionName": "orders", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "DELETE")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/collections/orders/many")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("collectionName"), "path parameter collectionName leaked into the query")
    }

    func testDeleteOneSendsToDeleteRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.deleteOne(["collectionName": "orders", "id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "DELETE")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/collections/orders/rec_1")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("collectionName"), "path parameter collectionName leaked into the query")
        XCTAssertFalse(queryNames(mock).contains("id"), "path parameter id leaked into the query")
    }

    func testDistinctSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.distinct(["collectionName": "orders", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/collections/orders/distinct")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("collectionName"), "path parameter collectionName leaked into the query")
    }

    func testExecuteAggregateSendsToPostRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.executeAggregate(["collectionName": "orders", "aggregateId": "agg_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/collections/orders/aggregates/agg_1/execute")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testFindSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.find(["collectionName": "orders", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/collections/orders")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("collectionName"), "path parameter collectionName leaked into the query")
    }

    func testFindOneSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.findOne(["collectionName": "orders", "id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/collections/orders/rec_1")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("collectionName"), "path parameter collectionName leaked into the query")
        XCTAssertFalse(queryNames(mock).contains("id"), "path parameter id leaked into the query")
    }

    func testInsertManySendsToPostRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.insertMany(["collectionName": "orders", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/collections/orders/many")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testInsertOneSendsToPostRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.insertOne(["collectionName": "orders", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/collections/orders")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testReplaceOneSendsToPutRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.replaceOne(["collectionName": "orders", "id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/collections/orders/rec_1/replace")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testUpdateManySendsToPutRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.updateMany(["collectionName": "orders", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/collections/orders/many")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testUpdateOneSendsToPutRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.updateOne(["collectionName": "orders", "id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/collections/orders/rec_1")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testFindOwnSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.findOwn(["collectionName": "orders", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/collections/orders/own")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("collectionName"), "path parameter collectionName leaked into the query")
    }

    func testFindMergedTermTreeSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.findMergedTermTree(["taxonomyName": "services", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/taxonomies/services/merged-tree")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("taxonomyName"), "path parameter taxonomyName leaked into the query")
    }

    // MARK: - Shared behaviour

    func testMissingPathParameterThrowsBeforeSending() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        do {
            _ = try await client.database.findTerms([:])
            XCTFail("expected NORBIX_MISSING_PATH_PARAM")
        } catch let error as NorbixError {
            XCTAssertEqual(error.code, "NORBIX_MISSING_PATH_PARAM")
        }
        XCTAssertNil(mock.lastRequest)
    }

    func testReturnsTheParsedResponse() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"result":{"total":3},"responseStatus":{"isSuccess":true}}"#.utf8)
        let client = try makeClient(mock)

        let res = try await client.database.findTerms(["taxonomyName": "services"])

        let json = try XCTUnwrap(res as? [String: Any])
        let result = try XCTUnwrap(json["result"] as? [String: Any])
        XCTAssertEqual(result["total"] as? Int, 3)
    }

    func testHttpErrorBecomesNorbixError() async throws {
        let mock = MockHTTPExecutor()
        mock.responseStatus = 404
        mock.responseBody = Data(#"{"responseStatus":{"errorCode":"NotFound","message":"Record not found"}}"#.utf8)
        let client = try makeClient(mock)

        do {
            _ = try await client.database.findTerms(["taxonomyName": "services"])
            XCTFail("expected a NorbixError")
        } catch let error as NorbixError {
            XCTAssertEqual(error.status, 404)
        }
    }
}
