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

    func testFindOneReturnsTypedItem() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"""
        {"id":"o1","total":99.99}
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
        mock.responseBody = Data(#"{"id":42,"total":"not-a-number"}"#.utf8)
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
}
