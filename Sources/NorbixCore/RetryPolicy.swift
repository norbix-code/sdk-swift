import Foundation

/// Controls how the SDK retries transient failures.
///
/// The default `.standard` policy retries on `429 Too Many Requests` and
/// `5xx` server errors with exponential backoff and a small random jitter,
/// up to 3 retries. POSTs without an explicit `Idempotency-Key` header get
/// one auto-injected so a retry can't cause a duplicate write.
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
    /// HTTP methods considered safe to retry. Defaults to all methods because
    /// the SDK auto-attaches an `Idempotency-Key` to POST/PUT/PATCH/DELETE
    /// requests when the policy is active and the caller has not supplied
    /// their own.
    public var retryableMethods: Set<String>

    public init(
        maxRetries: Int,
        baseDelay: TimeInterval,
        maxDelay: TimeInterval,
        retryableStatusCodes: Set<Int> = Set(500..<600).union([429]),
        retryableMethods: Set<String> = ["GET", "HEAD", "OPTIONS", "POST", "PUT", "PATCH", "DELETE"]
    ) {
        self.maxRetries = maxRetries
        self.baseDelay = baseDelay
        self.maxDelay = maxDelay
        self.retryableStatusCodes = retryableStatusCodes
        self.retryableMethods = retryableMethods
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

    public func isRetryable(status: Int, method: String) -> Bool {
        retryableStatusCodes.contains(status) &&
        retryableMethods.contains(method.uppercased())
    }
}
