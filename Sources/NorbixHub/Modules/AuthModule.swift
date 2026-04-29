import Foundation
import NorbixCore

public final class AuthModule: Sendable {
    let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

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
