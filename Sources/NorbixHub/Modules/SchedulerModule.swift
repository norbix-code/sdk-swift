import Foundation
import NorbixCore

public final class SchedulerModule: Sendable {
    let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

    public func disableScheduler(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/scheduler/disable",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func enableScheduler(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/scheduler/enable",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deleteSchedulerTask(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/scheduler/tasks/{Id}",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func disableSchedulerTask(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/scheduler/tasks/{Id}/disable",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func enableSchedulerTask(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/scheduler/tasks/{Id}/enable",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getSchedulerTask(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/scheduler/tasks/{id}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getSchedulerTasks(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/scheduler/tasks",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func saveSchedulerTask(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/scheduler/tasks",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

}
