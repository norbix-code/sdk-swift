import Foundation
import NorbixCore

// MARK: - Typed (Codable) overlay
//
// These extensions add typed sugar on top of the dictionary-based API. They
// keep the dict-based methods intact so existing code keeps working — pick the
// flavor you prefer per call site.

public extension DatabaseModule {
    /// Type-safe paginated `find` over a collection. Decodes the response into
    /// `Page<T>`.
    ///
    /// ```swift
    /// struct Order: Codable, Sendable { let id: String; let total: Decimal }
    /// let page: Page<Order> = try await client.database.find(
    ///     collection: "orders",
    ///     query: ["take": 20, "skip": 0],
    ///     as: Order.self
    /// )
    /// for order in page.items { print(order.id, order.total) }
    /// ```
    func find<T: Codable & Sendable>(
        collection: String,
        query: [String: Any] = [:],
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil,
        as itemType: T.Type
    ) async throws -> Page<T> {
        var req = query
        req["collectionName"] = collection
        return try await transport.send(
            path: "/{version}/database/collections/{collectionName}",
            method: "GET",
            request: req,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken,
            as: Page<T>.self
        )
    }

    /// Type-safe `findOne` by id.
    ///
    /// ```swift
    /// let order: Order = try await client.database.findOne(
    ///     collection: "orders", id: "abc123", as: Order.self
    /// )
    /// ```
    func findOne<T: Decodable>(
        collection: String,
        id: String,
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil,
        as type: T.Type
    ) async throws -> T {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}/{id}",
            method: "GET",
            request: ["collectionName": collection, "id": id],
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken,
            as: T.self
        )
    }
}
