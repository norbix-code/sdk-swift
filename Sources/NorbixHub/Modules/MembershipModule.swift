import Foundation
import NorbixCore

public final class MembershipModule: Sendable {
    let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

    public func disableMembership(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/disable",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func enableMembership(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/enable",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deleteMembershipTrigger(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/triggers/{triggerId}",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func disableMembershipTrigger(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/triggers/{triggerId}/disable",
            method: "PATCH",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func enableMembershipTrigger(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/triggers/{triggerId}/enable",
            method: "PATCH",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getMembershipTrigger(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/triggers/{id}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getMembershipTriggers(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/triggers",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func saveMembershipTrigger(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/triggers",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func createRole(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/roles",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deleteRole(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/roles",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getRole(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/roles/{Id}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getRoles(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/roles",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateRolePolicies(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/roles",
            method: "PATCH",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func createPolicy(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/policies",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deletePolicy(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/policies",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getPolicy(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/policies/{Id}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getPolicies(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/policies",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updatePolicy(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/policies",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deleteMembershipIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/integrations/{Id}",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func disableMembershipIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/integrations/{Id}/disable",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func enableMembershipIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/integrations/{Id}/enable",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getMembershipIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/integrations/{id}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getMembershipIntegrations(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/integrations",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func saveMembershipIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/integrations",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func setMembershipIntegrationAsDefault(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/integrations/{Id}/default",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

}
