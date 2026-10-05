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
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateAccountProfile(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/profile",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// The signed-in team member's (or owner's) own record — not the organisation's
    /// profile (`getAccountProfile`). The answer carries `item`; `item.generalInfo.phone`
    /// is the number "Account users" SMS campaigns send to.
    public func getMyAccountUserProfile(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/me",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Saves or clears the signed-in team member's own phone number: pass `["phone": "+37060000000"]`
    /// (E.164 — `+`, the country code, then digits); an empty or missing `phone` clears it. There is
    /// no user id: the user is always the caller. Members without a phone are skipped by
    /// "Account users" SMS campaigns.
    public func updateMyAccountUserPhone(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/me/phone",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func resendAccountVerificationToken(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/verify/resend",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getAccountStatus(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/status",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func createStripeCheckoutSession(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/stripe/create-checkout-session",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getStripeBillingPortalUrl(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/stripe/get-portal-url",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Anonymous (`.unauthenticated`): accepts a team invitation with the invitation token in
    /// `request` — the invited person has no session yet. No token, no `accountId` needed.
    public func createTeamMemberFromInvitation(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/team/member",
            method: "POST",
            request: request,
            scope: .unauthenticated,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Anonymous (`.unauthenticated`): the gateway route has no `[Authenticate]` and reads the
    /// account id and the code from the request (`accountId` + `token` from the verification
    /// email link), not from a session. Pass them in `request`; they go in the query. The
    /// client needs no token and no `accountId`.
    public func verifyAccount(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/verify",
            method: "GET",
            request: request,
            scope: .unauthenticated,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deleteNotificationsGroup(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/notifications/settings/group",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deleteNotificationsTag(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/notifications/settings/tag",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func removeTagFromNotificationsGroup(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/notifications/settings/group/tag",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func saveNotificationsGroup(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/notifications/settings/group",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func saveNotificationsTag(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/notifications/settings/tag",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func createProject(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deleteProject(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getProject(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getProjects(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Anonymous (`.unauthenticated`): the gateway route has no `[Authenticate]`. No token, no
    /// `accountId` needed.
    public func getAccountRegions(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/regions",
            method: "GET",
            request: request,
            scope: .unauthenticated,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getProjectTokens(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/tokens",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateProjectAccentColor(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/settings/accent-color",
            method: "PATCH",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateProjectIcon(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/settings/icon",
            method: "PATCH",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateProjectLogo(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/settings/logo",
            method: "PATCH",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateProjectMainColor(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/settings/main-color",
            method: "PATCH",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateProjectAllowedOrigins(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/settings/origins",
            method: "PATCH",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateProjectDefaultLanguage(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/settings/default-language",
            method: "PATCH",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateProjectDescription(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/settings/description",
            method: "PATCH",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func disableProject(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/disable",
            method: "PATCH",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func enableProject(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/enable",
            method: "PATCH",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateProjectLanguages(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/settings/languages",
            method: "PATCH",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateProjectUrl(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/settings/url",
            method: "PATCH",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateProjectName(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/settings/name",
            method: "PATCH",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateProjectRegions(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/settings/regions",
            method: "PATCH",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Anonymous (`.unauthenticated`): sign-up — there is no session yet. No token, no
    /// `accountId` needed.
    public func createAccount(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account",
            method: "POST",
            request: request,
            scope: .unauthenticated,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getAccountCollaborators(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/collaborators",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func sendInviteToTeamMember(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/team/member/invite",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getLicenses(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/licenses",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getProjectAiSettings(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/ai/settings",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateProjectAiSettings(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/ai/settings",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func createProjectAiAssistant(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/ai/assistants",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateProjectAiAssistant(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/ai/assistants/{assistantId}",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deleteProjectAiAssistant(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/ai/assistants/{assistantId}",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getProjectAiUsage(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/ai/usage",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func setAdminPortalEnabled(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/admin-portal/enabled",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// `PATCH /{version}/account/projects/{projectId}/settings/admin-url`
    ///
    /// Set or clear the project's admin portal URL: `["projectId": id, "url": "https://admin.example.com"]` (`NSNull()` clears it).
    public func updateProjectAdminUrl(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/settings/admin-url",
            method: "PATCH",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// `PATCH /{version}/account/projects/{projectId}/settings/legal`
    ///
    /// Save the project's terms and privacy texts (Markdown): keys `termsMarkdown`, `privacyMarkdown`.
    public func updateProjectLegalDocuments(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/settings/legal",
            method: "PATCH",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// `PATCH /{version}/account/projects/{projectId}/settings/legal/expose`
    ///
    /// Show or hide the legal documents on the public project routes: key `exposed` (Bool).
    public func updateProjectExposeLegal(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/settings/legal/expose",
            method: "PATCH",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// `PATCH /{version}/account/projects/{projectId}/settings/brand/expose`
    ///
    /// Show or hide the project brand (logo, colours) in the Admin Portal: key `exposed` (Bool).
    public func updateProjectExposeBrand(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/settings/brand/expose",
            method: "PATCH",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// `PATCH /{version}/account/projects/{projectId}/settings/auth/expose`
    ///
    /// Show or hide the sign-in settings (auth flows) in the Admin Portal: key `exposed` (Bool).
    public func updateProjectExposeAuth(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/settings/auth/expose",
            method: "PATCH",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// `GET /{version}/account/projects/{projectId}/admin-portal/structure`
    ///
    /// The admin portal's structure for the project.
    public func getAdminPortalStructure(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/admin-portal/structure",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// `PUT /{version}/account/projects/{projectId}/settings/admin-portal/service-user`
    ///
    /// Choose the AI service user the admin portal acts as: key `serviceUserId`.
    public func assignAdminPortalServiceUser(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/{projectId}/settings/admin-portal/service-user",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// `POST /{version}/account/ai/service-users`
    ///
    /// Create an AI service user (a scoped key for MCP and AI tools): keys `name`, `scope`. The answer holds the key once — store it.
    public func createAiServiceUser(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/ai/service-users",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// `GET /{version}/account/ai/service-users`
    ///
    /// List the account's AI service users and their keys (no secrets).
    public func listAiServiceUsers(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/ai/service-users",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// `POST /{version}/account/ai/service-users/{Id}/keys`
    ///
    /// Issue a new key for service user `Id`; optional `revokeKeyId` revokes an old key in the same call.
    public func rotateAiServiceUserKey(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/ai/service-users/{Id}/keys",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// `DELETE /{version}/account/ai/service-users/{Id}/keys/{KeyId}`
    ///
    /// Revoke key `KeyId` of service user `Id`.
    public func revokeAiServiceUserKey(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/ai/service-users/{Id}/keys/{KeyId}",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// `DELETE /{version}/account/ai/service-users/{Id}`
    ///
    /// Delete service user `Id` and all its keys.
    public func deleteAiServiceUser(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/ai/service-users/{Id}",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    // MARK: - Developer MCP endpoint

    /// `POST /{version}/account/mcp`
    ///
    /// Developer MCP endpoint (Streamable HTTP, MCP revision 2025-11-25): send
    /// one JSON-RPC 2.0 `message` (`initialize`, `tools/list`, `tools/call`, ...).
    /// The `initialize` answer carries the session id in
    /// `McpResponse.sessionId`; pass it as `sessionId` on every later call.
    /// The answer is JSON (`McpResponse.json`) or, for a `tools/call`, an SSE
    /// stream (`McpResponse.text`). `toolsets` filters `tools/list`, e.g.
    /// `ai:campaigns,ai:project-context`. An AI service user key (`nbsu_...`)
    /// as the client's key narrows the tools to that user's scope.
    public func sendMcpMessage(
        _ message: [String: Any],
        sessionId: String? = nil,
        protocolVersion: String? = nil,
        toolsets: String? = nil,
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil
    ) async throws -> McpResponse {
        McpResponse(try await transport.sendRaw(
            path: "/{version}/account/mcp",
            method: "POST",
            body: try JSONSerialization.data(withJSONObject: message),
            query: toolsets.map { ["toolsets": $0] } ?? [:],
            headers: Self.mcpHeaders(sessionId: sessionId, protocolVersion: protocolVersion, lastEventId: nil),
            scope: .project,
            accept: "application/json, text/event-stream",
            timeout: timeout,
            bearerToken: bearerToken
        ))
    }

    /// `GET /{version}/account/mcp`
    ///
    /// Open the server-to-client SSE stream of the session `sessionId`;
    /// `lastEventId` resumes a dropped stream. This SDK has no SSE client: the
    /// call returns only when the server closes the stream, with the raw SSE
    /// text in `McpResponse.text`.
    public func openMcpStream(
        sessionId: String,
        lastEventId: String? = nil,
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil
    ) async throws -> McpResponse {
        McpResponse(try await transport.sendRaw(
            path: "/{version}/account/mcp",
            method: "GET",
            headers: Self.mcpHeaders(sessionId: sessionId, protocolVersion: nil, lastEventId: lastEventId),
            scope: .project,
            accept: "text/event-stream",
            timeout: timeout,
            bearerToken: bearerToken
        ))
    }

    /// `DELETE /{version}/account/mcp`
    ///
    /// End the MCP session `sessionId`.
    public func endMcpSession(
        sessionId: String,
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil
    ) async throws -> McpResponse {
        McpResponse(try await transport.sendRaw(
            path: "/{version}/account/mcp",
            method: "DELETE",
            headers: Self.mcpHeaders(sessionId: sessionId, protocolVersion: nil, lastEventId: nil),
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        ))
    }

    private static func mcpHeaders(sessionId: String?, protocolVersion: String?, lastEventId: String?) -> [String: String] {
        var out: [String: String] = [:]
        if let sessionId { out["Mcp-Session-Id"] = sessionId }
        if let protocolVersion { out["MCP-Protocol-Version"] = protocolVersion }
        if let lastEventId { out["Last-Event-ID"] = lastEventId }
        return out
    }
}
