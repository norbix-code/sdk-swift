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

    private static let quotaBody = Data(#"{"responseStatus":{"isSuccess":false,"errors":[{"errorCode":"CM-ERRORS-LOGGING-003","message":"Log quota used up"}]}}"#.utf8)

    /// Answers one call with `status`, `headers` and `body`; a second call
    /// (a retry) would get a 200 and so show up as a missing error.
    private func writeOneAndCatch(
        status: Int,
        headers: [String: String] = [:],
        body: Data = LogsModuleTests.quotaBody
    ) async throws -> (NorbixError, MockHTTPExecutor) {
        let mock = MockHTTPExecutor()
        mock.responseQueue = [(status: status, body: body, headers: headers)]
        let client = try makeClient(mock)
        do {
            _ = try await client.logs.writeLogs(["entries": [["title": "x"]]])
        } catch let error as NorbixError {
            return (error, mock)
        }
        XCTFail("expected a NorbixError")
        throw NorbixError(message: "no error")
    }

    func testWriteLogsOverTheQuotaCarriesTheRetryAfterSeconds() async throws {
        let (error, mock) = try await writeOneAndCatch(status: 429, headers: ["Retry-After": "37"])

        XCTAssertEqual(error.status, 429)
        XCTAssertEqual(error.code, "CM-ERRORS-LOGGING-003")
        XCTAssertEqual(error.retryAfterSeconds, 37)
        XCTAssertEqual(mock.capturedRequests.count, 1)
        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/logs")
    }

    func testWriteLogsOverTheQuotaWithAnHTTPDateGivesTheSecondsUntilIt() async throws {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(identifier: "GMT")
        formatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss 'GMT'"
        let at = formatter.string(from: Date().addingTimeInterval(120))

        let (error, _) = try await writeOneAndCatch(status: 429, headers: ["Retry-After": at])

        let seconds = try XCTUnwrap(error.retryAfterSeconds)
        XCTAssertTrue((115...121).contains(seconds), "got \(seconds), want about 120")
    }

    func testWriteLogsOverTheQuotaWithoutRetryAfterLeavesItNil() async throws {
        let (error, mock) = try await writeOneAndCatch(status: 429)

        XCTAssertEqual(error.status, 429)
        XCTAssertNil(error.retryAfterSeconds)
        XCTAssertEqual(mock.capturedRequests.count, 1)
    }

    func testWriteLogsA500HasNoRetryAfter() async throws {
        let (error, mock) = try await writeOneAndCatch(
            status: 500,
            body: Data(#"{"responseStatus":{"errorCode":"CM-ERRORS-500","message":"Boom"}}"#.utf8)
        )

        XCTAssertEqual(error.status, 500)
        XCTAssertNil(error.retryAfterSeconds)
        XCTAssertEqual(mock.capturedRequests.count, 1)
    }

    func testRetryAfterSecondsReadsDeltaSecondsAndHTTPDates() throws {
        let now = try XCTUnwrap(ISO8601DateFormatter().date(from: "2026-10-21T08:00:00Z"))
        XCTAssertEqual(NorbixError.retryAfterSeconds(from: "37", now: now), 37)
        XCTAssertEqual(NorbixError.retryAfterSeconds(from: " 0 ", now: now), 0)
        XCTAssertEqual(NorbixError.retryAfterSeconds(from: "1.2", now: now), 2)
        XCTAssertEqual(NorbixError.retryAfterSeconds(from: "Wed, 21 Oct 2026 08:01:30 GMT", now: now), 90)
        XCTAssertEqual(NorbixError.retryAfterSeconds(from: "Wed, 21 Oct 2026 07:00:00 GMT", now: now), 0)
        XCTAssertNil(NorbixError.retryAfterSeconds(from: nil, now: now))
        XCTAssertNil(NorbixError.retryAfterSeconds(from: "", now: now))
        XCTAssertNil(NorbixError.retryAfterSeconds(from: "soon", now: now))
        XCTAssertNil(NorbixError.retryAfterSeconds(from: "-1", now: now))
        XCTAssertNil(NorbixError.retryAfterSeconds(from: "nan", now: now))
    }
}
