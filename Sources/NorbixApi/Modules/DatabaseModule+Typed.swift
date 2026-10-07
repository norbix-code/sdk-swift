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
    /// Pass `expandReferences: true` to get every reference value (a user, a
    /// role, a taxonomy term, a record of another collection, a file) as
    /// `{ id, display }` instead of the bare id — declare such a field as
    /// `ExpandedReference` (a `multiple` reference as `[ExpandedReference]`)
    /// in `T`. Nested forms and arrays are expanded in place. The caller needs
    /// read permission on every source the schema links to, or the read is
    /// refused with `CM-ERRORS-DATABASE-056`. Without the flag the answer is
    /// exactly what it was before.
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
        expandReferences: Bool = false,
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil,
        as itemType: T.Type
    ) async throws -> Page<T> {
        var req = query
        req["collectionName"] = collection
        if expandReferences { req["expandReferences"] = true }
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

    /// Type-safe `find` over the records the signed-in user owns
    /// (`GET /{version}/database/collections/{collectionName}/own`). Same
    /// shape and options as `find(collection:query:expandReferences:as:)`.
    func findOwn<T: Codable & Sendable>(
        collection: String,
        query: [String: Any] = [:],
        expandReferences: Bool = false,
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil,
        as itemType: T.Type
    ) async throws -> Page<T> {
        var req = query
        req["collectionName"] = collection
        if expandReferences { req["expandReferences"] = true }
        return try await transport.send(
            path: "/{version}/database/collections/{collectionName}/own",
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
    /// Pass `expandReferences: true` to get every reference value as
    /// `{ id, display }` — declare such a field as `ExpandedReference` in `T`
    /// (see `find`). A linked source the caller may not read refuses the
    /// whole read with `CM-ERRORS-DATABASE-056`.
    ///
    /// ```swift
    /// let order: Order = try await client.database.findOne(
    ///     collection: "orders", id: "abc123", as: Order.self
    /// )
    /// ```
    func findOne<T: Decodable>(
        collection: String,
        id: String,
        expandReferences: Bool = false,
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil,
        as type: T.Type
    ) async throws -> T {
        var req: [String: Any] = ["collectionName": collection, "id": id]
        if expandReferences { req["expandReferences"] = true }
        return try await transport.send(
            path: "/{version}/database/collections/{collectionName}/{id}",
            method: "GET",
            request: req,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken,
            as: T.self
        )
    }
}
