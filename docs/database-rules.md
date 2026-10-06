# Database — rules the gateway checks

[↑ Back to project README](../README.md) · [API · Database](./api/database.md) · [Hub · Database](./hub/database.md)

The method tables list every Database call. This page is written by hand: it
lists the rules the gateway applies to Database calls and the error code each
refusal carries. Every refusal throws a `NorbixError`; read `error.errorCode`,
and `error.errors[i].context` for the extra fields (see
[Errors](../README.md#errors)).

## Records

| What you send | What happens | Error code |
| --- | --- | --- |
| `updateMany` / `deleteMany` (API) or `updateManyRecords` / `deleteManyRecords` (Hub) with an empty filter `{}` | Refused — `{}` matches every record of the collection. Set `"allRecords": true` to mean it. For an update, a missing filter counts as `{}`. | `CM-ERRORS-DATABASE-037` |
| An update body with `$` operators (`{"$inc": {"n": 1}}`, `$set`, …) on `updateOne` / `updateMany` (API) or `updateOneRecord` / `updateManyRecords` (Hub) | Refused. Send the plain fields to set: `{"n": 2}`. | `CM-ERRORS-DATABASE-035` |
| A broken record body on `insertOne` / `insertMany` / `replaceOne` (API) or `insertRecord` / `insertManyRecords` / `replaceRecord` (Hub) | Refused as "Invalid record document". For an insert of many, `context["Index"]` says which document. Before, this was `-005` "Invalid filter document". | `CM-ERRORS-DATABASE-036` |
| `changeResponsibility` (API) or `changeRecordResponsibility` (Hub) to a user who is not a user of the project in the request env | Refused before anything is written. | `CM-ERRORS-MEMBERSHIP-USERS-012` |
| An update, replace or change of owner on a soft-deleted record | The record counts as not found; a bulk update skips it. | — |
| `findTerms` / `findTermsChildren` (API) with `$where`, `$function` or `$accumulator` in the filter | Refused. | `CM-ERRORS-DATABASE-031` |

```swift
// Archive every book on purpose: say so with allRecords.
_ = try await client.database.updateMany([
    "collectionName": "books",
    "filter": "{}",
    "update": #"{ "status": "archived" }"#,
    "allRecords": true
])
```

**Own-record rights.** A caller who may only create as itself, update its own
or delete its own records (`createAsUser` / `updateOwn` / `deleteOwn`) may now
call `insertMany`, `updateMany` and `deleteMany`. The call touches only that
caller's own records (inserted records get the caller as owner). Before, these
calls were refused with HTTP 403.

## Saved aggregates

- `getDatabaseAggregate` returns `joinedCollections`: the collections the
  pipeline joins (`$lookup`, `$graphLookup`, `$unionWith`, …). Running a
  pipeline needs read on the start collection and on every joined one.
- `testDatabaseAggregate` (Hub) needs `database:create` or `database:update`
  on `database:aggregate:{schemaId}`, plus read. A caller with read only is
  refused (HTTP 403).

## Schemas

- `renameDatabaseSchema` no longer takes `renameUniqueName`. A rename to a
  name another schema in the same env already uses is always refused
  (`CM-ERRORS-SCHEMA-002`).
- Deleting a schema is also refused when a saved aggregate joins it.
  `CM-ERRORS-SCHEMA-018` lists the blocking aggregates in
  `context["BlockerAggregateIds"]` and `context["BlockerAggregateNames"]`.
- `deleteDatabaseSchema` also **drops the schema's records**: its MongoDB
  collection, with its indexes, in the request environment (in every active
  database integration of that environment). For a schema with AI embed on,
  its records are also removed from the AI knowledge. Nothing is dropped when
  the delete is refused (a saved aggregate or a schema trigger still uses the
  schema). The request and the response did not change. A retry is safe.

## Schema triggers — one copy per env

The env is the client's `env` (`NorbixHubClient(…, env: "TEST")`, or
`NORBIX_ENV`), sent as the `norbix-env` header. `PROD` sends no header.

- `getSchemaTriggers` lists only the triggers of the request env. Each row
  carries `env`.
- `getSchemaTrigger` returns `env`, and `schemaId` is the owning schema's id
  (`sch_…`). Before, it held the trigger's own id by mistake.
- `enableSchemaTrigger` / `disableSchemaTrigger` / `deleteSchemaTrigger` act
  on the copy in the request env. No copy in that env answers
  `CM-ERRORS-TRIGGERS-002` (not found).
- `saveSchemaTrigger` with the id of a trigger that belongs to another schema
  answers `CM-ERRORS-TRIGGERS-002`.

```swift
let test = try NorbixHubClient(projectId: "proj_123", bearerToken: token, env: "TEST")
let testTriggers = try await test.database.getSchemaTriggers()
```

## Taxonomies and terms

- A taxonomy list row (`getDatabaseTaxonomies`) carries `dependencyRefs`:
  one `{ "id", "name" }` per entry of `dependencies`, in the same order.
  `name` is `null` when the id no longer points to a taxonomy.
  `dependencyNames` is gone.
- Term reads by taxonomy name (term tree, list, children, merged tree — Hub and
  API) ask `database:read` on `database:term:<taxonomy id>`. The merged tree asks
  it on every nested taxonomy.
- `saveDatabaseTaxonomy` with the `viewId` of an existing taxonomy is an update
  and asks `database:update` on that taxonomy. Without a `viewId` it is a create
  and asks `database:create`.
- `getDatabaseTaxonomyTree` / `findTaxonomyTree` with `includeTerms: true`
  fails when the term read fails (before, it returned the taxonomies without
  terms).

| Refusal | Error code |
| --- | --- |
| The taxonomy name is unknown (the merged tree used to answer `-003`) | `CM-ERRORS-TAXONOMIES-010` |
| The term tree has more than 5000 terms — read a sub-tree (`rootTermId`, `depth`) | `CM-ERRORS-TAXONOMIES-011` |
| A taxonomy name over 40 characters on a term read | `CM-ERRORS-TAXONOMIES-005` |

## Other env fields

- `getDatabaseIntegrations` lists only the request env's copies; each row
  carries `env`. Integration rows keep `isSystemOwned`.
- Scheduler tasks and templates carry `env`.
- A promotion result lists `integrationsToProvision`: managed database copies
  that get a new database in the target env (data and secrets are not copied).
