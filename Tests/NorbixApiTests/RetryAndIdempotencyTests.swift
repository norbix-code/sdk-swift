import XCTest
@testable import NorbixApi
import NorbixCore

final class RetryAndIdempotencyTests: XCTestCase {
    func testRetriesOn5xxThenSucceeds() async throws {
        let mock = MockHTTPExecutor()
        mock.responseQueue = [
            (status: 503, body: Data(#"{"message":"upstream busy"}"#.utf8), headers: [:]),
            (status: 503, body: Data(#"{"message":"upstream busy"}"#.utf8), headers: [:]),
            (status: 200, body: Data("{}".utf8), headers: [:])
        ]
        let policy = RetryPolicy(maxRetries: 3, baseDelay: 0.001, maxDelay: 0.01)
        let cfg = try NorbixConfig(
            projectId: "p1",
            auth: .apiKey("k"),
            baseUrl: "https://api.norbix.ai",
            version: "v2",
            retryPolicy: policy
        )
        let client = NorbixApiClient(config: cfg, executor: mock, logger: NoopLogger())

        _ = try await client.echo.echo([:])
        XCTAssertEqual(mock.capturedRequests.count, 3)
    }

    func testGivesUpAfterMaxRetries() async throws {
        let mock = MockHTTPExecutor()
        mock.responseStatus = 502
        mock.responseBody = Data(#"{"message":"bad gateway"}"#.utf8)
        let policy = RetryPolicy(maxRetries: 2, baseDelay: 0.001, maxDelay: 0.01)
        let cfg = try NorbixConfig(
            projectId: "p1",
            auth: .apiKey("k"),
            baseUrl: "https://api.norbix.ai",
            version: "v2",
            retryPolicy: policy
        )
        let client = NorbixApiClient(config: cfg, executor: mock, logger: NoopLogger())

        do {
            _ = try await client.echo.echo([:])
            XCTFail("expected failure")
        } catch let error as NorbixError {
            XCTAssertEqual(error.status, 502)
        }
        // 1 original + 2 retries = 3
        XCTAssertEqual(mock.capturedRequests.count, 3)
    }

    func testHonorsRetryAfterHeader() async throws {
        let mock = MockHTTPExecutor()
        mock.responseQueue = [
            (status: 429, body: Data("{}".utf8), headers: ["Retry-After": "0.01"]),
            (status: 200, body: Data("{}".utf8), headers: [:])
        ]
        let policy = RetryPolicy(maxRetries: 3, baseDelay: 0.001, maxDelay: 1.0)
        let cfg = try NorbixConfig(
            projectId: "p1",
            auth: .apiKey("k"),
            baseUrl: "https://api.norbix.ai",
            version: "v2",
            retryPolicy: policy
        )
        let client = NorbixApiClient(config: cfg, executor: mock, logger: NoopLogger())

        _ = try await client.echo.echo([:])
        XCTAssertEqual(mock.capturedRequests.count, 2)
    }

    func testDoesNotRetry4xxClientErrors() async throws {
        let mock = MockHTTPExecutor()
        mock.responseStatus = 400
        mock.responseBody = Data(#"{"message":"bad request","errorCode":"VALIDATION"}"#.utf8)
        let policy = RetryPolicy(maxRetries: 3, baseDelay: 0.001, maxDelay: 0.01)
        let cfg = try NorbixConfig(
            projectId: "p1",
            auth: .apiKey("k"),
            baseUrl: "https://api.norbix.ai",
            version: "v2",
            retryPolicy: policy
        )
        let client = NorbixApiClient(config: cfg, executor: mock, logger: NoopLogger())

        do {
            _ = try await client.echo.echo([:])
            XCTFail("expected failure")
        } catch let error as NorbixError {
            XCTAssertEqual(error.status, 400)
        }
        XCTAssertEqual(mock.capturedRequests.count, 1)
    }

    func testIdempotencyKeyIsAddedOnPost() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"id":"new"}"#.utf8)
        let client = try NorbixApiClient(
            projectId: "p1", apiKey: "k", executor: mock
        )

        _ = try await client.database.insertOne([
            "collectionName": "orders",
            "doc": ["total": 10]
        ])

        let key = mock.lastRequest?.value(forHTTPHeaderField: "Idempotency-Key")
        XCTAssertNotNil(key)
        XCTAssertFalse(key?.isEmpty ?? true)
    }

    func testIdempotencyKeyNotAddedOnGet() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"items":[]}"#.utf8)
        let client = try NorbixApiClient(
            projectId: "p1", apiKey: "k", executor: mock
        )

        _ = try await client.database.find(["collectionName": "orders"])

        let key = mock.lastRequest?.value(forHTTPHeaderField: "Idempotency-Key")
        XCTAssertNil(key)
    }
}
