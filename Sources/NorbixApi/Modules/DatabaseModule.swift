import Foundation
import NorbixCore

public final class DatabaseModule: Sendable {
    let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

    public func findTerms(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/taxonomies/{taxonomyName}/terms",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func findTermsChildren(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/taxonomies/{taxonomyName}/terms/{parentId}/children",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func findTermTree(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/taxonomies/{taxonomyName}/terms/tree",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func findTaxonomyTree(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/taxonomies/tree",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getDatabaseSchema(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/schemas/{id}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getDatabaseSchemas(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/schemas",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func aggregate(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}/aggregate",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func changeResponsibility(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}/{id}/responsibility",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func count(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}/count",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Deletes every record that matches `filter`. An empty filter (`{}`)
    /// matches the whole collection and is refused with
    /// `CM-ERRORS-DATABASE-037` unless the request has `"allRecords": true`.
    /// A caller with only own-record rights deletes only the records it owns.
    /// See `docs/database-rules.md`.
    public func deleteMany(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}/many",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deleteOne(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}/{id}",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func distinct(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}/distinct",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func executeAggregate(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}/aggregates/{aggregateId}/execute",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// `GET /{version}/database/collections/{collectionName}`
    ///
    /// Pass `"expandReferences": true` to get every reference value (a user, a
    /// role, a taxonomy term, a record of another collection, a file) as
    /// `{ id, display }` instead of the bare id — a `multiple` reference as a
    /// list of them. `display` is the target's `displayField` from the schema,
    /// `null` when the target is gone. Read a pair out of the untyped answer
    /// with `ExpandedReference.from(_:)` / `listFrom(_:)` (`NorbixCore`).
    /// The caller needs read permission on every source the schema links to,
    /// or the read is refused with `CM-ERRORS-DATABASE-056`. Without the flag
    /// the answer is exactly what it was before.
    public func find(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// `GET /{version}/database/collections/{collectionName}/{id}`
    ///
    /// Pass `"expandReferences": true` to get every reference value (a user, a
    /// role, a taxonomy term, a record of another collection, a file) as
    /// `{ id, display }` instead of the bare id — a `multiple` reference as a
    /// list of them. `display` is the target's `displayField` from the schema,
    /// `null` when the target is gone. Read a pair out of the untyped answer
    /// with `ExpandedReference.from(_:)` / `listFrom(_:)` (`NorbixCore`).
    /// The caller needs read permission on every source the schema links to,
    /// or the read is refused with `CM-ERRORS-DATABASE-056`. Without the flag
    /// the answer is exactly what it was before.
    public func findOne(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}/{id}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func insertMany(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}/many",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func insertOne(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func replaceOne(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}/{id}/replace",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Updates every record that matches `filter`. The update body holds the
    /// plain fields to set: `$` operators (`$inc`, `$set`, …) are refused with
    /// `CM-ERRORS-DATABASE-035`. An empty filter (`{}`, or no filter) matches
    /// the whole collection and is refused with `CM-ERRORS-DATABASE-037`
    /// unless the request has `"allRecords": true`. A caller with only
    /// own-record rights changes only the records it owns; soft-deleted
    /// records are skipped. See `docs/database-rules.md`.
    ///
    /// The `update` body is applied with `$set`. Its keys may be dotted paths
    /// into nested data: `{"address.city": "Vilnius"}`, `{"lines.2.qty": 3}`
    /// (an element by index), `{"lines.$[].qty": 1}` (every element) or
    /// `{"lines.$[line].qty": 3}` together with `"arrayFilters"` — a JSON
    /// array of one filter document per `$[name]` identifier, e.g.
    /// `[{"line.sku": "A-1"}]`. A malformed or unpaired `arrayFilters`, or
    /// two keys that overlap (`address` and `address.city`), is refused with
    /// `CM-ERRORS-DATABASE-014` and a reason in the error context.
    public func updateMany(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}/many",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// `PUT /{version}/database/collections/{collectionName}/{id}`
    ///
    /// The `update` body is applied with `$set`. Its keys may be dotted paths
    /// into nested data: `{"address.city": "Vilnius"}`, `{"lines.2.qty": 3}`
    /// (an element by index), `{"lines.$[].qty": 1}` (every element) or
    /// `{"lines.$[line].qty": 3}` together with `"arrayFilters"` — a JSON
    /// array of one filter document per `$[name]` identifier, e.g.
    /// `[{"line.sku": "A-1"}]`. A malformed or unpaired `arrayFilters`, or
    /// two keys that overlap (`address` and `address.city`), is refused with
    /// `CM-ERRORS-DATABASE-014` and a reason in the error context.
    public func updateOne(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}/{id}",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    // MARK: - Collections / Records

    /// Finds the records of `collectionName` that belong to the signed-in user.
    ///
    /// `GET /{version}/database/collections/{collectionName}/own` · request DTO `FindOwnRequest`.
    ///
    /// Pass `"expandReferences": true` to get every reference value (a user, a
    /// role, a taxonomy term, a record of another collection, a file) as
    /// `{ id, display }` instead of the bare id — a `multiple` reference as a
    /// list of them. `display` is the target's `displayField` from the schema,
    /// `null` when the target is gone. Read a pair out of the untyped answer
    /// with `ExpandedReference.from(_:)` / `listFrom(_:)` (`NorbixCore`).
    /// The caller needs read permission on every source the schema links to,
    /// or the read is refused with `CM-ERRORS-DATABASE-056`. Without the flag
    /// the answer is exactly what it was before.
    public func findOwn(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}/own",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    // MARK: - Taxonomies

    /// Returns the merged term tree of `taxonomyName`.
    ///
    /// `GET /{version}/database/taxonomies/{taxonomyName}/merged-tree` · request DTO `FindMergedTermTreeRequest`.
    public func findMergedTermTree(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/taxonomies/{taxonomyName}/merged-tree",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

}
