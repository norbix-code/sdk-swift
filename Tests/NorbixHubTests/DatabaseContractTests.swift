import XCTest
@testable import NorbixHub
import NorbixCore

/// The rules the gateway checks on Hub Database calls (gateway
/// refactoringV2, the last Database wave): `allRecords` on bulk writes,
/// schema triggers per env, the new response fields (`dependencyRefs`,
/// `joinedCollections`, trigger `env`) and the new refusal codes. The fake
/// transport (MockHTTPExecutor) records the request or plays back the
/// gateway's answer. No real server is called.
final class HubDatabaseContractTests: XCTestCase {

    private func makeClient(_ mock: MockHTTPExecutor, env: String? = nil) throws -> NorbixHubClient {
        try NorbixHubClient(projectId: "proj", bearerToken: "token", accountId: "acc", env: env, executor: mock)
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

    private func refusal(_ code: String, status: Int = 400, context: String = "{}", call: (NorbixHubClient) async throws -> Any?) async throws -> NorbixError {
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

    func testUpdateManyRecordsSendsAllRecordsInTheBody() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.updateManyRecords([
            "collectionName": "books",
            "filter": "{}",
            "update": #"{"status":"archived"}"#,
            "allRecords": true
        ])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/collections/books/many")
        let json = try bodyJSON(mock)
        XCTAssertEqual(json["allRecords"] as? Bool, true)
        XCTAssertNil(json["collectionName"], "path parameter collectionName leaked into the body")
    }

    func testDeleteManyRecordsSendsAllRecordsInTheQuery() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.deleteManyRecords([
            "collectionName": "books",
            "filter": "{}",
            "allRecords": true
        ])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "DELETE")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/collections/books/many")
        XCTAssertEqual(queryItems(mock)["allRecords"], "true")
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    // MARK: - Schema triggers: one copy per env

    func testSchemaTriggerCallsSendTheClientEnv() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock, env: "TEST")

        _ = try await client.database.getSchemaTriggers()
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "norbix-env"), "TEST")

        _ = try await client.database.disableSchemaTrigger(["triggerId": "trg_1"])
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/schemas/triggers/trg_1/disable")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "norbix-env"), "TEST")
    }

    func testSchemaTriggerCallsSendNoEnvHeaderForProd() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.getSchemaTriggers()

        XCTAssertNil(mock.lastRequest?.value(forHTTPHeaderField: "norbix-env"))
    }

    func testGetSchemaTriggerReturnsEnvAndTheOwningSchemaId() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"result":{"id":"trg_1","schemaId":"sch_books","env":"TEST"}}"#.utf8)
        let client = try makeClient(mock, env: "TEST")

        let res = try await client.database.getSchemaTrigger(["id": "trg_1"])

        let result = try XCTUnwrap((res as? [String: Any])?["result"] as? [String: Any])
        XCTAssertEqual(result["schemaId"] as? String, "sch_books")
        XCTAssertEqual(result["env"] as? String, "TEST")
    }

    func testTriggerNotFoundInTheRequestEnvIsTriggers002() async throws {
        let error = try await refusal("CM-ERRORS-TRIGGERS-002", status: 404) { client in
            try await client.database.enableSchemaTrigger(["triggerId": "trg_prod_only"])
        }
        XCTAssertEqual(error.errorCode, "CM-ERRORS-TRIGGERS-002")
        XCTAssertEqual(error.httpStatus, 404)
    }

    // MARK: - New response fields come back untouched

    func testTaxonomyListRowsCarryDependencyRefsInOrder() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"""
        {"result":[{"viewId":"txn_cities","dependencies":["txn_countries","txn_gone"],
          "dependencyRefs":[{"id":"txn_countries","name":"Countries"},{"id":"txn_gone","name":null}]}]}
        """#.utf8)
        let client = try makeClient(mock)

        let res = try await client.database.getDatabaseTaxonomies()

        let rows = try XCTUnwrap((res as? [String: Any])?["result"] as? [[String: Any]])
        let refs = try XCTUnwrap(rows.first?["dependencyRefs"] as? [[String: Any]])
        XCTAssertEqual(refs.map { $0["id"] as? String }, ["txn_countries", "txn_gone"])
        XCTAssertEqual(refs[0]["name"] as? String, "Countries")
        XCTAssertTrue(refs[1]["name"] is NSNull, "an id that no longer resolves keeps its place with name = null")
        XCTAssertNil(rows.first?["dependencyNames"])
    }

    func testSavedAggregateCarriesJoinedCollections() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"result":{"viewId":"agg_1","joinedCollections":["authors","publishers"]}}"#.utf8)
        let client = try makeClient(mock)

        let res = try await client.database.getDatabaseAggregate(["Id": "agg_1"])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/aggregates/agg_1")
        let result = try XCTUnwrap((res as? [String: Any])?["result"] as? [String: Any])
        XCTAssertEqual(result["joinedCollections"] as? [String], ["authors", "publishers"])
    }

    // MARK: - New refusal codes keep the gateway's code

    func testEmptyFilterRefusalIsDatabase037() async throws {
        let error = try await refusal("CM-ERRORS-DATABASE-037") { client in
            try await client.database.updateManyRecords([
                "collectionName": "books",
                "update": #"{"status":"archived"}"#
            ])
        }
        XCTAssertEqual(error.errorCode, "CM-ERRORS-DATABASE-037")
    }

    func testOperatorUpdateRefusalIsDatabase035() async throws {
        let error = try await refusal("CM-ERRORS-DATABASE-035") { client in
            try await client.database.updateOneRecord([
                "collectionName": "books",
                "id": "rec_1",
                "update": #"{"$set":{"status":"shipped"}}"#
            ])
        }
        XCTAssertEqual(error.errorCode, "CM-ERRORS-DATABASE-035")
    }

    func testSchemaJoinedByASavedAggregateIsSchema018WithTheNames() async throws {
        let error = try await refusal(
            "CM-ERRORS-SCHEMA-018",
            context: #"{"BlockerAggregateIds":"agg_1","BlockerAggregateNames":"Books by author"}"#
        ) { client in
            try await client.database.deleteDatabaseSchema(["Id": "sch_authors"])
        }
        XCTAssertEqual(error.errorCode, "CM-ERRORS-SCHEMA-018")
        XCTAssertEqual(error.errors.first?.context["BlockerAggregateNames"], "Books by author")
    }

    func testRenameToAUsedNameIsSchema002() async throws {
        let error = try await refusal("CM-ERRORS-SCHEMA-002") { client in
            try await client.database.renameDatabaseSchema(["Id": "sch_books", "title": "Authors"])
        }
        XCTAssertEqual(error.errorCode, "CM-ERRORS-SCHEMA-002")
    }

    func testTestAggregateWithReadOnlyRightsIsForbidden() async throws {
        let mock = MockHTTPExecutor()
        mock.responseStatus = 403
        mock.responseBody = Data(#"{"responseStatus":{"errorCode":"Forbidden","message":"database:create or database:update required"}}"#.utf8)
        let client = try makeClient(mock)

        do {
            _ = try await client.database.testDatabaseAggregate(["schemaId": "sch_books", "pipeline": "[]"])
            XCTFail("expected a NorbixError")
        } catch let error as NorbixError {
            XCTAssertEqual(error.httpStatus, 403)
        }
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/aggregates/test")
    }
}
