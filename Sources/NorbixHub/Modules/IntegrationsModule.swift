import Foundation
import NorbixCore

/// Helpers shared by the integrations of every module (files, email, code).
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
}
