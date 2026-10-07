import XCTest
@testable import NorbixHub
import NorbixCore

/// The schema-content contract on the Hub client (gateway campaign
/// audit/schema-content, 2026-10): `expandReferences` on the record reads,
/// dotted update paths with `arrayFilters`, files by id, term slug, and the
/// new schema / taxonomy refusal codes. The fake transport (MockHTTPExecutor)
/// records the request or plays back the gateway's answer. No real server is
/// called.
final class HubSchemaContentContractTests: XCTestCase {

    private func makeClient(_ mock: MockHTTPExecutor) throws -> NorbixHubClient {
        try NorbixHubClient(projectId: "proj", bearerToken: "token", accountId: "acc", executor: mock)
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

    // MARK: - Records

    func testFindRecordsSendsExpandReferencesInTheQuery() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.findRecords(["collectionName": "posts", "expandReferences": true])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/collections/posts")
        XCTAssertEqual(queryItems(mock)["expandReferences"], "true")
    }

    func testFindOneRecordSendsExpandReferencesAndTheAnswerIsReadWithExpandedReference() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"""
        {"result":{"_id":"rec_1","author":{"id":"usr_1","display":"Jane Doe"},"role":{"id":"rol_1","display":"Editors"},
          "country":{"id":"term_fr","display":"france"}},"responseStatus":{"isSuccess":true}}
        """#.utf8)
        let client = try makeClient(mock)

