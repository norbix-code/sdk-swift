import Foundation
import NorbixCore

/// Project environments — list, create, and delete the named environments a
/// project owns (PROD plus any TEST/STAGING/… the user adds).
///
/// These endpoints manage the *set* of environments. To make requests *inside*
/// a given environment, set `env` on the client (`NorbixHubClient(env: "TEST")`
/// or `client.setEnv("TEST")`) or per call (the `env` argument), which sends
/// the `norbix-env` header.
public final class EnvironmentsModule: Sendable {
    let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

    /// `GET /{version}/account/projects/environments`
    ///
    /// Lists the project's environments. The response always includes "PROD".
    public func getProjectEnvironments(
        _ request: [String: Any] = [:],
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil,
        env: String? = nil
    ) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/environments",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken,
            env: env
        )
    }

    /// `POST /{version}/account/projects/environments`
    ///
    /// Creates a new environment. The `request` must contain `environmentName`
    /// (e.g. "TEST") and an `integration` (a database integration that seeds the
    /// new env and becomes its default).
    public func createProjectEnvironment(
        _ request: [String: Any] = [:],
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil,
        env: String? = nil
    ) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/environments",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken,
            env: env
        )
    }

    /// `DELETE /{version}/account/projects/environments/{environmentName}`
    ///
    /// Deletes a non-PROD environment, cascading its integrations. PROD is
    /// rejected by the backend.
    public func deleteProjectEnvironment(
        environmentName: String,
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil,
        env: String? = nil
    ) async throws -> Any? {
        try await transport.send(
            path: "/{version}/account/projects/environments/{environmentName}",
            method: "DELETE",
            request: ["environmentName": environmentName],
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken,
            env: env
        )
    }
}
