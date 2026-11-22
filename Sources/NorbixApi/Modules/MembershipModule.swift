import Foundation
import NorbixCore

/// The answer of `verifyEmailAddress`: the login whose address is now
/// verified and when. Both are `nil` from a gateway that does not send them.
public struct EmailAddressVerifiedResponse: Codable, Sendable, Equatable {
    /// The login (auth) id whose e-mail address was verified.
    public let authId: String?
    /// When the address was verified (UTC).
    public let verifiedAtUtc: Date?

    public init(authId: String? = nil, verifiedAtUtc: Date? = nil) {
        self.authId = authId
        self.verifiedAtUtc = verifiedAtUtc
    }
}

public final class MembershipModule: Sendable {
    let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

    public func blockUser(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/auth/block",
            method: "PATCH",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func saveSystemUserWithPermissions(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/auth/register/service",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func saveGuestUser(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/auth/register/guest",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func saveUserNameUser(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/auth/register/user-name",
            method: "POST",
            request: request,
            scope: .optional,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func saveEmailUser(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/auth/register/email",
            method: "POST",
            request: request,
            scope: .optional,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func savePhoneUser(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/auth/register/phone",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func savePhoneUserNameWithPermissions(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/auth/register/phone-with-permissions",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func saveEmailUserNameWithPermissions(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/auth/register/email-with-permissions",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func saveUserNameWithPermissions(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/auth/register/user-name-with-permissions",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deleteUser(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/auth",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getUser(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/auth/{id}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getUsers(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/auth",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getUserPreferences(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/auth/{id}/preferences",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func inviteUser(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/auth/invite",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func assignRolePermissions(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/auth/assign-roles",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func unblockUser(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/auth/unblock",
            method: "PATCH",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateUser(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/auth",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateUserPreferences(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/auth/{id}/preferences",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// `POST /{version}/membership/auth/{UserId}/link-identity/start` — starts
    /// linking a social provider to the signed-in user (yourself only).
    /// Request: `userId`, `provider`, optional `mode` and `returnUrl`. Answers
    /// `authorizeUrl`; send the browser there.
    public func startLinkIdentity(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/auth/{UserId}/link-identity/start",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// `POST /{version}/membership/auth/{UserId}/link-identity` — finishes a
    /// link as the same signed-in user who started it. Request: `userId` and
    /// `code`, the one-time link code from the return page.
    public func linkIdentity(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/auth/{UserId}/link-identity",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// `POST /{version}/membership/auth/social/{Provider}/exchange` — trades the
    /// one-time code from the social sign-in return page (2 minutes, once) for
    /// the project JWT. Request: `provider` and `code`. Answers `bearerToken`,
    /// `userId`, `displayName`, `expiresAt`, `meta.credentialVersion`. Sends no
    /// credentials: the gateway judges any token it gets, even here, and
    /// refuses an old one.
    public func exchangeSocialSignInCode(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/auth/social/{Provider}/exchange",
            method: "POST",
            request: request,
            scope: .unauthenticated,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// The URL that starts a project social sign-in:
    /// `GET {api}/{version}/membership/auth/social/{provider}?projectId=…[&env=…][&mode=…][&returnUrl=…][&codeChallenge=…]`.
    ///
    /// Not a call: open it with `ASWebAuthenticationSession` (the system
    /// browser, not a `WKWebView`) and the gateway redirects to the provider.
    /// A navigation carries no headers, so the project id and a non-PROD env
    /// travel in the query. `provider`: google, apple, microsoft, github,
    /// facebook, x or okta. `mode`: the integration's OAuth mode (default: the
    /// only one, else the first by name). `returnUrl`: the page to come back to
    /// — absolute https (http only on localhost), origin in the project's
    /// allowed origins. It gets `?code=…&provider=…` (or `?error=…`); trade the
    /// code with `exchangeSocialSignInCode` within 2 minutes. `codeChallenge`:
    /// PKCE S256 from `PkcePair.create()`; the exchange then needs
    /// `"codeVerifier"`.
    public func socialSignInUrl(
        _ provider: String, mode: String? = nil, returnUrl: String? = nil, codeChallenge: String? = nil
    ) -> String {
        transport.navigationUrl(
            path: "/{version}/membership/auth/social/{provider}",
            pathParams: ["provider": provider],
            query: [("mode", mode), ("returnUrl", returnUrl), ("codeChallenge", codeChallenge)]
        )
    }

    public func changePassword(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/userauth/password/change",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func requestPasswordReset(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/userauth/password/reset/request",
            method: "POST",
            request: request,
            scope: .optional,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func confirmPasswordReset(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/userauth/password/reset/confirm",
            method: "POST",
            request: request,
            scope: .optional,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Confirm an e-mail + password user's address with the token from the
    /// verification link (Norbix adds `#token=…` to the project's
    /// verification callback URL). Public: no token is needed; one is sent
    /// when the client has it.
    ///
    /// Refusals: `CM-ERRORS-MEMBERSHIP-USERS-051` (the link is invalid,
    /// expired, already used or replaced by a newer one — offer
    /// `resendEmailAddressVerification`), `-049` (the link belongs to another
    /// environment).
    ///
    /// - Parameters:
    ///   - token: The token from the verification link.
    ///   - databaseIntegrationId: The project database to look in, when it is
    ///     not the environment's default.
    public func verifyEmailAddress(
        token: String,
        databaseIntegrationId: String? = nil,
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil
    ) async throws -> EmailAddressVerifiedResponse {
        var req: [String: Any] = ["token": token]
        if let databaseIntegrationId { req["databaseIntegrationId"] = databaseIntegrationId }
        return try await transport.send(
            path: "/{version}/membership/userauth/email-verification/confirm",
            method: "POST",
            request: req,
            scope: .optional,
            timeout: timeout,
            bearerToken: bearerToken,
            as: EmailAddressVerifiedResponse.self
        )
    }

    /// Send a new verification link to an e-mail + password user. Public: no
    /// token is needed. The gateway always answers OK — it never tells
    /// whether the address is known or already verified — so this returns
    /// nothing. A new link replaces the one sent before.
    ///
    /// Use it after a sign-in refused with
    /// `NorbixError.emailNotVerifiedErrorCode` (`isEmailNotVerified`).
    ///
    /// - Parameters:
    ///   - email: The address the user signed up with.
    ///   - databaseIntegrationId: The project database to look in, when it is
    ///     not the environment's default.
    public func resendEmailAddressVerification(
        email: String,
        databaseIntegrationId: String? = nil,
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil
    ) async throws {
        var req: [String: Any] = ["email": email]
        if let databaseIntegrationId { req["databaseIntegrationId"] = databaseIntegrationId }
        _ = try await transport.send(
            path: "/{version}/membership/userauth/email-verification/resend",
            method: "POST",
            request: req,
            scope: .optional,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func mapAuthToUser(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/users/{userId}/map-auth",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func setContactRoles(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/users/{userId}/roles",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func grantContactConsent(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/users/{contactId}/marketing-state/{channel}/consent",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func unsubscribeContact(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/users/{contactId}/marketing-state/{channel}/unsubscribe",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func setContactTagSubscription(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/membership/users/{contactId}/marketing-state/{commChannel}/{channel}/tags/{tag}",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

}
