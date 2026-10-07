# HUB · Database

| Method | Verb | Path | Scope |
| --- | --- | --- | --- |
| `disableDatabase` | `PUT` | `/{version}/database/disable` | `project` |
| `enableDatabase` | `PUT` | `/{version}/database/enable` | `project` |
| `deleteSchemaTrigger` | `DELETE` | `/{version}/database/schemas/triggers/{triggerId}` | `project` |
| `disableSchemaTrigger` | `PATCH` | `/{version}/database/schemas/triggers/{triggerId}/disable` | `project` |
| `enableSchemaTrigger` | `PATCH` | `/{version}/database/schemas/triggers/{triggerId}/enable` | `project` |
| `getSchemaTrigger` | `GET` | `/{version}/database/schemas/triggers/{id}` | `project` |
| `getSchemaTriggers` | `GET` | `/{version}/database/schemas/triggers` | `project` |
| `saveSchemaTrigger` | `POST` | `/{version}/database/schemas/triggers` | `project` |
| `deleteDatabaseTaxonomy` | `DELETE` | `/{version}/database/taxonomies/{Id}` | `project` |
| `getDatabaseTaxonomy` | `GET` | `/{version}/database/taxonomies/{id}` | `project` |
| `getDatabaseTaxonomies` | `GET` | `/{version}/database/taxonomies` | `project` |
| `saveDatabaseTaxonomy` | `POST` | `/{version}/database/taxonomies` | `project` |
| `deleteDatabaseTaxonomyTerm` | `DELETE` | `/{version}/database/taxonomies/{TaxonomyId}/terms/{Id}` | `project` |
| `deleteManyDatabaseTaxonomyTerms` | `DELETE` | `/{version}/database/taxonomies/{TaxonomyId}/terms/many` | `project` |
| `getDatabaseTaxonomyTerm` | `GET` | `/{version}/database/taxonomies/{TaxonomyId}/terms/{Id}` | `project` |
| `saveDatabaseTaxonomyTerm` | `POST` | `/{version}/database/taxonomies/{TaxonomyId}/terms` | `project` |
| `updateDatabaseTaxonomyTerm` | `PUT` | `/{version}/database/taxonomies/{TaxonomyId}/terms/{Id}` | `project` |
| `deleteDatabaseSchema` | `DELETE` | `/{version}/database/schemas/{Id}` | `project` |
| `discardDatabaseSchemaDraft` | `DELETE` | `/{version}/database/schemas/{Id}/draft` | `project` |
| `getDatabaseSchema` | `GET` | `/{version}/database/schemas/{id}` | `project` |
| `getDatabaseSchemas` | `GET` | `/{version}/database/schemas` | `project` |
| `getDatabaseSchemaDraft` | `GET` | `/{version}/database/schemas/{Id}/draft` | `project` |
| `getDatabaseSchemaVersionDiff` | `GET` | `/{version}/database/schemas/{Id}/versions/diff` | `project` |
| `getDatabaseSchemaVersions` | `GET` | `/{version}/database/schemas/{Id}/versions` | `project` |
| `publishDatabaseSchema` | `POST` | `/{version}/database/schemas/{Id}/publish` | `project` |
| `renameDatabaseSchema` | `PUT` | `/{version}/database/schemas/{Id}/rename` | `project` |
| `saveDatabaseSchema` | `POST` | `/{version}/database/schemas` | `project` |
| `updateDatabaseSchemaDraft` | `PUT` | `/{version}/database/schemas/{Id}/draft` | `project` |
| `updateDatabaseSchemaSettings` | `PUT` | `/{version}/database/schemas/{Id}/settings` | `project` |
| `deleteDatabaseIntegration` | `DELETE` | `/{version}/database/integrations/{Id}` | `project` |
| `disableDatabaseIntegration` | `PUT` | `/{version}/database/integrations/{Id}/disable` | `project` |
| `enableDatabaseIntegration` | `PUT` | `/{version}/database/integrations/{Id}/enable` | `project` |
| `getDatabaseIntegration` | `GET` | `/{version}/database/integrations/{id}` | `project` |
| `getDatabaseIntegrations` | `GET` | `/{version}/database/integrations` | `project` |
| `saveDatabaseIntegration` | `POST` | `/{version}/database/integrations` | `project` |
| `setDatabaseIntegrationAsDefault` | `PUT` | `/{version}/database/integrations/{Id}/default` | `project` |
| `deleteDatabaseAggregate` | `DELETE` | `/{version}/database/aggregates/{Id}` | `project` |
| `getDatabaseAggregate` | `GET` | `/{version}/database/aggregates/{Id}` | `project` |
| `getDatabaseAggregates` | `GET` | `/{version}/database/aggregates` | `project` |
| `saveDatabaseAggregate` | `POST` | `/{version}/database/aggregates` | `project` |
| `testDatabaseAggregate` | `POST` | `/{version}/database/aggregates/test` | `project` |
| `findRecords` | `GET` | `/{version}/database/collections/{collectionName}` | `project` |
| `findOneRecord` | `GET` | `/{version}/database/collections/{collectionName}/{id}` | `project` |
| `insertRecord` | `POST` | `/{version}/database/collections/{collectionName}` | `project` |
| `insertManyRecords` | `POST` | `/{version}/database/collections/{collectionName}/many` | `project` |
| `updateOneRecord` | `PUT` | `/{version}/database/collections/{collectionName}/{id}` | `project` |
| `updateManyRecords` | `PUT` | `/{version}/database/collections/{collectionName}/many` | `project` |
| `replaceRecord` | `PUT` | `/{version}/database/collections/{collectionName}/{id}/replace` | `project` |
| `deleteRecord` | `DELETE` | `/{version}/database/collections/{collectionName}/{id}` | `project` |
| `deleteManyRecords` | `DELETE` | `/{version}/database/collections/{collectionName}/many` | `project` |
| `countRecords` | `GET` | `/{version}/database/collections/{collectionName}/count` | `project` |
| `distinctRecordValues` | `GET` | `/{version}/database/collections/{collectionName}/distinct` | `project` |
| `aggregateRecords` | `POST` | `/{version}/database/collections/{collectionName}/aggregate` | `project` |
| `executeRecordsAggregate` | `POST` | `/{version}/database/collections/{collectionName}/aggregates/{aggregateId}/execute` | `project` |
| `changeRecordResponsibility` | `PUT` | `/{version}/database/collections/{collectionName}/{id}/responsibility` | `project` |
| `getCollectionIndexes` | `GET` | `/{version}/database/collections/{collectionName}/indexes` | `project` |
| `seedCollectionRecords` | `POST` | `/{version}/database/collections/seed` | `project` |
| `applyDatabaseSchemaBundle` | `POST` | `/{version}/database/schemas/apply-bundle` | `project` |
| `updateDatabaseSchemaEmbed` | `PUT` | `/{version}/database/schemas/{Id}/embed` | `project` |
| `getDatabaseSchemaListSettings` | `GET` | `/{version}/database/schemas/{Id}/list-settings` | `project` |
| `updateDatabaseSchemaListSettings` | `PUT` | `/{version}/database/schemas/{Id}/list-settings` | `project` |
| `getDatabaseTaxonomyTree` | `GET` | `/{version}/database/taxonomies/tree` | `project` |
| `getDatabaseTaxonomyTermTree` | `GET` | `/{version}/database/taxonomies/{TaxonomyName}/terms/tree` | `project` |
| `getDatabaseMergedTermTree` | `GET` | `/{version}/database/taxonomies/{TaxonomyName}/merged-tree` | `project` |
| `getAllowedFlexTiers` | `GET` | `/{version}/database/integrations/flex-tiers` | `project` |
| `testDatabaseIntegration` | `POST` | `/{version}/database/integrations/test` | `project` |
| `revealManagedFlexConnectionString` | `GET` | `/{version}/database/integrations/{Id}/connection-string` | `project` |

