import Foundation
import NorbixCore

/// Helpers shared by the integrations of every module: keyless setup and saved secrets.
public final class IntegrationsModule: Sendable {
    let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

    /// GET /{version}/integrations/keyless/setup — what a developer needs before
    /// saving a keyless cloud integration.
    ///
    /// Request: `module` (files, email or code), `cloud` (azure, aws or google),
    /// optional `integrationId` (an existing integration). The answer carries
    /// `integrationId` (save with it), `env`, `module`, `cloud`, `issuer`,
    /// `subject`, `audience`, `available` (with `unavailableReason` when false)
    /// and the cloud setup `script`. `templates`: ready CloudFormation / Bicep /
    /// Terraform files for this integration (`[[String: Any]]` with `kind`,
    /// `fileName`, `content`).
    public func getKeylessIntegrationSetup(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/integrations/keyless/setup",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// GET /{version}/integrations/{IntegrationId}/secrets — which secrets of an
    /// integration (any module) are saved and which are optional. Never a value
    /// or any part of one.
    ///
    /// The answer's `result` is `[[String: Any]]` with `key`, `field` (the save
    /// request property that fills the key), `isSet` and `isOptional`. Empty for
    /// keyless and Norbix-owned integrations and for MCP, Marketplace and Webhook
    /// integrations. `env` picks the environment (default: the client's).
    public func getIntegrationSecrets(_ integrationId: String, env: String? = nil, timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        var request: [String: Any] = ["IntegrationId": integrationId]
        if let env { request["env"] = env }
        return try await transport.send(
            path: "/{version}/integrations/{IntegrationId}/secrets",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// POST /{version}/integrations/{IntegrationId}/secrets/remove — removes optional
    /// secrets (`keys` as `getIntegrationSecrets` lists them). A key the integration
    /// needs is refused with `CM-ERRORS-SECRETS-012` (400) and nothing is written.
    /// The answer carries `id`.
    public func removeIntegrationSecrets(_ integrationId: String, keys: [String], env: String? = nil, timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        var request: [String: Any] = ["IntegrationId": integrationId, "keys": keys]
        if let env { request["env"] = env }
        return try await transport.send(
            path: "/{version}/integrations/{IntegrationId}/secrets/remove",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }
}
