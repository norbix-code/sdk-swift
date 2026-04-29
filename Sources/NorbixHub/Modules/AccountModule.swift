import Foundation
import NorbixCore

public final class AccountModule: Sendable {
    let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

    public func getAccountProfile(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/profile",
            method: "GET",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateAccountProfile(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/profile",
            method: "PUT",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func resendAccountVerificationToken(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/verify/resend",
            method: "GET",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getAccountStatus(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/status",
            method: "GET",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func createStripeCheckoutSession(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/stripe/create-checkout-session",
            method: "POST",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getStripeBillingPortalUrl(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/stripe/get-portal-url",
            method: "POST",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func createTeamMemberFromInvitation(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/team/member",
            method: "POST",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func verifyAccount(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/verify",
            method: "GET",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deleteNotificationsGroup(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/notifications/settings/group",
            method: "DELETE",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deleteNotificationsTag(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/notifications/settings/tag",
            method: "DELETE",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func removeTagFromNotificationsGroup(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/notifications/settings/group/tag",
            method: "DELETE",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func saveNotificationsGroup(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/notifications/settings/group",
            method: "POST",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func saveNotificationsTag(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/notifications/settings/tag",
            method: "POST",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func createProject(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects",
            method: "POST",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deleteProject(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}",
            method: "DELETE",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getProject(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}",
            method: "GET",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getProjects(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects",
            method: "GET",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getAccountRegions(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/regions",
            method: "GET",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getProjectTokens(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/tokens",
            method: "GET",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateProjectAccentColor(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/settings/accent-color",
            method: "PATCH",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateProjectIcon(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/settings/icon",
            method: "PATCH",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateProjectLogo(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/settings/logo",
            method: "PATCH",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateProjectMainColor(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/settings/main-color",
            method: "PATCH",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateProjectAllowedOrigins(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/settings/origins",
            method: "PATCH",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateProjectDefaultLanguage(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/settings/default-language",
            method: "PATCH",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateProjectDescription(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/settings/description",
            method: "PATCH",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func disableProject(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/disable",
            method: "PATCH",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func enableProject(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/enable",
            method: "PATCH",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateProjectLanguages(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/settings/languages",
            method: "PATCH",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateProjectUrl(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/settings/url",
            method: "PATCH",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateProjectName(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/settings/name",
            method: "PATCH",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateProjectRegions(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/settings/regions",
            method: "PATCH",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func createAccount(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account",
            method: "POST",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getAccountCollaborators(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/collaborators",
            method: "GET",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func sendInviteToTeamMember(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/team/member/invite",
            method: "POST",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getLicenses(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/licenses",
            method: "GET",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func askChat(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/chat/complete",
            method: "POST",
            request: request,
            scope: .account,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

}