## Deleting a schema

`deleteDatabaseSchema` deletes the schema **and its records**: the schema's
MongoDB collection, with its indexes, is dropped in the request environment
(in every active database integration of that environment). For a schema
with AI embed on, its records are also removed from the AI knowledge. The
delete is still refused while a saved aggregate or a schema trigger uses the
schema, and then nothing is dropped. The request and the response did not
change, and a retry is safe. Rules and error codes:
[Database — rules the gateway checks](../database-rules.md#schemas).

```swift
_ = try await client.database.deleteDatabaseSchema(["Id": "sch_1"])
```

## Working with records (Hub)

The Hub record methods are the dashboard / server-side twin of the Api
`find` / `insertOne` / … calls. Path parameters (`collectionName`, `id`,
`aggregateId`) go in the same dictionary as the other fields; the SDK puts
them in the URL and sends the rest as the query string (GET / DELETE) or the
JSON body (POST / PUT).

```swift
let page = try await client.database.findRecords([
    "collectionName": "orders",
    "filter": #"{ "status": "paid" }"#,
    "sortBy": "createdOn",
    "sortOrder": -1
])

_ = try await client.database.updateOneRecord([
    "collectionName": "orders",
    "id": "rec_1",
    "update": #"{ "status": "shipped" }"#
])
```

The update body holds the plain fields to set. `$` operators (`$set`,
`$inc`, …) are refused with `CM-ERRORS-DATABASE-035`. An empty filter on
`updateManyRecords` / `deleteManyRecords` is refused with
`CM-ERRORS-DATABASE-037` unless you send `"allRecords": true`. All the rules
and their error codes: [Database — rules the gateway checks](../database-rules.md).

- `findRecords` / `findOneRecord` take `"expandReferences": true` and answer
  every reference as `{ id, display }` (`ExpandedReference.from(_:)` in
  `NorbixCore` reads a pair); a linked source the caller may not read →
  `CM-ERRORS-DATABASE-056`. Full story in
  [API · Database → Linked records](../api/database.md#linked-records--expandreferences).
- `updateOneRecord` / `updateManyRecords` take dotted paths in `update`
  (`{"address.city":"Vilnius"}`, `{"lines.$[line].qty":3}`) and `arrayFilters`
  (`[{"line.sku":"A-1"}]`); a bad pairing → `CM-ERRORS-DATABASE-014`.
- Record validation refusals are one code per keyword: `CM-ERRORS-DATABASE-039`
  … `049` (context `Keyword`, `FieldName` = full path), `050` … `054` for a
  reference whose target does not exist (`MissingId`), `055` for a target that
  cannot be read. Full table in
  [Database — rules the gateway checks](../database-rules.md).

Every record method also accepts an optional `databaseIntegrationId` to
target a non-default database.

`revealManagedFlexConnectionString` returns a secret (a database password
inside the connection string). Do not log it or show it to end users.
