import XCTest
@testable import NorbixApi
import NorbixCore

private struct Order: Codable, Sendable, Equatable {
    let id: String
    let total: Double
}

final class TypedDecodeTests: XCTestCase {
    func testFindReturnsTypedPage() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"""
        {"items":[{"id":"o1","total":10.0},{"id":"o2","total":20.5}],"total":2,"take":20,"skip":0}
        """#.utf8)
        let client = try NorbixApiClient(
            projectId: "p1", apiKey: "k", executor: mock
        )

        let page: Page<Order> = try await client.database.find(
            collection: "orders",
            query: ["take": 20, "skip": 0],
            as: Order.self
        )

        XCTAssertEqual(page.items.count, 2)
        XCTAssertEqual(page.items.first, Order(id: "o1", total: 10.0))
        XCTAssertEqual(page.total, 2)
    }

    // Answer shape of GET /{version}/database/collections/{collectionName}:
    // FindResponse.list is the gateway's PaginatedResponse (items + cursors).
    static let gatewayFindAnswer = #"""
    {"list":{"items":[{"_id":"6710a1f0c2b7e41a2b3c4d5e","title":"First","price":10.5},{"_id":"6710a1f0c2b7e41a2b3c4d5f","title":"Second","price":20}],"hasMore":true,"hasPrevious":false,"startingAfter":"6710a1f0c2b7e41a2b3c4d5f"},"responseStatus":{"isSuccess":true,"errors":[]}}
    """#

    private struct Product: Codable, Sendable, Equatable {
        let id: String
        let title: String
        let price: Double
        enum CodingKeys: String, CodingKey { case id = "_id", title, price }
    }

    func testFindReadsListItemsFromTheGatewayAnswer() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(Self.gatewayFindAnswer.utf8)
        let client = try NorbixApiClient(projectId: "p1", apiKey: "k", executor: mock)

        let page: Page<Product> = try await client.database.find(collection: "products", as: Product.self)

        XCTAssertEqual(page.items, [
            Product(id: "6710a1f0c2b7e41a2b3c4d5e", title: "First", price: 10.5),
            Product(id: "6710a1f0c2b7e41a2b3c4d5f", title: "Second", price: 20)
        ])
        XCTAssertEqual(page.hasMore, true)
        XCTAssertEqual(page.hasPrevious, false)
        XCTAssertEqual(page.startingAfter, "6710a1f0c2b7e41a2b3c4d5f")
        XCTAssertNil(page.total)
    }

    func testFindReadsAnEmptyList() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"list":{"items":[],"hasMore":false},"responseStatus":{"isSuccess":true}}"#.utf8)
        let client = try NorbixApiClient(projectId: "p1", apiKey: "k", executor: mock)

        let page: Page<Product> = try await client.database.find(collection: "products", as: Product.self)

        XCTAssertTrue(page.items.isEmpty)
        XCTAssertEqual(page.hasMore, false)
    }

    // GET /{version}/membership/auth answers GetUsersResponse { list: PaginatedResponse<AuthDto> }.
    func testGetUsersReadsListItems() async throws {
        struct User: Codable, Sendable { let id: String; let email: String }
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"list":{"items":[{"id":"usr_1","email":"a@b.c"}],"hasMore":false}}"#.utf8)
        let client = try NorbixApiClient(projectId: "p1", apiKey: "k", executor: mock)

        let page: Page<User> = try await client.membership.getUsers(as: User.self)

        XCTAssertEqual(page.items.map(\.email), ["a@b.c"])
    }

    func testPageStillReadsABareArray() throws {
        let page = try JSONDecoder.norbixDefault.decode(Page<Order>.self, from: Data(#"[{"id":"o1","total":1}]"#.utf8))
        XCTAssertEqual(page.items, [Order(id: "o1", total: 1)])
    }

    func testUnknownAnswerShapeThrowsInsteadOfAnEmptyPage() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"result":[{"id":"o1","total":1}],"responseStatus":{"isSuccess":true}}"#.utf8)
        let client = try NorbixApiClient(projectId: "p1", apiKey: "k", executor: mock)

        do {
            let _: Page<Order> = try await client.database.find(collection: "orders", as: Order.self)
            XCTFail("expected NORBIX_DECODE_ERROR")
        } catch let error as NorbixError {
            XCTAssertEqual(error.code, "NORBIX_DECODE_ERROR")
            XCTAssertNotNil(error.rawBody)
        }
    }

    func testItemsThatDoNotDecodeThrowInsteadOfAnEmptyPage() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"list":{"items":[{"id":42}],"hasMore":false}}"#.utf8)
        let client = try NorbixApiClient(projectId: "p1", apiKey: "k", executor: mock)

        do {
            let _: Page<Order> = try await client.database.find(collection: "orders", as: Order.self)
            XCTFail("expected NORBIX_DECODE_ERROR")
        } catch let error as NorbixError {
            XCTAssertEqual(error.code, "NORBIX_DECODE_ERROR")
        }
    }

    // GET /{version}/database/collections/{collectionName}/{id} answers
    // FindOneResponse: the record is under "result".
    func testFindOneReturnsTypedItem() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"""
        {"result":{"id":"o1","total":99.99},"responseStatus":{"isSuccess":true,"errors":[]}}
        """#.utf8)
        let client = try NorbixApiClient(
            projectId: "p1", apiKey: "k", executor: mock
        )

        let order: Order = try await client.database.findOne(
            collection: "orders",
            id: "o1",
            as: Order.self
        )

        XCTAssertEqual(order, Order(id: "o1", total: 99.99))
    }

    func testDecodeErrorIsTypedNorbixError() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"result":{"id":42,"total":"not-a-number"}}"#.utf8)
        let client = try NorbixApiClient(
            projectId: "p1", apiKey: "k", executor: mock
        )

        do {
            let _: Order = try await client.database.findOne(
                collection: "orders", id: "x", as: Order.self
            )
            XCTFail("expected throw")
        } catch let error as NorbixError {
            XCTAssertEqual(error.code, "NORBIX_DECODE_ERROR")
            XCTAssertNotNil(error.rawBody)
        }
    }

    func testFindOneWithoutResultThrows() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"id":"o1","total":1}"#.utf8)
        let client = try NorbixApiClient(projectId: "p1", apiKey: "k", executor: mock)

        do {
            let _: Order = try await client.database.findOne(collection: "orders", id: "o1", as: Order.self)
            XCTFail("expected NORBIX_DECODE_ERROR")
        } catch let error as NorbixError {
            XCTAssertEqual(error.code, "NORBIX_DECODE_ERROR")
        }
    }

    // Records have no fixed shape: JSONValue decodes them as they arrived.
    func testFindDecodesRecordsAsJSONValue() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(Self.gatewayFindAnswer.utf8)
        let client = try NorbixApiClient(projectId: "p1", apiKey: "k", executor: mock)

        let page: Page<JSONValue> = try await client.database.find(collection: "products", as: JSONValue.self)

        XCTAssertEqual(page.items.count, 2)
        XCTAssertEqual(page.items[0]["_id"]?.stringValue, "6710a1f0c2b7e41a2b3c4d5e")
        XCTAssertEqual(page.items[0]["price"]?.doubleValue, 10.5)
        XCTAssertEqual(page.items[1]["price"]?.intValue, 20)
        XCTAssertNil(page.items[0]["missing"])
    }

    func testFindOneDecodesARecordAsJSONValue() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"""
        {"result":{"_id":"r1","title":"Hello","tags":["a","b"],"stock":{"count":3,"open":true},"note":null}}
        """#.utf8)
        let client = try NorbixApiClient(projectId: "p1", apiKey: "k", executor: mock)

        let record: JSONValue = try await client.database.findOne(collection: "posts", id: "r1", as: JSONValue.self)

        XCTAssertEqual(record["title"]?.stringValue, "Hello")
        XCTAssertEqual(record["tags"]?[1]?.stringValue, "b")
        XCTAssertEqual(record["stock"]?["count"]?.intValue, 3)
        XCTAssertEqual(record["stock"]?["open"]?.boolValue, true)
        XCTAssertEqual(record["note"]?.isNull, true)
        let dict = try XCTUnwrap(record.anyValue as? [String: Any])
        XCTAssertEqual(dict["title"] as? String, "Hello")
    }
}
