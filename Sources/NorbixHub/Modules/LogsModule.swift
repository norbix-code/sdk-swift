import Foundation
import NorbixCore

/// Project logs: read and clean the log entries, the log settings, and the
/// logging integrations.
///
/// Nothing is delivered to a logging integration until its last
/// `testLoggingIntegration` passed — after saving or changing one, test it.
///
/// Request and response shapes: `GetLogs`, `GetLog`, `CleanLogs`,
/// `GetLogSettings`, `SaveLogSettings`, `*LoggingIntegrationRequest` & co. in
/// the Norbix API reference.
public final class LogsModule: Sendable {
    let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

    public func disableLogging(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/logs/disable",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func enableLogging(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/logs/enable",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deleteLoggingIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/logs/integrations/{Id}",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func disableLoggingIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/logs/integrations/{Id}/disable",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func enableLoggingIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/logs/integrations/{Id}/enable",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getLoggingIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/logs/integrations/{id}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getLoggingIntegrations(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/logs/integrations",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func saveLoggingIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/logs/integrations",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// `POST /{version}/logs/integrations/test`
    ///
    /// Tests a logging integration. Send `integrationId`. Only an integration
    /// whose last test passed receives log entries.
    public func testLoggingIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/logs/integrations/test",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// `GET /{version}/logs`
    ///
    /// Lists the project's log entries, newest first, cursor-paged. Filters
    /// (all optional): `level` (Information, Warning, Error), `module`,
    /// `logCorrelationId`, `eventCode`, `search`, `metaKey` + `metaValue`,
    /// `fromUtc`, `toUtc`; paging: `pageSize`, `startingAfter`, `endingBefore`.
    /// Answers `{ list }` — a page of `TenantLogEntryDto`.
    public func getLogs(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/logs",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// `GET /{version}/logs/{Id}`
    ///
    /// Reads one log entry. Send `id` (24 hex characters, from a `getLogs`
    /// row). Answers `{ item }` — a `TenantLogEntryDto`.
    public func getLog(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/logs/{Id}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// `GET /{version}/logs/audit`
    ///
    /// The full request trail of one correlation id, oldest first. Send
    /// `targetCorrelationId`. Answers `{ items }`.
    public func getLogsByCorrelationId(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/logs/audit",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// `POST /{version}/logs/clean`
    ///
    /// Permanently deletes every log entry stored in the project's Norbix
    /// Logging integration.
    public func cleanLogs(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/logs/clean",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// `GET /{version}/logs/settings`
    ///
    /// Reads the project's log settings: `skipCloudDashboardLogs`,
    /// `skipHttpBodyMeta`, `aiChatLoggingEnabled`, `hasNorbixLogging`.
    public func getLogSettings(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/logs/settings",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// `POST /{version}/logs/settings`
    ///
    /// Updates the project's log settings. Each flag is optional — not sent =
    /// unchanged: `skipCloudDashboardLogs`, `skipHttpBodyMeta`,
    /// `aiChatLoggingEnabled`.
    public func saveLogSettings(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/logs/settings",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }
}
