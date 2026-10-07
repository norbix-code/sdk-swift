import XCTest
@testable import NorbixApi
import NorbixCore

/// The schema-content contract on the Api client (gateway campaign
/// audit/schema-content, 2026-10): `expandReferences` on the record reads with
/// the typed `{ id, display }` view, dotted update paths with `arrayFilters`,
/// files by id, the new schema field shapes passed through untouched, and the
/// new refusal codes. The fake transport (MockHTTPExecutor) records the
/// request or plays back the gateway's answer. No real server is called.
final class SchemaContentContractTests: XCTestCase {

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

    // MARK: - expandReferences on the wire (untyped)

    func testFindSendsExpandReferencesInTheQuery() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.find(["collectionName": "posts", "expandReferences": true])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/collections/posts")
        XCTAssertEqual(queryItems(mock)["expandReferences"], "true")
    }

    func testFindOneSendsExpandReferencesInTheQuery() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.findOne(["collectionName": "posts", "id": "rec_1", "expandReferences": true])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/collections/posts/rec_1")
        XCTAssertEqual(queryItems(mock)["expandReferences"], "true")
    }

    func testFindOwnSendsExpandReferencesInTheQuery() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.findOwn(["collectionName": "posts", "expandReferences": true])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/collections/posts/own")
        XCTAssertEqual(queryItems(mock)["expandReferences"], "true")
    }

    func testWithoutTheFlagNothingIsSent() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.find(["collectionName": "posts"])

        XCTAssertNil(queryItems(mock)["expandReferences"])
    }

    func testUntypedAnswerIsReadWithExpandedReference() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"""
        {"result":{"_id":"rec_1","title":"Hello","author":{"id":"usr_1","display":"Jane Doe"},
          "tags":[{"id":"6650","display":{"en":"News"}},{"id":"6651","display":null}]},
         "responseStatus":{"isSuccess":true}}
        """#.utf8)
        let client = try makeClient(mock)

        let answer = try await client.database.findOne(["collectionName": "posts", "id": "rec_1", "expandReferences": true])
        let record = try XCTUnwrap((answer as? [String: Any])?["result"] as? [String: Any])

        XCTAssertEqual(ExpandedReference.from(record["author"])?.displayText(), "Jane Doe")
        let tags = ExpandedReference.listFrom(record["tags"])
        XCTAssertEqual(tags.map { $0.displayText(language: "en") }, ["News", nil])
        XCTAssertEqual(tags[1].isResolved, false)
    }

    // MARK: - expandReferences, typed

    private struct Line: Codable, Sendable, Equatable {
        let sku: ExpandedReference
        let qty: Int
    }

    private struct Order: Codable, Sendable, Equatable {
        let id: String
        let customer: ExpandedReference
        let tags: [ExpandedReference]
        let lines: [Line]
        enum CodingKeys: String, CodingKey { case id = "_id", customer, tags, lines }
    }

    private static let expandedOrders = #"""
    {"items":[{"_id":"rec_1","customer":{"id":"usr_1","display":"Jane Doe"},
               "tags":[{"id":"6650","display":{"en":"News","lt":"Naujienos"}},{"id":"6651","display":null}],
               "lines":[{"sku":{"id":"rec_9","display":"A-1"},"qty":2}]}],
     "total":1,"responseStatus":{"isSuccess":true}}
    """#

    func testTypedFindSendsTheFlagAndDecodesExpandedReferencesAtDepth() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(Self.expandedOrders.utf8)
        let client = try makeClient(mock)

        let page: Page<Order> = try await client.database.find(
            collection: "orders", expandReferences: true, as: Order.self
        )

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/collections/orders")
        XCTAssertEqual(queryItems(mock)["expandReferences"], "true")
        let order = try XCTUnwrap(page.items.first)
        XCTAssertEqual(order.customer, ExpandedReference(id: "usr_1", display: .text("Jane Doe")))
        XCTAssertEqual(order.tags.map { $0.displayText(language: "lt") }, ["Naujienos", nil])
        XCTAssertEqual(order.lines[0].sku.displayText(), "A-1")
    }

    func testTypedFindWithoutTheFlagDecodesBareIdsAsUnresolved() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"""
        {"items":[{"_id":"rec_1","customer":"usr_1","tags":["6650"],"lines":[{"sku":"rec_9","qty":2}]}]}
        """#.utf8)
        let client = try makeClient(mock)

        let page: Page<Order> = try await client.database.find(collection: "orders", as: Order.self)

        XCTAssertNil(queryItems(mock)["expandReferences"])
        let order = try XCTUnwrap(page.items.first)
        XCTAssertEqual(order.customer, ExpandedReference(id: "usr_1", display: nil))
        XCTAssertFalse(order.customer.isResolved)
        XCTAssertEqual(order.tags.map { $0.id }, ["6650"])
        XCTAssertEqual(order.lines[0].sku.id, "rec_9")
    }

    func testTypedFindOwnHitsTheOwnRouteWithTheFlag() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(Self.expandedOrders.utf8)
        let client = try makeClient(mock)

        let page: Page<Order> = try await client.database.findOwn(
            collection: "orders", query: ["filter": "{}"], expandReferences: true, as: Order.self
        )

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/collections/orders/own")
        XCTAssertEqual(queryItems(mock)["expandReferences"], "true")
        XCTAssertEqual(queryItems(mock)["filter"], "{}")
        XCTAssertEqual(page.items.count, 1)
    }

    func testTypedFindOneSendsTheFlag() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"""
        {"_id":"rec_1","customer":{"id":"usr_1","display":"Jane Doe"},"tags":[],"lines":[]}
        """#.utf8)
        let client = try makeClient(mock)

        let order: Order = try await client.database.findOne(
            collection: "orders", id: "rec_1", expandReferences: true, as: Order.self
        )

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/collections/orders/rec_1")
        XCTAssertEqual(queryItems(mock)["expandReferences"], "true")
        XCTAssertEqual(order.customer.displayText(), "Jane Doe")
    }

    // MARK: - Nested documents: dotted paths and arrayFilters

    func testUpdateOneSendsDottedPathsAndArrayFiltersInTheBody() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.updateOne([
            "collectionName": "orders",
            "id": "rec_1",
            "update": #"{"lines.$[line].qty":3,"address.city":"Vilnius"}"#,
            "arrayFilters": #"[{"line.sku":"A-1"}]"#
        ])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/collections/orders/rec_1")
        let json = try bodyJSON(mock)
        XCTAssertEqual(json["update"] as? String, #"{"lines.$[line].qty":3,"address.city":"Vilnius"}"#)
        XCTAssertEqual(json["arrayFilters"] as? String, #"[{"line.sku":"A-1"}]"#)
        XCTAssertNil(json["id"], "path parameter id leaked into the body")
    }

    func testUpdateManySendsArrayFiltersInTheBody() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.updateMany([
            "collectionName": "orders",
            "filter": #"{"status":"open"}"#,
            "update": #"{"lines.$[].qty":1}"#,
            "arrayFilters": "[]"
        ])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/database/collections/orders/many")
        let json = try bodyJSON(mock)
        XCTAssertEqual(json["update"] as? String, #"{"lines.$[].qty":1}"#)
        XCTAssertEqual(json["arrayFilters"] as? String, "[]")
    }

    func testNestedFilterAndSortPassThroughOnFind() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.database.find([
            "collectionName": "orders",
            "filter": #"{"address.city":"Vilnius","lines":{"$elemMatch":{"sku":"A-1"}}}"#,
            "sortBy": "address.city"
        ])

        let query = queryItems(mock)
        XCTAssertEqual(query["filter"], #"{"address.city":"Vilnius","lines":{"$elemMatch":{"sku":"A-1"}}}"#)
        XCTAssertEqual(query["sortBy"], "address.city")
    }

    // MARK: - Schema field shapes pass through untouched

    func testSchemaAnswerKeepsTheNewFieldShapes() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"""
        {"result":{"id":"sch_1","dataSchema":{"properties":{
          "address":{"$fieldType":"object","properties":{"city":{"$fieldType":"string","default":"Vilnius","unique":false}},"required":["city"]},
          "lines":{"$fieldType":"array","items":{"$fieldType":"object"},"minItems":1,"maxItems":10,"uniqueItems":true},
          "meta":{"$fieldType":"json","maxBytes":2048},
          "price":{"$fieldType":"currency","multipleOf":0.01,"minimum":0,"default":{"value":9.5,"currency":"EUR"}},
          "author":{"$fieldType":"user","displayField":"displayName"},
          "photos":{"$fieldType":"files","minItems":0,"maxItems":5,"allowedFileType":"image/*","maxSizeMb":10}}}},
         "responseStatus":{"isSuccess":true}}
        """#.utf8)
        let client = try makeClient(mock)

        let answer = try await client.database.getDatabaseSchema(["id": "sch_1"])
        let props = try XCTUnwrap(
            (((answer as? [String: Any])?["result"] as? [String: Any])?["dataSchema"] as? [String: Any])?["properties"] as? [String: Any]
        )

        XCTAssertEqual((props["address"] as? [String: Any])?["$fieldType"] as? String, "object")
        XCTAssertEqual((props["lines"] as? [String: Any])?["maxItems"] as? Int, 10)
        XCTAssertEqual((props["meta"] as? [String: Any])?["maxBytes"] as? Int, 2048)
        XCTAssertEqual((props["price"] as? [String: Any])?["multipleOf"] as? Double, 0.01)
        XCTAssertEqual(((props["price"] as? [String: Any])?["default"] as? [String: Any])?["currency"] as? String, "EUR")
        XCTAssertEqual((props["author"] as? [String: Any])?["displayField"] as? String, "displayName")
        XCTAssertEqual((props["photos"] as? [String: Any])?["allowedFileType"] as? String, "image/*")
    }

    func testTermRowsCarrySlug() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"""
        {"list":{"items":[{"id":"term_fr","name":"France","slug":"france","order":1}],"hasMore":false},"responseStatus":{"isSuccess":true}}
        """#.utf8)
        let client = try makeClient(mock)

        let answer = try await client.database.findTerms(["taxonomyName": "countries"])
        let items = try XCTUnwrap(((answer as? [String: Any])?["list"] as? [String: Any])?["items"] as? [[String: Any]])

        XCTAssertEqual(items.first?["slug"] as? String, "france")
    }

    // MARK: - Files by id

    func testGetFileByIdHitsTheByIdRouteAndDecodesTheDetails() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"""
        {"file":{"resource":{"id":"nbfl_7f3","originalFileName":"report.pdf","extension":"pdf","sizeBytes":1234},
                 "integrationId":"nbin_1","provider":"AwsS3","path":"docs/report.pdf"},
         "isPublic":false,"publicUrl":null,"responseStatus":{"isSuccess":true}}
        """#.utf8)
        let client = try makeClient(mock)

        let details = try await client.files.getFileById(integrationId: "nbin_1", id: "nbfl_7f3")

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/files/nbin_1/by-id/nbfl_7f3")
        XCTAssertNil(mock.lastRequest?.url?.query, "both ids are path parameters")
        XCTAssertEqual(details.file?.resource.id, "nbfl_7f3")
        XCTAssertEqual(details.file?.resource.originalFileName, "report.pdf")
        XCTAssertEqual(details.file?.provider, .awsS3)
        XCTAssertEqual(details.isPublic, false)
    }

    func testGetFileByIdUnknownIdIsA404() async throws {
        let mock = MockHTTPExecutor()
        mock.responseStatus = 404
        mock.responseBody = Data(#"{"responseStatus":{"isSuccess":false,"errors":[{"message":"File not found","errorCode":"CM-ERRORS-FILES-002"}]}}"#.utf8)
        let client = try makeClient(mock)

        do {
            _ = try await client.files.getFileById(integrationId: "nbin_1", id: "nbfl_nope")
            XCTFail("expected a 404")
        } catch let error as NorbixError {
            XCTAssertEqual(error.httpStatus, 404)
            XCTAssertEqual(error.errorCode, "CM-ERRORS-FILES-002")
        }
    }

    // MARK: - New refusal codes

    func testArrayFiltersPairingRefusalIs014WithAReason() async throws {
        let error = try await refusal("CM-ERRORS-DATABASE-014", context: #"{"Reason":"arrayFilters has no filter for identifier 'line'"}"#) { client in
            try await client.database.updateOne([
                "collectionName": "orders", "id": "rec_1",
                "update": #"{"lines.$[line].qty":3}"#, "arrayFilters": "[]"
            ])
        }
        XCTAssertEqual(error.errorCode, "CM-ERRORS-DATABASE-014")
        XCTAssertEqual(error.errors.first?.context["Reason"], "arrayFilters has no filter for identifier 'line'")
    }

    func testValidationRefusalsAreOneCodePerKeywordWithTheFullPath() async throws {
        let cases: [(code: String, keyword: String)] = [
            ("CM-ERRORS-DATABASE-039", "type"), ("CM-ERRORS-DATABASE-040", "length"),
            ("CM-ERRORS-DATABASE-041", "pattern"), ("CM-ERRORS-DATABASE-042", "format"),
            ("CM-ERRORS-DATABASE-043", "range"), ("CM-ERRORS-DATABASE-044", "multipleOf"),
            ("CM-ERRORS-DATABASE-045", "enum"), ("CM-ERRORS-DATABASE-046", "uniqueItems"),
            ("CM-ERRORS-DATABASE-047", "properties"), ("CM-ERRORS-DATABASE-048", "coordinates"),
            ("CM-ERRORS-DATABASE-049", "translateOptions")
        ]
        for item in cases {
            let error = try await refusal(item.code, context: #"{"Keyword":"\#(item.keyword)","FieldName":"lines[0].qty"}"#) { client in
                try await client.database.insertOne(["collectionName": "orders", "document": #"{"lines":[{"qty":"x"}]}"#])
            }
            XCTAssertEqual(error.errorCode, item.code)
            XCTAssertEqual(error.errors.first?.context["Keyword"], item.keyword)
            XCTAssertEqual(error.errors.first?.context["FieldName"], "lines[0].qty")
        }
    }

    func testRequiredInsideANestedFormIs030() async throws {
        let error = try await refusal("CM-ERRORS-DATABASE-030", context: #"{"Keyword":"required","FieldName":"address.city"}"#) { client in
            try await client.database.insertOne(["collectionName": "orders", "document": #"{"address":{}}"#])
        }
        XCTAssertEqual(error.errorCode, "CM-ERRORS-DATABASE-030")
        XCTAssertEqual(error.errors.first?.context["FieldName"], "address.city")
    }

    func testMissingReferenceTargetsAre050To054WithTheMissingId() async throws {
        for code in ["CM-ERRORS-DATABASE-050", "CM-ERRORS-DATABASE-051", "CM-ERRORS-DATABASE-052",
                     "CM-ERRORS-DATABASE-053", "CM-ERRORS-DATABASE-054"] {
            let error = try await refusal(code, context: #"{"MissingId":"usr_gone","FieldName":"author"}"#) { client in
                try await client.database.insertOne(["collectionName": "posts", "document": #"{"author":"usr_gone"}"#])
            }
            XCTAssertEqual(error.errorCode, code)
            XCTAssertEqual(error.errors.first?.context["MissingId"], "usr_gone")
        }
    }

    func testUnreadableTargetIs055() async throws {
        let error = try await refusal("CM-ERRORS-DATABASE-055", context: #"{"Target":"taxonomy:countries"}"#) { client in
            try await client.database.insertOne(["collectionName": "posts", "document": #"{"country":"term_fr"}"#])
        }
        XCTAssertEqual(error.errorCode, "CM-ERRORS-DATABASE-055")
        XCTAssertEqual(error.errors.first?.context["Target"], "taxonomy:countries")
    }

    func testExpandWithoutReadOnALinkedSourceIs056NamingTheSource() async throws {
        let error = try await refusal("CM-ERRORS-DATABASE-056", status: 403,
                                      context: #"{"SourceKind":"users","Source":"users","Fields":"author","MissingPermissions":"membership:read"}"#) { client in
            try await client.database.find(["collectionName": "posts", "expandReferences": true])
        }
        XCTAssertEqual(error.httpStatus, 403)
        XCTAssertEqual(error.errorCode, "CM-ERRORS-DATABASE-056")
        XCTAssertEqual(error.errors.first?.context["SourceKind"], "users")
        XCTAssertEqual(error.errors.first?.context["Fields"], "author")
        XCTAssertEqual(error.errors.first?.context["MissingPermissions"], "membership:read")
    }

    func testSortThroughAListIsRefusedWith039() async throws {
        let error = try await refusal("CM-ERRORS-DATABASE-039", context: #"{"Keyword":"type","FieldName":"lines.qty"}"#) { client in
            try await client.database.find(["collectionName": "orders", "sortBy": "lines.qty"])
        }
        XCTAssertEqual(error.errorCode, "CM-ERRORS-DATABASE-039")
        XCTAssertEqual(error.errors.first?.context["FieldName"], "lines.qty")
    }
}
