import XCTest
@testable import NorbixApi
import NorbixCore

/// `client.payments` — payment orders and checkout (gateway campaign
/// audit/payments-checkout), through the mock executor: verb, path, path
/// param, body / query, and the decoded answer.
final class PaymentsModuleTests: XCTestCase {

    private func makeClient(_ mock: MockHTTPExecutor) throws -> NorbixApiClient {
        try NorbixApiClient(projectId: "p1", apiKey: "k", executor: mock)
    }

    private static let orderJson = #"""
    {"id":"ord_1","env":"PROD","buyerUserId":"usr_1","merchantReference":"ad-1042-promo-1",
     "currency":"EUR","priceVersion":"v1",
     "lines":[{"sku":"star-day","title":"Star × day","quantity":21,"unitAmountMinor":30,"amountMinor":630}],
     "totalMinor":630,"metadata":{"adId":"ad_1042"},"status":"CheckoutStarted",
     "createdOnUtc":"2026-10-18T10:00:00.123Z","updatedOnUtc":"2026-10-18T10:01:00Z",
     "checkouts":[{"attempt":1,"integrationId":"int_montonio","provider":"Montonio",
       "providerOrderId":"mnt-1","providerReference":"ref-1","paymentUrl":"https://pay.example/mnt-1",
       "method":"paymentInitiation","startedOnUtc":"2026-10-18T10:01:00Z","expiresAtUtc":"2026-10-18T10:31:00Z"}],
     "refundedMinor":0,"mismatches":[]}
    """#

    private func jsonBody(_ mock: MockHTTPExecutor) throws -> [String: Any] {
        let body = try XCTUnwrap(mock.lastRequest?.httpBody)
        return try XCTUnwrap(JSONSerialization.jsonObject(with: body) as? [String: Any])
    }

    private func queryItems(_ mock: MockHTTPExecutor) throws -> [String: String] {
        let url = try XCTUnwrap(mock.lastRequest?.url)
        let items = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems ?? []
        return Dictionary(uniqueKeysWithValues: items.map { ($0.name, $0.value ?? "") })
    }

    // MARK: - createPaymentOrder

    func testCreatePaymentOrderPostsTheOrderAndReturnsTheId() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"id":"ord_1","responseStatus":{}}"#.utf8)
        let client = try makeClient(mock)

        let id = try await client.payments.createPaymentOrder(
            buyerUserId: "usr_1",
            merchantReference: "ad-1042-promo-1",
            currency: "EUR",
            priceVersion: "v1",
            lines: [PaymentOrderLineInput(sku: "star-day", quantity: 21, unitAmountMinor: 30)],
            idempotencyKey: "idem-ad-1042",
            metadata: ["adId": "ad_1042"]
        )

        XCTAssertEqual(id, "ord_1")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/payments/orders")
        let json = try jsonBody(mock)
        XCTAssertEqual(json["buyerUserId"] as? String, "usr_1")
        XCTAssertEqual(json["merchantReference"] as? String, "ad-1042-promo-1")
        XCTAssertEqual(json["currency"] as? String, "EUR")
        XCTAssertEqual(json["priceVersion"] as? String, "v1")
        XCTAssertEqual(json["idempotencyKey"] as? String, "idem-ad-1042")
        XCTAssertEqual(json["metadata"] as? [String: String], ["adId": "ad_1042"])
        let lines = try XCTUnwrap(json["lines"] as? [[String: Any]])
        XCTAssertEqual(lines.count, 1)
        XCTAssertEqual(lines[0]["sku"] as? String, "star-day")
        XCTAssertEqual(lines[0]["quantity"] as? Int, 21)
        XCTAssertEqual(lines[0]["unitAmountMinor"] as? Int, 30)
        XCTAssertNil(lines[0]["title"])
    }

    func testCreatePaymentOrderLeavesOutUnsetOptionals() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"id":"ord_1"}"#.utf8)
        let client = try makeClient(mock)

        _ = try await client.payments.createPaymentOrder(
            buyerUserId: "usr_1", merchantReference: "m", currency: "EUR", priceVersion: "v1",
            lines: [PaymentOrderLineInput(quantity: 1, unitAmountMinor: 100)]
        )

        let json = try jsonBody(mock)
        XCTAssertNil(json["idempotencyKey"])
        XCTAssertNil(json["metadata"])
    }

    func testCreatePaymentOrderThrowsWhenNoIdReturned() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"responseStatus":{}}"#.utf8)
        let client = try makeClient(mock)

        do {
            _ = try await client.payments.createPaymentOrder(
                buyerUserId: "usr_1", merchantReference: "m", currency: "EUR", priceVersion: "v1",
                lines: []
            )
            XCTFail("Expected an error when the gateway returns no id")
        } catch let error as NorbixError {
            XCTAssertEqual(error.code, "NORBIX_EMPTY_RESPONSE")
        }
    }

    // MARK: - getPaymentOrder

    func testGetPaymentOrderPutsTheIdInThePathAndDecodesTheItem() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"item":\#(Self.orderJson)}"#.utf8)
        let client = try makeClient(mock)

        let order = try await client.payments.getPaymentOrder(id: "ord_1")

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/payments/orders/ord_1")
        XCTAssertNil(mock.lastRequest?.url?.query)
        XCTAssertNil(mock.lastRequest?.httpBody)
        XCTAssertEqual(order.id, "ord_1")
        XCTAssertEqual(order.totalMinor, 630)
        XCTAssertEqual(order.status, "CheckoutStarted")
        XCTAssertEqual(order.metadata, ["adId": "ad_1042"])
        XCTAssertEqual(order.lines.first?.amountMinor, 630)
        XCTAssertEqual(order.checkouts.first?.paymentUrl, "https://pay.example/mnt-1")
        XCTAssertNotNil(order.createdOnUtc)
        XCTAssertNil(order.settledMinor)
        XCTAssertEqual(order.mismatches, [])
    }

    // MARK: - getPaymentOrders

    func testGetPaymentOrdersSendsTheFiltersInTheQuery() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"""
        {"list":{"items":[\#(Self.orderJson)],"hasMore":true,"startingAfter":"ord_1"}}
        """#.utf8)
        let client = try makeClient(mock)

        let page = try await client.payments.getPaymentOrders(
            buyerUserId: "usr_1",
            merchantReference: "ad-1042-promo-1",
            status: "Paid",
            pageSize: 20
        )

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/payments/orders")
        XCTAssertEqual(try queryItems(mock), [
            "buyerUserId": "usr_1",
            "merchantReference": "ad-1042-promo-1",
            "status": "Paid",
            "pageSize": "20",
        ])
        XCTAssertNil(mock.lastRequest?.httpBody)
        XCTAssertEqual(page.orders.map(\.id), ["ord_1"])
        XCTAssertTrue(page.hasMore)
        XCTAssertEqual(page.nextCursor, "ord_1")
    }

    func testGetPaymentOrdersWithoutFiltersSendsNoQuery() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"list":{"items":[]}}"#.utf8)
        let client = try makeClient(mock)

        let page = try await client.payments.getPaymentOrders()

        XCTAssertNil(mock.lastRequest?.url?.query)
        XCTAssertEqual(page.orders.count, 0)
        XCTAssertFalse(page.hasMore)
    }

    // MARK: - startPaymentCheckout

    func testStartPaymentCheckoutPostsToTheOrderCheckoutRoute() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"""
        {"checkout":{"attempt":1,"integrationId":"int_montonio","provider":"Montonio",
          "paymentUrl":"https://pay.example/mnt-1"},
         "reused":true,"order":\#(Self.orderJson)}
        """#.utf8)
        let client = try makeClient(mock)

        let started = try await client.payments.startPaymentCheckout(
            id: "ord_1",
            integrationId: "int_montonio",
            returnUrl: "https://shop.example/return",
            method: "paymentInitiation",
            preferredCountry: "LT"
        )

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/payments/orders/ord_1/checkout")
        let json = try jsonBody(mock)
        XCTAssertEqual(json["integrationId"] as? String, "int_montonio")
        XCTAssertEqual(json["returnUrl"] as? String, "https://shop.example/return")
        XCTAssertEqual(json["method"] as? String, "paymentInitiation")
        XCTAssertEqual(json["preferredCountry"] as? String, "LT")
        XCTAssertNil(json["preferredProvider"])
        // The order id is consumed by the route, not the body.
        XCTAssertNil(json["id"])
        XCTAssertEqual(started.checkout?.paymentUrl, "https://pay.example/mnt-1")
        XCTAssertTrue(started.reused)
        XCTAssertEqual(started.order?.id, "ord_1")
    }
}
