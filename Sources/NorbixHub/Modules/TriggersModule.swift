import Foundation
import NorbixCore

/// Trigger endpoints that span every module. Saving a trigger stays on its own module.
public final class TriggersModule: Sendable {
    let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

    /// What an identity lacks for a `triggerType` and `action`. Nothing is saved.
    public func checkTriggerExecutionIdentity(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/triggers/execution-identity/check",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// One trigger's runs, newest first: `triggerType`, `triggerId`, optional `status`, paging.
    public func getTriggerRuns(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/triggers/runs",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// One run: `id` (trr_…) and `triggerType`, which is required.
    public func getTriggerRun(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/triggers/runs/{id}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }
}
