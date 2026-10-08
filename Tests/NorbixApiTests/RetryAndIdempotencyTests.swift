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

    // MARK: - Which methods are retried on a server error

    private func makeTransport(
        _ mock: MockHTTPExecutor,
        maxRetries: Int = 3,
        defaultHeaders: [String: String] = [:]
    ) throws -> Transport {
        let cfg = try NorbixConfig(
            projectId: "p1",
            auth: .apiKey("k"),
            baseUrl: "https://api.norbix.ai",
            version: "v2",
            defaultHeaders: defaultHeaders,
            retryPolicy: RetryPolicy(maxRetries: maxRetries, baseDelay: 0.001, maxDelay: 0.01)
        )
        return Transport(config: cfg, executor: mock, logger: NoopLogger())
    }

    private func expectFailure(
        status: Int,
        _ call: () async throws -> Void,
        file: StaticString = #filePath,
        line: UInt = #line
    ) async {
        do {
            try await call()
            XCTFail("expected failure", file: file, line: line)
        } catch let error as NorbixError {
            XCTAssertEqual(error.status, status, file: file, line: line)
        } catch {
            XCTFail("unexpected error \(error)", file: file, line: line)
        }
    }

    func testPostWith500IsSentOnce() async throws {
        let mock = MockHTTPExecutor()
        mock.responseStatus = 500
        mock.responseBody = Data(#"{"responseStatus":{"isSuccess":false,"errors":[{"message":"boom","errorCode":"CM-ERRORS-X"}]}}"#.utf8)
        let transport = try makeTransport(mock)

        await expectFailure(status: 500) {
            _ = try await transport.sendRaw(path: "/{version}/db/orders", method: "POST", body: Data("{}".utf8))
        }
        XCTAssertEqual(mock.capturedRequests.count, 1)
        // The SDK still attaches its own key, but that key alone does not make
        // the POST retryable.
        XCTAssertNotNil(mock.lastRequest?.value(forHTTPHeaderField: "Idempotency-Key"))
    }

    func testGetWith500IsRetriedUpToMax() async throws {
        let mock = MockHTTPExecutor()
        mock.responseStatus = 500
        mock.responseBody = Data(#"{"message":"boom"}"#.utf8)
        let transport = try makeTransport(mock, maxRetries: 3)

        await expectFailure(status: 500) {
            _ = try await transport.sendRaw(path: "/{version}/echo", method: "GET")
        }
        // 1 original + 3 retries
        XCTAssertEqual(mock.capturedRequests.count, 4)
    }

    func testPostWithCallerIdempotencyKeyAnd500IsRetried() async throws {
        let mock = MockHTTPExecutor()
        mock.responseQueue = [
            (status: 500, body: Data(#"{"message":"boom"}"#.utf8), headers: [:]),
            (status: 200, body: Data("{}".utf8), headers: [:])
        ]
        let transport = try makeTransport(mock)

        _ = try await transport.sendRaw(
            path: "/{version}/db/orders",
            method: "POST",
            body: Data("{}".utf8),
            headers: ["Idempotency-Key": "order-42"]
        )
        XCTAssertEqual(mock.capturedRequests.count, 2)
        XCTAssertEqual(
            mock.capturedRequests.map { $0.value(forHTTPHeaderField: "Idempotency-Key") },
            ["order-42", "order-42"]
        )
    }

    func testPostWithIdempotencyKeyInDefaultHeadersIsRetried() async throws {
        let mock = MockHTTPExecutor()
        mock.responseStatus = 503
        let transport = try makeTransport(mock, maxRetries: 2, defaultHeaders: ["Idempotency-Key": "k-1"])

        await expectFailure(status: 503) {
            _ = try await transport.sendRaw(path: "/{version}/db/orders", method: "POST", body: Data("{}".utf8))
        }
        XCTAssertEqual(mock.capturedRequests.count, 3)
    }

    func testPatchWith503IsSentOnce() async throws {
        let mock = MockHTTPExecutor()
        mock.responseStatus = 503
        let transport = try makeTransport(mock)

        await expectFailure(status: 503) {
            _ = try await transport.sendRaw(path: "/{version}/db/orders/1", method: "PATCH", body: Data("{}".utf8))
        }
        XCTAssertEqual(mock.capturedRequests.count, 1)
    }

    func testPutWith502IsRetried() async throws {
        let mock = MockHTTPExecutor()
        mock.responseQueue = [
            (status: 502, body: Data(#"{"message":"provider failed"}"#.utf8), headers: [:]),
            (status: 200, body: Data("{}".utf8), headers: [:])
        ]
        let transport = try makeTransport(mock)

        _ = try await transport.sendRaw(path: "/{version}/db/orders/1", method: "PUT", body: Data("{}".utf8))
        XCTAssertEqual(mock.capturedRequests.count, 2)
    }

    func testPostWith502IsSentOnce() async throws {
        let mock = MockHTTPExecutor()
        mock.responseStatus = 502
        let transport = try makeTransport(mock)

        await expectFailure(status: 502) {
            _ = try await transport.sendRaw(path: "/{version}/db/orders", method: "POST", body: Data("{}".utf8))
        }
        XCTAssertEqual(mock.capturedRequests.count, 1)
    }

    func testExplicitRetryableMethodsStillRetryPost() async throws {
        let mock = MockHTTPExecutor()
        mock.responseStatus = 500
        let cfg = try NorbixConfig(
            projectId: "p1",
            auth: .apiKey("k"),
            baseUrl: "https://api.norbix.ai",
            version: "v2",
            retryPolicy: RetryPolicy(
                maxRetries: 2, baseDelay: 0.001, maxDelay: 0.01,
                retryableMethods: ["GET", "POST"]
            )
        )
        let transport = Transport(config: cfg, executor: mock, logger: NoopLogger())

        await expectFailure(status: 500) {
            _ = try await transport.sendRaw(path: "/{version}/db/orders", method: "POST", body: Data("{}".utf8))
        }
        XCTAssertEqual(mock.capturedRequests.count, 3)
    }

    func testDefaultPolicyMethodRules() {
        let policy = RetryPolicy.standard
        XCTAssertTrue(policy.isRetryable(status: 500, method: "GET"))
        XCTAssertTrue(policy.isRetryable(status: 502, method: "delete"))
        XCTAssertTrue(policy.isRetryable(status: 429, method: "PUT"))
        XCTAssertFalse(policy.isRetryable(status: 500, method: "POST"))
        XCTAssertFalse(policy.isRetryable(status: 500, method: "PATCH"))
        XCTAssertTrue(policy.isRetryable(status: 500, method: "POST", callerSuppliedIdempotencyKey: true))
        XCTAssertTrue(policy.isRetryable(status: 503, method: "patch", callerSuppliedIdempotencyKey: true))
        XCTAssertFalse(policy.isRetryable(status: 400, method: "POST", callerSuppliedIdempotencyKey: true))
    }
}
