import Foundation

/// Controls how the SDK retries transient failures.
///
/// The default `.standard` policy retries on `429 Too Many Requests` and
/// `5xx` server errors (a `502` included: the tenant's provider failed) with
/// exponential backoff and a small random jitter, up to 3 retries.
///
/// Which requests are retried by default:
/// - `GET`, `HEAD`, `OPTIONS`, `PUT`, `DELETE` — always (idempotent methods).
/// - `POST`, `PATCH` — only when the **caller** set an `Idempotency-Key`
///   header (per call or in `NorbixConfig.defaultHeaders`). The gateway
///   de-duplicates such a request only for endpoints marked idempotent, so
///   the key the SDK attaches on its own is not enough to make a resend safe:
///   a `500` on a write is a real server failure and the write may already
///   have happened.
///
/// To always retry a method, add it to `retryableMethods`.
public struct RetryPolicy: Sendable {
    /// Maximum number of *retries* (i.e. attempts after the first one).
    /// `0` means no retries.
    public var maxRetries: Int
    /// Initial backoff delay, in seconds. Doubles each attempt up to
    /// `maxDelay`.
    public var baseDelay: TimeInterval
    /// Upper bound on a single retry delay.
    public var maxDelay: TimeInterval
    /// HTTP status codes considered retryable. Defaults to `429` plus `5xx`.
    public var retryableStatusCodes: Set<Int>
    /// HTTP methods always retried on a retryable status or a network error.
    /// Defaults to the idempotent methods: `GET`, `HEAD`, `OPTIONS`, `PUT`,
    /// `DELETE`.
    public var retryableMethods: Set<String>
    /// HTTP methods retried only when the caller supplied an
    /// `Idempotency-Key` header itself. Defaults to `POST` and `PATCH`. The
    /// key the SDK attaches automatically does not count.
    public var idempotencyKeyMethods: Set<String>

    public init(
        maxRetries: Int,
        baseDelay: TimeInterval,
        maxDelay: TimeInterval,
        retryableStatusCodes: Set<Int> = Set(500..<600).union([429]),
        retryableMethods: Set<String> = ["GET", "HEAD", "OPTIONS", "PUT", "DELETE"],
        idempotencyKeyMethods: Set<String> = ["POST", "PATCH"]
    ) {
        self.maxRetries = maxRetries
        self.baseDelay = baseDelay
        self.maxDelay = maxDelay
        self.retryableStatusCodes = retryableStatusCodes
        self.retryableMethods = retryableMethods
        self.idempotencyKeyMethods = idempotencyKeyMethods
    }

    /// No retries at all. Useful in tests.
    public static let none = RetryPolicy(maxRetries: 0, baseDelay: 0, maxDelay: 0)

    /// Sensible default: 3 retries, exponential backoff starting at 250 ms,
    /// capped at 5 s.
    public static let standard = RetryPolicy(
        maxRetries: 3,
        baseDelay: 0.25,
        maxDelay: 5.0
    )

    /// Computes the delay for a given retry attempt, applying jitter.
    /// `attempt` is 1-based — first retry is `attempt == 1`.
    public func delay(forAttempt attempt: Int, retryAfter: TimeInterval? = nil) -> TimeInterval {
        if let retryAfter, retryAfter > 0 {
            return min(retryAfter, maxDelay)
        }
        let exponential = baseDelay * pow(2.0, Double(attempt - 1))
        let capped = min(exponential, maxDelay)
        // Full jitter — pick a value in [0, capped]. AWS architecture guidance.
        return Double.random(in: 0...capped)
    }

    /// Whether a response with `status` may be retried for `method`, when the
    /// caller did not supply an `Idempotency-Key`.
    public func isRetryable(status: Int, method: String) -> Bool {
        isRetryable(status: status, method: method, callerSuppliedIdempotencyKey: false)
    }

    /// Whether a response with `status` may be retried for `method`.
    /// `callerSuppliedIdempotencyKey` is true only when the caller set the
    /// `Idempotency-Key` header (the SDK never adds one itself).
    public func isRetryable(status: Int, method: String, callerSuppliedIdempotencyKey: Bool) -> Bool {
        retryableStatusCodes.contains(status) &&
        allowsRetry(method: method, callerSuppliedIdempotencyKey: callerSuppliedIdempotencyKey)
    }

    /// Whether `method` may be sent again at all (status aside) — also used
    /// after a network error.
    public func allowsRetry(method: String, callerSuppliedIdempotencyKey: Bool) -> Bool {
        let m = method.uppercased()
        if retryableMethods.contains(m) { return true }
        return callerSuppliedIdempotencyKey && idempotencyKeyMethods.contains(m)
    }
}
