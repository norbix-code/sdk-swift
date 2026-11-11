import XCTest
@testable import NorbixHub
import NorbixCore

/// Email click ids (`nblid`): `updateEmailClickTracking` switches them on or off
/// (`PATCH /{version}/notifications/email/settings/click-tracking`) and
/// `recordEmailClicks` hands clicks back (`POST /{version}/notifications/email/clicks`).
/// The request travels as the JSON body, never the query, and the gateway's answer
/// is handed back as is. Every call goes to `MockHTTPExecutor` — never a real gateway.
final class HubNotificationEmailClickIdsTests: XCTestCase {

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

    func testUpdateEmailClickTrackingOn() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.updateEmailClickTracking(["enabled": true])

        XCTAssertEqual(mock.capturedRequests.count, 1)
        XCTAssertEqual(mock.lastRequest?.httpMethod, "PATCH")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/notifications/email/settings/click-tracking")
        XCTAssertNil(mock.lastRequest?.url?.query, "a PATCH carries its request in the body, not the query")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
        let sent = try body(mock)
        XCTAssertEqual(sent.keys.sorted(), ["enabled"])
        XCTAssertEqual(sent["enabled"] as? Bool, true)
    }

    /// `false` is a value, not a default: it must be on the wire.
    func testUpdateEmailClickTrackingOffIsSent() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.updateEmailClickTracking(["enabled": false])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PATCH")
        XCTAssertNil(mock.lastRequest?.url?.query)
        let sent = try body(mock)
        XCTAssertEqual(sent.keys.sorted(), ["enabled"])
        XCTAssertEqual(sent["enabled"] as? Bool, false)
    }

    func testRecordEmailClicks() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"recorded":1,"duplicates":0,"flagged":1,"rejected":1,"clicks":[{"index":0,"status":"recorded","flag":"suspected-scanner","flagReason":"user-agent","campaignId":"cmp_1","notificationId":"ntf_1","linkIndex":2,"to":["ann@example.com"]},{"index":1,"status":"rejected","reason":"not-valid"}]}"#.utf8)
        let client = try makeClient(mock)

        let answer = try await client.notifications.recordEmailClicks([
            "clicks": [
                [
                    "nblid": "ntf_1.2.1.abc",
                    "url": "https://shop.example.com/sale?nblid=ntf_1.2.1.abc",
                    "clickedAt": "2026-11-11T10:00:00Z",
                    "userAgent": "Mozilla/5.0",
                ],
                ["nblid": "made-up"],
            ],
        ])

        XCTAssertEqual(mock.capturedRequests.count, 1)
        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/notifications/email/clicks")
        XCTAssertNil(mock.lastRequest?.url?.query, "a POST carries its request in the body, not the query")
        let sent = try body(mock)
        XCTAssertEqual(sent.keys.sorted(), ["clicks"])
        let clicks = try XCTUnwrap(sent["clicks"] as? [[String: Any]])
        XCTAssertEqual(clicks.count, 2)
        XCTAssertEqual(clicks[0]["nblid"] as? String, "ntf_1.2.1.abc")
        XCTAssertEqual(clicks[0]["url"] as? String, "https://shop.example.com/sale?nblid=ntf_1.2.1.abc")
        XCTAssertEqual(clicks[0]["clickedAt"] as? String, "2026-11-11T10:00:00Z")
        XCTAssertEqual(clicks[0]["userAgent"] as? String, "Mozilla/5.0")
        XCTAssertEqual(clicks[1].keys.sorted(), ["nblid"])

        let map = try XCTUnwrap(answer as? [String: Any])
        XCTAssertEqual(map["recorded"] as? Int, 1)
        XCTAssertEqual(map["rejected"] as? Int, 1)
        let results = try XCTUnwrap(map["clicks"] as? [[String: Any]])
        XCTAssertEqual(results.count, 2)
        XCTAssertEqual(results[0]["flag"] as? String, "suspected-scanner")
        XCTAssertEqual(results[0]["flagReason"] as? String, "user-agent")
        XCTAssertEqual(results[0]["to"] as? [String], ["ann@example.com"])
        XCTAssertEqual(results[1]["status"] as? String, "rejected")
        XCTAssertEqual(results[1]["reason"] as? String, "not-valid")
    }
}
