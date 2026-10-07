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
| `updateOne` / `updateMany` (API) or `updateOneRecord` / `updateManyRecords` (Hub) with an `arrayFilters` that is malformed or not paired with the `$[name]` identifiers in `update`, or two update keys that overlap (`address` and `address.city`) | Refused; `context["Reason"]` says why. | `CM-ERRORS-DATABASE-014` |
| A required field missing or `null` on insert / replace — also inside a nested form | Refused; `context["FieldName"]` is the full path (`address.city`). | `CM-ERRORS-DATABASE-030` |
| A record that breaks one rule of the published schema | One code per keyword, `context["Keyword"]`, `context["FieldName"]` = the full path (`customer.address.zip`, `lines[0].qty`): `039` type (also a sort on or through a list), `040` length (`minLength` / `maxLength`, `minItems` / `maxItems`, a JSON field over `maxBytes`), `041` pattern, `042` format (email, uri, a file id), `043` range (`minimum` / `maximum`), `044` multipleOf, `045` enum, `046` uniqueItems, `047` an unknown or missing member of a nested form / currency / geolocation, `048` coordinates, `049` translateOptions. | `CM-ERRORS-DATABASE-039` … `049` |
| A reference names a target that does not exist | `050` user, `051` role (the stored value is the role **id**; a name is refused), `052` taxonomy term, `053` record of the linked collection, `054` file. `context["MissingId"]`. | `CM-ERRORS-DATABASE-050` … `054` |
| The declared target itself cannot be read (the taxonomy is not in the project, the collection has no repository, the files integration cannot be opened) | Refused; `context["Target"]`. | `CM-ERRORS-DATABASE-055` |
| `"expandReferences": true` while the caller lacks read on a linked source | Refused; `context["SourceKind"]`, `["Source"]`, `["Fields"]`, `["MissingPermissions"]`. Read again without the flag to get the ids. | `CM-ERRORS-DATABASE-056` |

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

- The data schema (`saveDatabaseSchema`, `updateDatabaseSchemaDraft`) accepts
  `object` (nested form, up to 5 levels), `array` (any item type), `json`
  (free-form object, optional `maxBytes`), a typed `default`, `unique`,
  `minItems` / `maxItems`, file `allowedFileType` / `maxSizeMb`, and a
  `displayField` on every reference (required for `collection` and `user`).
  Every `$def` is closed: an unknown key is refused with
  `CM-ERRORS-SCHEMA-010` naming the key. Form hints live only in the UI
  schema (`placeholder`, `help`, `nestedForm`, `array` widget options;
  `watermark` / `hint` / `asResponsible*` are refused with `CM-ERRORS-SCHEMA-012`).

| Refusal | Error code |
| --- | --- |
| A numeric keyword the field type cannot hold (`multipleOf` on a string, `1e300`) | `CM-ERRORS-SCHEMA-022` |
| Nesting deeper than 5 levels | `CM-ERRORS-SCHEMA-036` |
| A `default` that breaks the field's own rules | `CM-ERRORS-SCHEMA-037` |
| A nested `required` names an undeclared field | `CM-ERRORS-SCHEMA-038` |
| A collection reference's `displayField` is not a field of the target schema | `CM-ERRORS-SCHEMA-039` |
| A draft or rename would drop a field another schema shows as `displayField` (`context["Dependents"]`) | `CM-ERRORS-SCHEMA-040` |
| A delete while another schema's collection reference points at it | `CM-ERRORS-SCHEMA-041` |

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
| An explicit `slug` another term of the taxonomy already has (`context["Slug"]`, `["OtherTermId"]`) | `CM-ERRORS-TAXONOMIES-012` |
| A slug with no letter or digit left after cleaning | `CM-ERRORS-TAXONOMIES-013` |

Every term carries a `slug` (lower-case letters / digits / `-` / `_`, unique
inside the taxonomy). `saveDatabaseTaxonomyTerm` / `updateDatabaseTaxonomyTerm`
accept an optional `slug` in the document; without one it is derived from
`name` (`France` → `france`, with a `-2`, `-3` … suffix when another term
already has that derived slug). A reference with `displayField: slug` shows it
on an expanded read.

## Other env fields

- `getDatabaseIntegrations` lists only the request env's copies; each row
  carries `env`. Integration rows keep `isSystemOwned`.
- Scheduler tasks and templates carry `env`.
- A promotion result lists `integrationsToProvision`: managed database copies
  that get a new database in the target env (data and secrets are not copied).
