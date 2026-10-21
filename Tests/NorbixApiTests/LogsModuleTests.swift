import XCTest
@testable import NorbixApi
import NorbixCore

/// `client.logs` — the app's own log lines (gateway campaign audit/logging,
/// Logs stage A), through the mock executor: verb, path, body, the answer and
/// the 429 quota refusal.
final class LogsModuleTests: XCTestCase {
    private func makeClient(_ mock: MockHTTPExecutor) throws -> NorbixApiClient {
        try NorbixApiClient(projectId: "p1", apiKey: "k", executor: mock)
    }

    func testModuleSurface() throws {
        XCTAssertNotNil(try makeClient(MockHTTPExecutor()).logs)
    }

    func testWriteLogsPostsTheEntriesAndAnswersAccepted() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"accepted":2}"#.utf8)
        let client = try makeClient(mock)

        let res = try await client.logs.writeLogs([
            "entries": [
                [
                    "level": "error",
                    "title": "Payment failed",
                    "message": "card declined",
                    "eventCode": "order:payment_failed",
                    "correlationId": "checkout-42",
                    "meta": ["orderId": "ord_1"]
                ],
                ["title": "Checkout opened"]
            ]
        ]) as? [String: Any]

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/logs")
        let body = try XCTUnwrap(mock.lastRequest?.httpBody)
        let json = try XCTUnwrap(JSONSerialization.jsonObject(with: body) as? [String: Any])
        let entries = try XCTUnwrap(json["entries"] as? [[String: Any]])
        XCTAssertEqual(entries.count, 2)
        XCTAssertEqual(entries[0]["level"] as? String, "error")
        XCTAssertEqual(entries[0]["title"] as? String, "Payment failed")
        XCTAssertEqual(entries[0]["eventCode"] as? String, "order:payment_failed")
        XCTAssertEqual(entries[0]["correlationId"] as? String, "checkout-42")
        XCTAssertEqual(entries[0]["meta"] as? [String: String], ["orderId": "ord_1"])
        XCTAssertEqual(entries[1]["title"] as? String, "Checkout opened")
        XCTAssertEqual(res?["accepted"] as? Int, 2)
    }

    func testWriteLogsOverTheQuotaThrowsA429WithTheGatewayCodeAndIsSentOnce() async throws {
        let mock = MockHTTPExecutor()
        mock.responseStatus = 429
        mock.responseBody = Data(#"{"responseStatus":{"isSuccess":false,"errors":[{"errorCode":"CM-ERRORS-LOGGING-003","message":"Log quota used up"}]}}"#.utf8)
        let client = try makeClient(mock)

        do {
            _ = try await client.logs.writeLogs(["entries": [["title": "x"]]])
            XCTFail("expected a NorbixError")
        } catch let error as NorbixError {
            XCTAssertEqual(error.status, 429)
            XCTAssertEqual(error.code, "CM-ERRORS-LOGGING-003")
        }
        // A POST without a caller-set Idempotency-Key is not resent.
        XCTAssertEqual(mock.capturedRequests.count, 1)
    }
}
