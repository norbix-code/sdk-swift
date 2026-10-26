import XCTest
@testable import NorbixHub
import NorbixCore

/// `retryFailedEmailNotifications`, `retryFailedSmsNotifications` and
/// `retryFailedPushNotifications` (gateway 2.3.9, N-28): one POST per channel
/// to `…/campaigns/{Id}/retry-failed`, the campaign id in the path only, the
/// rest of the request as the JSON body, and the gateway's answer handed back
/// as is. Every call goes to `MockHTTPExecutor` — never a real gateway.
final class HubNotificationRetryFailedTests: XCTestCase {

    private func makeClient(_ mock: MockHTTPExecutor) throws -> NorbixHubClient {
        try NorbixHubClient(
            projectId: "proj",
            bearerToken: "token",
            accountId: "acc",
            executor: mock
        )
    }

    private func body(_ mock: MockHTTPExecutor) throws -> [String: Any] {
        let data = try XCTUnwrap(mock.lastRequest?.httpBody)
        return try XCTUnwrap(JSONSerialization.jsonObject(with: data) as? [String: Any])
    }

    private func assertRetryFailed(_ mock: MockHTTPExecutor, _ channel: String) throws {
        XCTAssertEqual(mock.capturedRequests.count, 1)
        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/notifications/\(channel)/campaigns/cmp_1/retry-failed")
        XCTAssertNil(mock.lastRequest?.url?.query, "a POST carries its request in the body, not the query")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
        let sent = try body(mock)
        XCTAssertEqual(sent["idempotencyKey"] as? String, "retry-2026-10-26-1")
        XCTAssertNil(sent["Id"], "the campaign id goes into the path, not the body")
    }

    func testRetryFailedEmailNotifications() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.retryFailedEmailNotifications(["Id": "cmp_1", "idempotencyKey": "retry-2026-10-26-1"])

        try assertRetryFailed(mock, "email")
    }

    func testRetryFailedSmsNotifications() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.retryFailedSmsNotifications(["Id": "cmp_1", "idempotencyKey": "retry-2026-10-26-1"])

        try assertRetryFailed(mock, "sms")
    }

    func testRetryFailedPushNotifications() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.retryFailedPushNotifications(["Id": "cmp_1", "idempotencyKey": "retry-2026-10-26-1"])

        try assertRetryFailed(mock, "push")
    }

    /// Optional fields are sent only when the caller passes them: the minimal
    /// call carries the key alone, the full call carries every selector.
    func testRetryFailedSendsOnlyTheFieldsGiven() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.retryFailedEmailNotifications(["Id": "cmp_1", "idempotencyKey": "k1"])
        let minimal = try body(mock)
        XCTAssertEqual(minimal.keys.sorted(), ["idempotencyKey"])

        _ = try await client.notifications.retryFailedEmailNotifications([
            "Id": "cmp_1",
            "idempotencyKey": "k2",
            "databaseIntegrationId": "dbi_1",
            "notificationIds": ["ntf_1", "ntf_2"],
            "includeAmbiguous": true,
            "categories": ["Transient", "Unknown"],
        ])
        let full = try body(mock)
        XCTAssertEqual(full.keys.sorted(), ["categories", "databaseIntegrationId", "idempotencyKey", "includeAmbiguous", "notificationIds"])
        XCTAssertEqual(full["databaseIntegrationId"] as? String, "dbi_1")
        XCTAssertEqual(full["notificationIds"] as? [String], ["ntf_1", "ntf_2"])
        XCTAssertEqual(full["includeAmbiguous"] as? Bool, true)
        XCTAssertEqual(full["categories"] as? [String], ["Transient", "Unknown"])
        XCTAssertEqual(mock.capturedRequests.count, 2)
    }

    /// The answer (`retryRequestId`, `selected`, `skipped`, `replayed`,
    /// `warning`) reaches the caller untouched.
    func testRetryFailedHandsBackTheGatewayAnswer() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"retryRequestId":"rr_1","selected":3,"skipped":{"NotFailed":2,"Ambiguous":1},"replayed":false,"warning":"Ambiguous rows may send a duplicate."}"#.utf8)
        let client = try makeClient(mock)

        let answer = try await client.notifications.retryFailedSmsNotifications(["Id": "cmp_1", "idempotencyKey": "k1", "includeAmbiguous": true])

        let map = try XCTUnwrap(answer as? [String: Any])
        XCTAssertEqual(map["retryRequestId"] as? String, "rr_1")
        XCTAssertEqual(map["selected"] as? Int, 3)
        XCTAssertEqual(map["skipped"] as? [String: Int], ["NotFailed": 2, "Ambiguous": 1])
        XCTAssertEqual(map["replayed"] as? Bool, false)
        XCTAssertEqual(map["warning"] as? String, "Ambiguous rows may send a duplicate.")
    }

    /// Without the campaign id the SDK refuses the call before any request
    /// goes out, like every other `{Id}` route.
    func testRetryFailedWithoutIdThrowsBeforeSending() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        do {
            _ = try await client.notifications.retryFailedPushNotifications(["idempotencyKey": "k1"])
            XCTFail("expected NORBIX_MISSING_PATH_PARAM")
        } catch let error as NorbixError {
            XCTAssertEqual(error.code, "NORBIX_MISSING_PATH_PARAM")
        }
        XCTAssertTrue(mock.capturedRequests.isEmpty)
    }
}