        let answer = try await client.database.findOneRecord(["collectionName": "posts", "id": "rec_1", "expandReferences": true])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/collections/posts/rec_1")
        XCTAssertEqual(queryItems(mock)["expandReferences"], "true")
        let record = try XCTUnwrap((answer as? [String: Any])?["result"] as? [String: Any])
        XCTAssertEqual(ExpandedReference.from(record["author"])?.displayText(), "Jane Doe")
        XCTAssertEqual(ExpandedReference.from(record["role"])?.id, "rol_1", "a role reference stores the role id")
        XCTAssertEqual(ExpandedReference.from(record["country"])?.displayText(), "france", "displayField: slug")
    }

    func testUpdateOneRecordSendsDottedPathsAndArrayFilters() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.updateOneRecord([
            "collectionName": "orders",
            "id": "rec_1",
            "update": #"{"lines.$[line].qty":3}"#,
            "arrayFilters": #"[{"line.sku":"A-1"}]"#
        ])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/collections/orders/rec_1")
        let json = try bodyJSON(mock)
        XCTAssertEqual(json["update"] as? String, #"{"lines.$[line].qty":3}"#)
        XCTAssertEqual(json["arrayFilters"] as? String, #"[{"line.sku":"A-1"}]"#)
    }

    func testUpdateManyRecordsSendsArrayFilters() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.updateManyRecords([
            "collectionName": "orders",
            "filter": #"{"status":"open"}"#,
            "update": #"{"lines.$[].qty":1,"address.city":"Vilnius"}"#,
            "arrayFilters": "[]"
        ])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/collections/orders/many")
        let json = try bodyJSON(mock)
        XCTAssertEqual(json["arrayFilters"] as? String, "[]")
        XCTAssertEqual(json["update"] as? String, #"{"lines.$[].qty":1,"address.city":"Vilnius"}"#)
    }

    func testArrayFiltersPairingRefusalIs014() async throws {
        let error = try await refusal("CM-ERRORS-DATABASE-014", context: #"{"Reason":"identifier 'line' has no filter"}"#) { client in
            try await client.database.updateOneRecord([
                "collectionName": "orders", "id": "rec_1", "update": #"{"lines.$[line].qty":3}"#
            ])
        }
        XCTAssertEqual(error.errorCode, "CM-ERRORS-DATABASE-014")
        XCTAssertEqual(error.errors.first?.context["Reason"], "identifier 'line' has no filter")
    }

    func testExpandWithoutReadOnALinkedSourceIs056() async throws {
        let error = try await refusal("CM-ERRORS-DATABASE-056", status: 403,
                                      context: #"{"SourceKind":"taxonomy","Source":"countries","Fields":"country","MissingPermissions":"database:read"}"#) { client in
            try await client.database.findRecords(["collectionName": "posts", "expandReferences": true])
        }
        XCTAssertEqual(error.errorCode, "CM-ERRORS-DATABASE-056")
        XCTAssertEqual(error.errors.first?.context["Source"], "countries")
    }

    // MARK: - Schema contract

    func testSaveSchemaSendsTheNewFieldShapesUntouched() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)
        let dataSchema = #"{"properties":{"address":{"$fieldType":"object","properties":{"city":{"$fieldType":"string"}},"required":["city"]},"lines":{"$fieldType":"array","items":{"$fieldType":"object"},"minItems":1},"meta":{"$fieldType":"json","maxBytes":2048},"author":{"$fieldType":"user","displayField":"displayName"}}}"#

        _ = try await client.database.saveDatabaseSchema(["collectionName": "orders", "dataSchema": dataSchema])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/schemas")
        XCTAssertEqual(try bodyJSON(mock)["dataSchema"] as? String, dataSchema)
    }

    func testSchemaRefusalsCarryTheirCodes() async throws {
        let cases: [(code: String, context: String, key: String, value: String)] = [
            ("CM-ERRORS-SCHEMA-010", #"{"Key":"watermark"}"#, "Key", "watermark"),
            ("CM-ERRORS-SCHEMA-022", #"{"FieldName":"price","Keyword":"multipleOf"}"#, "Keyword", "multipleOf"),
            ("CM-ERRORS-SCHEMA-036", #"{"FieldName":"a.b.c.d.e.f","Depth":"6"}"#, "Depth", "6"),
            ("CM-ERRORS-SCHEMA-037", #"{"FieldName":"price"}"#, "FieldName", "price"),
            ("CM-ERRORS-SCHEMA-038", #"{"FieldName":"address","Required":"zip"}"#, "Required", "zip"),
            ("CM-ERRORS-SCHEMA-039", #"{"FieldName":"customer","DisplayField":"nick"}"#, "DisplayField", "nick"),
            ("CM-ERRORS-SCHEMA-040", #"{"Dependents":"orders.customer"}"#, "Dependents", "orders.customer")
        ]
        for item in cases {
            let error = try await refusal(item.code, context: item.context) { client in
                try await client.database.updateDatabaseSchemaDraft(["Id": "sch_1", "dataSchema": "{}"])
            }
            XCTAssertEqual(error.errorCode, item.code)
            XCTAssertEqual(error.errors.first?.context[item.key], item.value, item.code)
        }
    }

    func testDeleteSchemaWhileAnotherSchemaPointsAtItIs041() async throws {
        let error = try await refusal("CM-ERRORS-SCHEMA-041", context: #"{"Dependents":"orders.customer"}"#) { client in
            try await client.database.deleteDatabaseSchema(["Id": "sch_customers"])
        }
        XCTAssertEqual(error.errorCode, "CM-ERRORS-SCHEMA-041")
        XCTAssertEqual(error.errors.first?.context["Dependents"], "orders.customer")
    }

    // MARK: - Term slug

    func testSaveTermSendsSlugAndTheAnswerCarriesIt() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"""
        {"result":{"id":"term_fr","name":"France","slug":"fr","order":1},"responseStatus":{"isSuccess":true}}
        """#.utf8)
        let client = try makeClient(mock)

        let answer = try await client.database.saveDatabaseTaxonomyTerm([
            "TaxonomyId": "txn_1",
            "document": #"{"name":"France","slug":"fr","order":1}"#
        ])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/database/taxonomies/txn_1/terms")
        XCTAssertEqual(try bodyJSON(mock)["document"] as? String, #"{"name":"France","slug":"fr","order":1}"#)
        let term = try XCTUnwrap((answer as? [String: Any])?["result"] as? [String: Any])
        XCTAssertEqual(term["slug"] as? String, "fr")
    }

    func testDuplicateSlugIsTaxonomies012AndAnEmptySlugIs013() async throws {
        let duplicate = try await refusal("CM-ERRORS-TAXONOMIES-012", context: #"{"Slug":"france","OtherTermId":"term_fr"}"#) { client in
            try await client.database.saveDatabaseTaxonomyTerm(["TaxonomyId": "txn_1", "document": #"{"name":"Francia","slug":"france"}"#])
        }
        XCTAssertEqual(duplicate.errorCode, "CM-ERRORS-TAXONOMIES-012")
        XCTAssertEqual(duplicate.errors.first?.context["OtherTermId"], "term_fr")

        let empty = try await refusal("CM-ERRORS-TAXONOMIES-013", context: #"{"Name":"***"}"#) { client in
            try await client.database.updateDatabaseTaxonomyTerm(["TaxonomyId": "txn_1", "Id": "term_fr", "document": #"{"name":"***"}"#])
        }
        XCTAssertEqual(empty.errorCode, "CM-ERRORS-TAXONOMIES-013")
    }

    // MARK: - Files by id

    func testGetFileByIdHitsTheByIdRouteWithBothIdsInTheQuery() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"""
        {"file":{"id":"nbfl_7f3","originalFileName":"report.pdf"},"isPublic":false,"publicUrl":null,"responseStatus":{"isSuccess":true}}
        """#.utf8)
        let client = try makeClient(mock)

        let answer = try await client.files.getFileById(["filesIntegrationId": "nbin_1", "id": "nbfl_7f3"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/files/item/by-id")
        XCTAssertEqual(queryItems(mock)["filesIntegrationId"], "nbin_1")
        XCTAssertEqual(queryItems(mock)["id"], "nbfl_7f3")
        XCTAssertNil(mock.lastRequest?.httpBody)
        let file = try XCTUnwrap((answer as? [String: Any])?["file"] as? [String: Any])
        XCTAssertEqual(file["originalFileName"] as? String, "report.pdf")
    }

    func testGetFileByIdUnknownIdIsA404() async throws {
        let error = try await refusal("CM-ERRORS-FILES-002", status: 404) { client in
            try await client.files.getFileById(["filesIntegrationId": "nbin_1", "id": "nbfl_nope"])
        }
        XCTAssertEqual(error.httpStatus, 404)
        XCTAssertEqual(error.errorCode, "CM-ERRORS-FILES-002")
    }
}
