import Foundation
import NorbixCore

public final class DatabaseModule: Sendable {
    let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

    public func disableDatabase(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/disable",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func enableDatabase(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/enable",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deleteSchemaTrigger(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/schemas/triggers/{triggerId}",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func disableSchemaTrigger(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/schemas/triggers/{triggerId}/disable",
            method: "PATCH",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func enableSchemaTrigger(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/schemas/triggers/{triggerId}/enable",
            method: "PATCH",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getSchemaTrigger(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/schemas/triggers/{id}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getSchemaTriggers(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/schemas/triggers",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func saveSchemaTrigger(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/schemas/triggers",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deleteDatabaseTaxonomy(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/taxonomies/{Id}",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getDatabaseTaxonomy(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/taxonomies/{id}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getDatabaseTaxonomies(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/taxonomies",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func saveDatabaseTaxonomy(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/taxonomies",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deleteDatabaseTaxonomyTerm(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/taxonomies/{TaxonomyId}/terms/{Id}",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deleteManyDatabaseTaxonomyTerms(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/taxonomies/{TaxonomyId}/terms/many",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getDatabaseTaxonomyTerm(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/taxonomies/{TaxonomyId}/terms/{Id}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func saveDatabaseTaxonomyTerm(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/taxonomies/{TaxonomyId}/terms",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateDatabaseTaxonomyTerm(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/taxonomies/{TaxonomyId}/terms/{Id}",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deleteDatabaseSchema(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/schemas/{Id}",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func discardDatabaseSchemaDraft(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/schemas/{Id}/draft",
            method: "DELETE",
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

    public func getDatabaseSchemaDraft(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/schemas/{Id}/draft",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getDatabaseSchemaVersionDiff(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/schemas/{Id}/versions/diff",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getDatabaseSchemaVersions(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/schemas/{Id}/versions",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func publishDatabaseSchema(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/schemas/{Id}/publish",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func renameDatabaseSchema(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/schemas/{Id}/rename",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func saveDatabaseSchema(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/schemas",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateDatabaseSchemaDraft(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/schemas/{Id}/draft",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func updateDatabaseSchemaSettings(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/schemas/{Id}/settings",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deleteDatabaseIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/integrations/{Id}",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func disableDatabaseIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/integrations/{Id}/disable",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func enableDatabaseIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/integrations/{Id}/enable",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getDatabaseIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/integrations/{id}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getDatabaseIntegrations(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/integrations",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func saveDatabaseIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/integrations",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func setDatabaseIntegrationAsDefault(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/integrations/{Id}/default",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func deleteDatabaseAggregate(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/aggregates/{Id}",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getDatabaseAggregate(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/aggregates/{Id}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func getDatabaseAggregates(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/aggregates",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func saveDatabaseAggregate(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/aggregates",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    public func testDatabaseAggregate(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/aggregates/test",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    // MARK: - Collections / Records

    /// Finds records in a collection (paginated). Pass `collectionName` and optional `filter`, `sortBy`, `sortOrder`, `pagingArgs`.
    ///
    /// `GET /{version}/database/collections/{collectionName}` · request DTO `FindRecords`.
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
    public func findRecords(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Finds one record by `id` in `collectionName`.
    ///
    /// `GET /{version}/database/collections/{collectionName}/{id}` · request DTO `FindOneRecord`.
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
    public func findOneRecord(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}/{id}",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Inserts one record (`document`) into `collectionName`.
    ///
    /// `POST /{version}/database/collections/{collectionName}` · request DTO `InsertRecord`.
    public func insertRecord(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Inserts several records (`documents`) into `collectionName`.
    ///
    /// `POST /{version}/database/collections/{collectionName}/many` · request DTO `InsertManyRecords`.
    public func insertManyRecords(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}/many",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Updates one record by `id` with an `update` document.
    ///
    /// `PUT /{version}/database/collections/{collectionName}/{id}` · request DTO `UpdateOneRecord`.
    ///
    /// The `update` body is applied with `$set`. Its keys may be dotted paths
    /// into nested data: `{"address.city": "Vilnius"}`, `{"lines.2.qty": 3}`
    /// (an element by index), `{"lines.$[].qty": 1}` (every element) or
    /// `{"lines.$[line].qty": 3}` together with `"arrayFilters"` — a JSON
    /// array of one filter document per `$[name]` identifier, e.g.
    /// `[{"line.sku": "A-1"}]`. A malformed or unpaired `arrayFilters`, or
    /// two keys that overlap (`address` and `address.city`), is refused with
    /// `CM-ERRORS-DATABASE-014` and a reason in the error context.
    public func updateOneRecord(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}/{id}",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Updates every record matching `filter` with an `update` document.
    ///
    /// `PUT /{version}/database/collections/{collectionName}/many` · request DTO `UpdateManyRecords`.
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
    public func updateManyRecords(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}/many",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Replaces one record by `id` with a whole new `document`.
    ///
    /// `PUT /{version}/database/collections/{collectionName}/{id}/replace` · request DTO `ReplaceRecord`.
    public func replaceRecord(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}/{id}/replace",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Deletes one record by `id`.
    ///
    /// `DELETE /{version}/database/collections/{collectionName}/{id}` · request DTO `DeleteRecord`.
    public func deleteRecord(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}/{id}",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Deletes every record matching `filter`.
    ///
    /// `DELETE /{version}/database/collections/{collectionName}/many` · request DTO `DeleteManyRecords`.
    /// Deletes every record that matches `filter`. An empty filter (`{}`)
    /// matches the whole collection and is refused with
    /// `CM-ERRORS-DATABASE-037` unless the request has `"allRecords": true`.
    /// A caller with only own-record rights deletes only the records it owns.
    /// See `docs/database-rules.md`.
    public func deleteManyRecords(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}/many",
            method: "DELETE",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Counts the records matching `filter`.
    ///
    /// `GET /{version}/database/collections/{collectionName}/count` · request DTO `CountRecords`.
    public func countRecords(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}/count",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Returns the distinct values of `field` among the records matching `filter`.
    ///
    /// `GET /{version}/database/collections/{collectionName}/distinct` · request DTO `DistinctRecordValues`.
    public func distinctRecordValues(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}/distinct",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Runs an ad-hoc aggregation `pipeline` on `collectionName`.
    ///
    /// `POST /{version}/database/collections/{collectionName}/aggregate` · request DTO `AggregateRecords`.
    public func aggregateRecords(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}/aggregate",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Runs a saved aggregate (`aggregateId`) on `collectionName`.
    ///
    /// `POST /{version}/database/collections/{collectionName}/aggregates/{aggregateId}/execute` · request DTO `ExecuteRecordsAggregate`.
    public func executeRecordsAggregate(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}/aggregates/{aggregateId}/execute",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Moves a record (`id`) to another responsible user (`newResponsibleUserId`).
    ///
    /// `PUT /{version}/database/collections/{collectionName}/{id}/responsibility` · request DTO `ChangeRecordResponsibility`.
    public func changeRecordResponsibility(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}/{id}/responsibility",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Lists the indexes of `collectionName`.
    ///
    /// `GET /{version}/database/collections/{collectionName}/indexes` · request DTO `GetCollectionIndexes`.
    public func getCollectionIndexes(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}/indexes",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Seeds collections (`collections`) with sample records.
    ///
    /// `POST /{version}/database/collections/seed` · request DTO `SeedCollectionRecords`.
    public func seedCollectionRecords(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/collections/seed",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    // MARK: - Schemas

    /// Applies a schema bundle (`bundleJson`) in one call.
    ///
    /// `POST /{version}/database/schemas/apply-bundle` · request DTO `ApplyDatabaseSchemaBundleRequest`.
    public func applyDatabaseSchemaBundle(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/schemas/apply-bundle",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Updates the embed settings of schema `Id`.
    ///
    /// `PUT /{version}/database/schemas/{Id}/embed` · request DTO `UpdateDatabaseSchemaEmbedRequest`.
    public func updateDatabaseSchemaEmbed(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/schemas/{Id}/embed",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Reads the last schema-index run of schema `Id` — which indexes Norbix wanted, created, dropped
    /// or could not create, per database (state building | ready | refused | partial).
    ///
    /// `GET /{version}/database/schemas/{Id}/index-status` · request DTO `GetDatabaseSchemaIndexStatus`.
    public func getDatabaseSchemaIndexStatus(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/schemas/{Id}/index-status",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Reads the list (table view) settings of schema `Id`.
    ///
    /// `GET /{version}/database/schemas/{Id}/list-settings` · request DTO `GetDatabaseSchemaListSettings`.
    public func getDatabaseSchemaListSettings(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/schemas/{Id}/list-settings",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Updates the list (table view) settings of schema `Id`.
    ///
    /// `PUT /{version}/database/schemas/{Id}/list-settings` · request DTO `UpdateDatabaseSchemaListSettingsRequest`.
    public func updateDatabaseSchemaListSettings(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/schemas/{Id}/list-settings",
            method: "PUT",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    // MARK: - Taxonomies

    /// Returns the taxonomy structure as a tree (optionally `includeTerms`).
    ///
    /// `GET /{version}/database/taxonomies/tree` · request DTO `GetDatabaseTaxonomyTreeRequest`.
    public func getDatabaseTaxonomyTree(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/taxonomies/tree",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Returns the terms of `TaxonomyName` as a nested tree.
    ///
    /// `GET /{version}/database/taxonomies/{TaxonomyName}/terms/tree` · request DTO `GetDatabaseTaxonomyTermTreeRequest`.
    public func getDatabaseTaxonomyTermTree(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/taxonomies/{TaxonomyName}/terms/tree",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Returns the merged term tree of `TaxonomyName`.
    ///
    /// `GET /{version}/database/taxonomies/{TaxonomyName}/merged-tree` · request DTO `GetDatabaseMergedTermTreeRequest`.
    public func getDatabaseMergedTermTree(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/taxonomies/{TaxonomyName}/merged-tree",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    // MARK: - Integrations

    /// Lists the managed Flex database tiers this project may use.
    ///
    /// `GET /{version}/database/integrations/flex-tiers` · request DTO `GetAllowedFlexTiers`.
    public func getAllowedFlexTiers(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/integrations/flex-tiers",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Tests a database connection before it is saved.
    ///
    /// `POST /{version}/database/integrations/test` · request DTO `TestDatabaseIntegration`.
    public func testDatabaseIntegration(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/integrations/test",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Reveals the connection string of managed Flex integration `Id`. The answer is a secret: do not log it.
    ///
    /// `GET /{version}/database/integrations/{Id}/connection-string` · request DTO `RevealManagedFlexConnectionString`.
    public func revealManagedFlexConnectionString(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/database/integrations/{Id}/connection-string",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

}
