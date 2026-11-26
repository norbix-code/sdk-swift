import Foundation
import NorbixCore

public final class AuthModule: Sendable {
    let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

    /// Raw `POST /auth`. A password sign-in takes `userName`, `password`, `provider`
    /// and `rememberMe` (`true`: a sliding 30 days, `false` or missing: a sliding 12 hours).
    /// Unlike `client.login`, this does not store the token on the client.
    public func authenticate(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/auth",
            method: "POST",
            request: request,
            scope: .unauthenticated,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

}
