import Foundation
import NorbixCore

/// Project logs on the data plane: write your app's own log lines into the
/// project's Logs.
///
/// Request and response shapes: `WriteLogs`, `WriteLogEntry`,
/// `WriteLogsResponse` in the Norbix API reference.
public final class LogsModule: Sendable {
    let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

    /// `POST /{version}/logs`
    ///
    /// Writes 1–100 log entries. Send `entries`, an array of dictionaries:
    /// `level?` (`information` default, `warning`, `error`), `title`
    /// (1–200 characters), `message?` (at most 8 000), `eventCode?` (lower
    /// case letters, digits and `_ . : -`, at most 64; stored as
    /// `app:<code>`), `correlationId?` (at most 64 letters, digits, `_` or
    /// `-`), `timestamp?` (UTC, at most 7 days old and 5 minutes ahead),
    /// `meta?` (a string dictionary, at most 20 keys).
    ///
    /// Answers `{ accepted }`. The call returns at once: the entries are
    /// queued, not yet stored.
    ///
    /// Refusals throw `NorbixError`: 400 for a broken entry, 400
    /// `CM-ERRORS-LOGGING-002` when the Logs module is off, and 429
    /// `CM-ERRORS-LOGGING-003` when the project's per-minute quota is used up.
    /// A POST is not resent on a 429 unless you set an `Idempotency-Key`
    /// header yourself (then the retry waits the `Retry-After` the gateway
    /// sent). Otherwise wait `NorbixError.retryAfterSeconds` (the gateway's
    /// `Retry-After`) before sending again.
    public func writeLogs(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/logs",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }
}
