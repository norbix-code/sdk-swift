import Foundation
import NorbixCore

public final class FilesModule: Sendable {
    let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

    public func disableFiles(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/files/disable",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func enableFiles(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/files/enable",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deleteFilesTrigger(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/files/triggers/{triggerId}",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func disableFilesTrigger(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/files/triggers/{triggerId}/disable",
            method: "PATCH",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func enableFilesTrigger(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/files/triggers/{triggerId}/enable",
            method: "PATCH",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getFilesTrigger(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/files/triggers/{id}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getFilesTriggers(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/files/triggers",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func saveFilesTrigger(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/files/triggers",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deleteFilesIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/files/integrations/{Id}",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func disableFilesIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/files/integrations/{Id}/disable",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func enableFilesIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/files/integrations/{Id}/enable",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getFilesIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/files/integrations/{id}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getFilesIntegrations(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/files/integrations",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func saveFilesIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/files/integrations",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func setFilesIntegrationAsDefault(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/files/integrations/{Id}/default",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

}
