import XCTest
@testable import NorbixHub
import NorbixCore

/// One test per Database method: the fake transport (MockHTTPExecutor)
/// records the request, and each test checks the verb, the path (with its
/// path parameters filled in) and where the other fields go (query string
/// for GET / DELETE, JSON body otherwise). No real server is called.
final class HubDatabaseModuleTests: XCTestCase {

    private func makeClient(_ mock: MockHTTPExecutor) throws -> NorbixHubClient {
        try NorbixHubClient(
            projectId: "proj",
            bearerToken: "token",
            accountId: "acc",
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

    func testDisableDatabaseSendsToPutRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.disableDatabase(["databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/disable")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testEnableDatabaseSendsToPutRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.enableDatabase(["databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/enable")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testDeleteSchemaTriggerSendsToDeleteRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.deleteSchemaTrigger(["triggerId": "trg_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "DELETE")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/schemas/triggers/trg_1")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("triggerId"), "path parameter triggerId leaked into the query")
    }

    func testDisableSchemaTriggerSendsToPatchRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.disableSchemaTrigger(["triggerId": "trg_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PATCH")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/schemas/triggers/trg_1/disable")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testEnableSchemaTriggerSendsToPatchRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.enableSchemaTrigger(["triggerId": "trg_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PATCH")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/schemas/triggers/trg_1/enable")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testGetSchemaTriggerSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.getSchemaTrigger(["id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/schemas/triggers/rec_1")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("id"), "path parameter id leaked into the query")
    }

    func testGetSchemaTriggersSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.getSchemaTriggers(["databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/schemas/triggers")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
    }

    func testSaveSchemaTriggerSendsToPostRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.saveSchemaTrigger(["databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/schemas/triggers")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testDeleteDatabaseTaxonomySendsToDeleteRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.deleteDatabaseTaxonomy(["Id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "DELETE")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/taxonomies/rec_1")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("Id"), "path parameter Id leaked into the query")
    }

    func testGetDatabaseTaxonomySendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.getDatabaseTaxonomy(["id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/taxonomies/rec_1")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("id"), "path parameter id leaked into the query")
    }

    func testGetDatabaseTaxonomiesSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.getDatabaseTaxonomies(["databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/taxonomies")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
    }

    func testSaveDatabaseTaxonomySendsToPostRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.saveDatabaseTaxonomy(["databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/taxonomies")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testDeleteDatabaseTaxonomyTermSendsToDeleteRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.deleteDatabaseTaxonomyTerm(["TaxonomyId": "tax_1", "Id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "DELETE")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/taxonomies/tax_1/terms/rec_1")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("TaxonomyId"), "path parameter TaxonomyId leaked into the query")
        XCTAssertFalse(queryNames(mock).contains("Id"), "path parameter Id leaked into the query")
    }

    func testDeleteManyDatabaseTaxonomyTermsSendsToDeleteRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.deleteManyDatabaseTaxonomyTerms(["TaxonomyId": "tax_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "DELETE")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/taxonomies/tax_1/terms/many")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("TaxonomyId"), "path parameter TaxonomyId leaked into the query")
    }

    func testGetDatabaseTaxonomyTermSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.getDatabaseTaxonomyTerm(["TaxonomyId": "tax_1", "Id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/taxonomies/tax_1/terms/rec_1")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("TaxonomyId"), "path parameter TaxonomyId leaked into the query")
        XCTAssertFalse(queryNames(mock).contains("Id"), "path parameter Id leaked into the query")
    }

    func testSaveDatabaseTaxonomyTermSendsToPostRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.saveDatabaseTaxonomyTerm(["TaxonomyId": "tax_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/taxonomies/tax_1/terms")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testUpdateDatabaseTaxonomyTermSendsToPutRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.updateDatabaseTaxonomyTerm(["TaxonomyId": "tax_1", "Id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/taxonomies/tax_1/terms/rec_1")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testDeleteDatabaseSchemaSendsToDeleteRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.deleteDatabaseSchema(["Id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "DELETE")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/schemas/rec_1")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("Id"), "path parameter Id leaked into the query")
    }

    func testDiscardDatabaseSchemaDraftSendsToDeleteRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.discardDatabaseSchemaDraft(["Id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "DELETE")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/schemas/rec_1/draft")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("Id"), "path parameter Id leaked into the query")
    }

    func testGetDatabaseSchemaSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.getDatabaseSchema(["id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/schemas/rec_1")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("id"), "path parameter id leaked into the query")
    }

    func testGetDatabaseSchemasSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.getDatabaseSchemas(["databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/schemas")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
    }

    func testGetDatabaseSchemaDraftSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.getDatabaseSchemaDraft(["Id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/schemas/rec_1/draft")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("Id"), "path parameter Id leaked into the query")
    }

    func testGetDatabaseSchemaVersionDiffSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.getDatabaseSchemaVersionDiff(["Id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/schemas/rec_1/versions/diff")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("Id"), "path parameter Id leaked into the query")
    }

    func testGetDatabaseSchemaVersionsSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.getDatabaseSchemaVersions(["Id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/schemas/rec_1/versions")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("Id"), "path parameter Id leaked into the query")
    }

    func testPublishDatabaseSchemaSendsToPostRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.publishDatabaseSchema(["Id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/schemas/rec_1/publish")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testRenameDatabaseSchemaSendsToPutRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.renameDatabaseSchema(["Id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/schemas/rec_1/rename")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testSaveDatabaseSchemaSendsToPostRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.saveDatabaseSchema(["databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/schemas")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testUpdateDatabaseSchemaDraftSendsToPutRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.updateDatabaseSchemaDraft(["Id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/schemas/rec_1/draft")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testUpdateDatabaseSchemaSettingsSendsToPutRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.updateDatabaseSchemaSettings(["Id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/schemas/rec_1/settings")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testDeleteDatabaseIntegrationSendsToDeleteRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.deleteDatabaseIntegration(["Id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "DELETE")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/integrations/rec_1")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("Id"), "path parameter Id leaked into the query")
    }

    func testDisableDatabaseIntegrationSendsToPutRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.disableDatabaseIntegration(["Id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/integrations/rec_1/disable")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testEnableDatabaseIntegrationSendsToPutRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.enableDatabaseIntegration(["Id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/integrations/rec_1/enable")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testGetDatabaseIntegrationSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.getDatabaseIntegration(["id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/integrations/rec_1")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("id"), "path parameter id leaked into the query")
    }

    func testGetDatabaseIntegrationsSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.getDatabaseIntegrations(["databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/integrations")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
    }

    func testSaveDatabaseIntegrationSendsToPostRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.saveDatabaseIntegration(["databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/integrations")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testSetDatabaseIntegrationAsDefaultSendsToPutRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.setDatabaseIntegrationAsDefault(["Id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/integrations/rec_1/default")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testDeleteDatabaseAggregateSendsToDeleteRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.deleteDatabaseAggregate(["Id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "DELETE")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/aggregates/rec_1")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("Id"), "path parameter Id leaked into the query")
    }

    func testGetDatabaseAggregateSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.getDatabaseAggregate(["Id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/aggregates/rec_1")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("Id"), "path parameter Id leaked into the query")
    }

    func testGetDatabaseAggregatesSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.getDatabaseAggregates(["databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/aggregates")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
    }

    func testSaveDatabaseAggregateSendsToPostRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.saveDatabaseAggregate(["databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/aggregates")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testTestDatabaseAggregateSendsToPostRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.testDatabaseAggregate(["databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/aggregates/test")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testFindRecordsSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.findRecords(["collectionName": "orders", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/collections/orders")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("collectionName"), "path parameter collectionName leaked into the query")
    }

    func testFindOneRecordSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.findOneRecord(["collectionName": "orders", "id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/collections/orders/rec_1")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("collectionName"), "path parameter collectionName leaked into the query")
        XCTAssertFalse(queryNames(mock).contains("id"), "path parameter id leaked into the query")
    }

    func testInsertRecordSendsToPostRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.insertRecord(["collectionName": "orders", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/collections/orders")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testInsertManyRecordsSendsToPostRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.insertManyRecords(["collectionName": "orders", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/collections/orders/many")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testUpdateOneRecordSendsToPutRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.updateOneRecord(["collectionName": "orders", "id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/collections/orders/rec_1")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testUpdateManyRecordsSendsToPutRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.updateManyRecords(["collectionName": "orders", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/collections/orders/many")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testReplaceRecordSendsToPutRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.replaceRecord(["collectionName": "orders", "id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/collections/orders/rec_1/replace")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testDeleteRecordSendsToDeleteRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.deleteRecord(["collectionName": "orders", "id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "DELETE")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/collections/orders/rec_1")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("collectionName"), "path parameter collectionName leaked into the query")
        XCTAssertFalse(queryNames(mock).contains("id"), "path parameter id leaked into the query")
    }

    func testDeleteManyRecordsSendsToDeleteRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.deleteManyRecords(["collectionName": "orders", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "DELETE")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/collections/orders/many")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("collectionName"), "path parameter collectionName leaked into the query")
    }

    func testCountRecordsSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.countRecords(["collectionName": "orders", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/collections/orders/count")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("collectionName"), "path parameter collectionName leaked into the query")
    }

    func testDistinctRecordValuesSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.distinctRecordValues(["collectionName": "orders", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/collections/orders/distinct")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("collectionName"), "path parameter collectionName leaked into the query")
    }

    func testAggregateRecordsSendsToPostRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.aggregateRecords(["collectionName": "orders", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/collections/orders/aggregate")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testExecuteRecordsAggregateSendsToPostRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.executeRecordsAggregate(["collectionName": "orders", "aggregateId": "agg_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/collections/orders/aggregates/agg_1/execute")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testChangeRecordResponsibilitySendsToPutRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.changeRecordResponsibility(["collectionName": "orders", "id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/collections/orders/rec_1/responsibility")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testGetCollectionIndexesSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.getCollectionIndexes(["collectionName": "orders", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/collections/orders/indexes")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("collectionName"), "path parameter collectionName leaked into the query")
    }

    func testSeedCollectionRecordsSendsToPostRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.seedCollectionRecords(["databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/collections/seed")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testApplyDatabaseSchemaBundleSendsToPostRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.applyDatabaseSchemaBundle(["databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/schemas/apply-bundle")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testUpdateDatabaseSchemaEmbedSendsToPutRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.updateDatabaseSchemaEmbed(["Id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/schemas/rec_1/embed")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testGetDatabaseSchemaIndexStatusSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.getDatabaseSchemaIndexStatus(["Id": "rec_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/schemas/rec_1/index-status")
        XCTAssertFalse(queryNames(mock).contains("Id"), "path parameter Id leaked into the query")
    }

    func testGetDatabaseSchemaListSettingsSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.getDatabaseSchemaListSettings(["Id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/schemas/rec_1/list-settings")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("Id"), "path parameter Id leaked into the query")
    }

    func testUpdateDatabaseSchemaListSettingsSendsToPutRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.updateDatabaseSchemaListSettings(["Id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/schemas/rec_1/list-settings")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testGetDatabaseTaxonomyTreeSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.getDatabaseTaxonomyTree(["databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/taxonomies/tree")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
    }

    func testGetDatabaseTaxonomyTermTreeSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.getDatabaseTaxonomyTermTree(["TaxonomyName": "services", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/taxonomies/services/terms/tree")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("TaxonomyName"), "path parameter TaxonomyName leaked into the query")
    }

    func testGetDatabaseMergedTermTreeSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.getDatabaseMergedTermTree(["TaxonomyName": "services", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/taxonomies/services/merged-tree")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("TaxonomyName"), "path parameter TaxonomyName leaked into the query")
    }

    func testGetAllowedFlexTiersSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.getAllowedFlexTiers(["databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/integrations/flex-tiers")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
    }

    func testTestDatabaseIntegrationSendsToPostRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.testDatabaseIntegration(["databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/integrations/test")
        try assertBody(mock, "databaseIntegrationId", equals: "dbi_1")
    }

    func testRevealManagedFlexConnectionStringSendsToGetRoute() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.revealManagedFlexConnectionString(["Id": "rec_1", "databaseIntegrationId": "dbi_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/integrations/rec_1/connection-string")
        assertQuery(mock, contains: "databaseIntegrationId=dbi_1")
        XCTAssertFalse(queryNames(mock).contains("Id"), "path parameter Id leaked into the query")
    }

    // MARK: - Shared behaviour

    func testMissingPathParameterThrowsBeforeSending() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        do {
            _ = try await client.database.deleteSchemaTrigger([:])
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

        let res = try await client.database.deleteSchemaTrigger(["triggerId": "trg_1"])

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
            _ = try await client.database.deleteSchemaTrigger(["triggerId": "trg_1"])
            XCTFail("expected a NorbixError")
        } catch let error as NorbixError {
            XCTAssertEqual(error.status, 404)
        }
    }
}
