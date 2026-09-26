import Foundation
import NorbixCore

// MARK: - Typed (Codable) overlay
//
// These extensions add typed sugar on top of the dictionary-based API. They
// keep the dict-based methods intact so existing code keeps working — pick the
// flavor you prefer per call site.

public extension DatabaseModule {
    /// Type-safe paginated `find` over a collection. Decodes the records
    /// (`list.items` in the answer) into `Page<T>`. Use `JSONValue` as `T`
    /// when the records have no fixed shape.
    ///
    /// Paging is by cursor: pass `pagingArgs` in the gateway's inline format,
    /// and the next page's cursor comes back in `page.startingAfter`.
    ///
    /// ```swift
    /// struct Order: Codable, Sendable { let id: String; let total: Decimal }
    /// let page: Page<Order> = try await client.database.find(
    ///     collection: "orders",
    ///     query: ["pagingArgs": "{pageSize:20}"],
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

    /// Type-safe `findOne` by id. Decodes the record (`result` in the answer)
    /// into `T`; use `JSONValue` when the record has no fixed shape.
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
        let answer: FindOneAnswer<T> = try await transport.send(
            path: "/{version}/database/collections/{collectionName}/{id}",
            method: "GET",
            request: ["collectionName": collection, "id": id],
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken,
            as: FindOneAnswer<T>.self
        )
        return answer.result
    }
}

private struct FindOneAnswer<T: Decodable>: Decodable {
    let result: T
}
