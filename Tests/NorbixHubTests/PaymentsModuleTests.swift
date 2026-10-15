import XCTest
@testable import NorbixHub
import NorbixCore

final class HubPaymentsModuleTests: XCTestCase {
    func testModuleSurface() async throws {
        let client = try NorbixHubClient(
            projectId: "proj",
            bearerToken: "token",
            accountId: "acc",
            executor: MockHTTPExecutor()
        )
        XCTAssertNotNil(client.payments)
    }

    /// GET /{version}/payments/webhooks/log (gateway campaign audit/payments, item 8):
    /// verb, path and the filters on the query; the fake transport records the request.
    func testGetPaymentsWebhookLogSendsAGetWithTheFiltersOnTheQuery() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"list":[{"integrationId":"int_stripe","eventName":"payment_intent.succeeded","statusCode":200}]}"#.utf8)
        let client = try NorbixHubClient(projectId: "proj", bearerToken: "token", accountId: "acc", executor: mock)

        _ = try await client.payments.getPaymentsWebhookLog(["integrationId": "int_stripe", "limit": 20])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/payments/webhooks/log")
        let items = URLComponents(url: try XCTUnwrap(mock.lastRequest?.url), resolvingAgainstBaseURL: false)?.queryItems ?? []
        let query = Dictionary(items.map { ($0.name, $0.value ?? "") }, uniquingKeysWith: { a, _ in a })
        XCTAssertEqual(query["integrationId"], "int_stripe")
        XCTAssertEqual(query["limit"], "20")
    }
}
