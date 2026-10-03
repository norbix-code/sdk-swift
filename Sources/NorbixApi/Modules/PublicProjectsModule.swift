import Foundation
import NorbixCore

/// Public project routes on the API host — no sign-in needed.
///
/// The admin portal reads them before anyone signs in. Safety is the answer's
/// shape and the project's own opt-in flags, not the caller's credentials, so
/// — like the public file link — these calls go out with no `Authorization`
/// header (`scope: .unauthenticated`) even when the client has a key.
public final class PublicProjectsModule: Sendable {
    let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

    /// `GET /{version}/public/projects/{ProjectId}/config`
    ///
    /// The project's public, non-sensitive config for the admin portal:
    /// display name, brand, social providers, passkey, and — only when the
    /// project opts in — sign-in methods and password policy.
    public func getPublicProjectConfig(projectId: String, timeout: TimeInterval? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/public/projects/{ProjectId}/config",
            method: "GET",
            request: ["ProjectId": projectId],
            scope: .unauthenticated,
            timeout: timeout
        )
    }

    /// `GET /{version}/public/projects/{ProjectId}/legal/{Kind}`
    ///
    /// One public legal document of the project. When the project does not
    /// expose it, the answer has `available = false` — it never says why.
    ///
    /// - Parameter kind: `terms` or `privacy`.
    public func getPublicProjectLegal(projectId: String, kind: String, timeout: TimeInterval? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/public/projects/{ProjectId}/legal/{Kind}",
            method: "GET",
            request: ["ProjectId": projectId, "Kind": kind],
            scope: .unauthenticated,
            timeout: timeout
        )
    }
}
