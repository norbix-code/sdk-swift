import Foundation
import NorbixCore

// MARK: - Typed (Codable) overlay

public extension MembershipModule {
    /// Typed `getUser` — decode the response into your own model.
    ///
    /// ```swift
    /// struct User: Codable, Sendable { let id: String; let email: String }
    /// let user: User = try await client.membership.getUser(id: "u_123", as: User.self)
    /// ```
    func getUser<T: Decodable>(
        id: String,
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil,
        as type: T.Type
    ) async throws -> T {
        try await transport.send(
            path: "/{version}/membership/users/{id}",
            method: "GET",
            request: ["id": id],
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken,
            as: T.self
        )
    }

    /// Typed `getUsers` — decode into a `Page<T>`.
    func getUsers<T: Codable & Sendable>(
        query: [String: Any] = [:],
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil,
        as itemType: T.Type
    ) async throws -> Page<T> {
        try await transport.send(
            path: "/{version}/membership/users",
            method: "GET",
            request: query,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken,
            as: Page<T>.self
        )
    }
}
