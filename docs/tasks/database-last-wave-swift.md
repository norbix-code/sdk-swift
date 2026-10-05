# database-last-wave-swift — Swift SDK follows the last Database wave

## Goal

The Swift SDK (`norbix-code/sdk-swift`) follows the gateway contract changes
of the last Database wave (records, taxonomies, triggers, schemas,
integrations), now on gateway `refactoringV2`.

Not in scope: other SDKs, the CLI, the portal (`cloud`), gateway code, the
Database import routes (see Findings).

## Plan

1. chore(types): regenerate `references/{hub,api}.dtos.swift` and `references/{hub2,api2}.dtos.ts` against local hosts (Hub `:64964`, Api `:64965`, gateway `origin/refactoringV2`) — done (`62fab4c`)
2. test(database): fake-transport tests for `allRecords`, schema triggers per env, `dependencyRefs`, `joinedCollections`, trigger `env` / `schemaId`, the new error codes — done (`b19a6bb`)
3. docs(database): hand-written `docs/database-rules.md`, links from README and both Database pages, `$set` example fixed, comments on the bulk-write methods — done (`6cf86f7`)
4. check: every Database method matches a route the hosts serve and the manifest (`sdks/typegen/coverage/endpoints.{hub,api}.json`) — done (Api 22/22; Hub 67 methods, 0 extra, 0 wrong verb; 6 import routes not in Swift, see Findings)
5. ship: pull request, checks, merge — doing

## Changes

| file | what changed | plan step # |
| --- | --- | --- |
| `references/api.dtos.swift` | `allRecords` on `UpdateManyRequest` / `DeleteManyRequest` | 1 |
| `references/hub.dtos.swift` | `allRecords` on the Hub bulk writes; `env` on `SchemaTriggerDto`, `SchemaTriggerProjectionList` and other rows; `joinedCollections`; `TaxonomyRef` + `dependencyRefs` (`dependencyNames` removed); `renameUniqueName` removed; `isSystemOwned`; `integrationsToProvision` | 1 |
| `references/hub2.dtos.ts`, `references/api2.dtos.ts` | same, TypeScript references (api2 regenerated for the first time since 2025) | 1 |
| `Tests/NorbixApiTests/DatabaseContractTests.swift` | new, 10 tests | 2 |
| `Tests/NorbixHubTests/DatabaseContractTests.swift` | new, 14 tests | 2 |
| `docs/database-rules.md` | new page: rules and error codes of Database calls | 3 |
| `README.md`, `docs/api/database.md`, `docs/hub/database.md` | links to the page; Hub records example without `$set` | 3 |
| `Sources/NorbixApi/Modules/DatabaseModule.swift`, `Sources/NorbixHub/Modules/DatabaseModule.swift` | doc comments on `updateMany` / `deleteMany` / `updateManyRecords` / `deleteManyRecords` | 3 |

Test evidence (after step 3): `swift test` — NorbixHubTests 219, NorbixApiTests 86, NorbixCoreTests 9, 0 failures.

## Findings

- The Swift Database methods take a `[String: Any]` request and return `Any?`, so no method signature changes in this wave: the new fields (`allRecords`, `env`, `dependencyRefs`, `joinedCollections`) pass through as they are. Nothing to change in `Sources` beyond comments — closed.
- The Hub docs example for `updateOneRecord` used `{ "$set": … }`, which the gateway now refuses (`CM-ERRORS-DATABASE-035`) — fixed here.
- The 6 Database import routes (`/{version}/database/imports…`) have no Swift method; the coverage matrix shows the same gap for 5 other SDKs. Pre-existing, not part of this wave — open.
- `scripts/generate_endpoints.py` writes to `Sources/NorbixSwift` / `Tests/NorbixSwiftTests`, folders that no longer exist; the modules are hand-written now. The `make generate` / `make check` targets are dead — open.
- The hosts no longer export internal message types (`TermInserted`, `ProjectId`, `IngestSourceMessage`, …); they left `hub.dtos.swift`. No SDK method uses them — open (they may flip-flop between hosts).

## Rejected / moved out

- Adding the import routes: not part of this wave's contract (see Findings).

## Needs you

- [ ] Nothing to decide. No public Swift method changed shape; the release is docs / tests / references only, so semantic-release makes no new version.

## Open questions

None.
