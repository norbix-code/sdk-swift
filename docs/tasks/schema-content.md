# Schema-content campaign — Swift SDK (client side)
This file: /Users/djovaisas/Projects/norbix/worktrees/norbix-swift/audit/schema-content/docs/tasks/schema-content.md (branch audit/schema-content, repo norbix-code/sdk-swift)

Gateway campaign: /Users/djovaisas/Projects/norbix/worktrees/gateway/audit/schema-content/campaign/docs/tasks/schema-content.md
(branch audit/schema-content — NOT on refactoringV2 yet). This pull request is opened with
`nbx-ship --no-merge` and waits until the gateway campaign lands; it is not merged in this wave.

## Goal
Give the Swift SDK the schema-content contract: `expandReferences` on the record reads with a typed
`{ id, display }` view (`ExpandedReference`, usable inside a `Codable` record), dotted update paths +
`arrayFilters`, files by id on both clients, the new schema field shapes (object / array / json,
default, unique, displayField, …), term slug, and the new error codes in the docs — with the Hub and
API references regenerated from the campaign hosts.
Not in scope: typed wrappers for every Database method (the dictionary methods pass the new members
through unchanged); merging the pull request; the coverage matrix (Routine C runs after the gateway
campaign lands).

## Plan
1. [done] chore(sdk-swift:types): regenerate `references/{hub,api}.dtos.swift` (`x swift`) and `{hub2,api2}.dtos.ts` (`x typescript`) from the campaign Hub (:49826) and Api (:49877), header kept at :5001 / :5002 — Api 208 → 214 classes, Hub 1370 → 1376, nothing removed — commit `767b385`
2. [done] feat(sdk-swift:database+files): `ExpandedReference` (NorbixCore, Codable: decodes the pair and a bare id), `expandReferences:` on the typed `find` / `findOne`, typed `findOwn`, `api.files.getFileById(integrationId:id:)` → `FileDetails`, `hub.files.getFileById`, doc comments on the record reads / updates of both clients — no existing method shape changed — commit `b66c539`
3. [done] test(sdk-swift:database): `ExpandedReferenceTests` (9), Api `SchemaContentContractTests` (23), Hub `SchemaContentContractTests` (13) against the fake transport — commit `f238401`
4. [done] docs(sdk-swift): API · Database (3 sections), `docs/database-rules.md` (records 014 / 030 / 039–049 / 050–056, schema contract + SCHEMA-010 / 012 / 022 / 036–041, term slug + TAXONOMIES-012 / 013), HUB · Database bullets, API / HUB · Files (by id), index counts, README example 4 — commit `78b4b7b`
5. [done] chore(sdk-swift:ship): this task file; `swift build` + `swift test` green — NorbixHubTests 232, NorbixApiTests 109, NorbixCoreTests 18 (219 / 86 / 9 before), 0 failures; `nbx-ship --no-merge` → pull request https://github.com/norbix-code/sdk-swift/pull/26 (open, not merged)

## Changes
| file (absolute, branch audit/schema-content) | what changed | step |
|---|---|---|
| /Users/djovaisas/Projects/norbix/worktrees/norbix-swift/audit/schema-content/references/hub.dtos.swift · references/hub2.dtos.ts | regenerated: expandReferences, arrayFilters, GetFileById / GetFileByIdResponse, ObjectFieldDto / ArrayFieldDto / JsonFieldDto / CurrencyDefaultDto, default / unique / displayField / multipleOf / minItems / maxItems / allowedFileType / maxSizeMb, term slug; descriptions | 1 |
| /Users/djovaisas/Projects/norbix/worktrees/norbix-swift/audit/schema-content/references/api.dtos.swift · references/api2.dtos.ts | regenerated: same members on the Api DTOs; GetFileByIdRequest | 1 |
| /Users/djovaisas/Projects/norbix/worktrees/norbix-swift/audit/schema-content/Sources/NorbixCore/ExpandedReference.swift | new: `ExpandedReference(id:display:)`, `Display` (`.text` / `.translated`), `isResolved`, `displayText(language:)`, Codable (pair or bare id), `from(_:)` / `listFrom(_:)` for untyped answers | 2 |
| /Users/djovaisas/Projects/norbix/worktrees/norbix-swift/audit/schema-content/Sources/NorbixApi/Modules/DatabaseModule+Typed.swift | `expandReferences: Bool = false` on `find(collection:as:)` and `findOne(collection:id:as:)`; new typed `findOwn(collection:query:expandReferences:as:)` | 2 |
| /Users/djovaisas/Projects/norbix/worktrees/norbix-swift/audit/schema-content/Sources/NorbixApi/Modules/DatabaseModule.swift | doc comments on find / findOne / findOwn / updateOne / updateMany | 2 |
| /Users/djovaisas/Projects/norbix/worktrees/norbix-swift/audit/schema-content/Sources/NorbixApi/Modules/FilesModule.swift | `getFileById(integrationId:id:)` — GET /{version}/files/{filesIntegrationId}/by-id/{id} → `FileDetails` | 2 |
| /Users/djovaisas/Projects/norbix/worktrees/norbix-swift/audit/schema-content/Sources/NorbixHub/Modules/FilesModule.swift | `getFileById(_:)` — GET /{version}/files/item/by-id | 2 |
| /Users/djovaisas/Projects/norbix/worktrees/norbix-swift/audit/schema-content/Sources/NorbixHub/Modules/DatabaseModule.swift | doc comments on findRecords / findOneRecord / updateOneRecord / updateManyRecords | 2 |
| /Users/djovaisas/Projects/norbix/worktrees/norbix-swift/audit/schema-content/Tests/NorbixCoreTests/ExpandedReferenceTests.swift | new, 9 tests | 3 |
| /Users/djovaisas/Projects/norbix/worktrees/norbix-swift/audit/schema-content/Tests/NorbixApiTests/SchemaContentContractTests.swift | new, 23 tests: query / body / path per call (untyped and typed), expanded answer at depth, bare ids without the flag, schema shapes and slug untouched, by-id + 404, refusals 014 / 030 / 039–049 / 050–054 / 055 / 056 | 3 |
| /Users/djovaisas/Projects/norbix/worktrees/norbix-swift/audit/schema-content/Tests/NorbixHubTests/SchemaContentContractTests.swift | new, 13 tests: findRecords / findOneRecord / updateOneRecord / updateManyRecords / getFileById on the wire, schema shapes in the save body, term slug round trip, SCHEMA-010 / 022 / 036–041, TAXONOMIES-012 / 013, DATABASE-014 / 056, FILES 404 | 3 |
| /Users/djovaisas/Projects/norbix/worktrees/norbix-swift/audit/schema-content/docs/api/database.md | "Linked records — expandReferences", "Nested documents — dotted paths and arrayFilters", "Schema field shapes" | 4 |
| /Users/djovaisas/Projects/norbix/worktrees/norbix-swift/audit/schema-content/docs/database-rules.md | 6 records rows, schema contract bullet + 7-row table, 2 taxonomy rows + slug paragraph | 4 |
| /Users/djovaisas/Projects/norbix/worktrees/norbix-swift/audit/schema-content/docs/hub/database.md | record bullets (expandReferences, arrayFilters, codes) | 4 |
| /Users/djovaisas/Projects/norbix/worktrees/norbix-swift/audit/schema-content/docs/api/files.md · docs/hub/files.md | `getFileById` row + "Files by id" section | 4 |
| /Users/djovaisas/Projects/norbix/worktrees/norbix-swift/audit/schema-content/docs/api/_index.md · docs/hub/_index.md | files module count +1 | 4 |
| /Users/djovaisas/Projects/norbix/worktrees/norbix-swift/audit/schema-content/README.md | example 4: linked records with a typed answer | 4 |
| /Users/djovaisas/Projects/norbix/worktrees/norbix-swift/audit/schema-content/docs/tasks/schema-content.md | this file | 5 |

## Findings
- F1 (open, pre-existing): the typed `findOne(collection:id:as:)` decodes `T` from the whole answer, but the gateway wraps the record as `{ "result": { … } }` (`FindOneResponse`), so a real call decodes an empty / wrong record. The typed `find` has the same gap for the gateway's `{ "list": { "items": … } }` shape (`Page` reads top-level `items`). Both are fixed on the branch `fix/hub-optional-project` (`FindOneAnswer`, `Page` reading `list.items`) that is not on `main` yet; this item keeps the `main` shapes and tests them as they are.
- F2 (open, pre-existing): `docs/api/_index.md` said `files` had 8 methods while the module table in `docs/api/files.md` lists 10 (now 11); `docs/hub/_index.md` said 15 against 23 (now 24). Bumped by one here, not recounted.
- F3 (note): the dictionary methods take `[String: Any]` and answer `Any?`, so `expandReferences`, `arrayFilters`, the new field DTOs and term `slug` pass through with no code change; the typed pieces asked for are `ExpandedReference`, the `expandReferences:` flag on the typed reads, the typed `findOwn` and `getFileById` → `FileDetails`.
- F4 (note): `sdk-management.md` says `make sync-types` for Swift; `scripts/sync_types.py` only knows :5001 / :5002, so the references were regenerated with `x swift <file>` / `x typescript <file>` after editing the `BaseUrl:` line to the running host and putting it back (same as the last Database wave, `62fab4c`).
- F5 (open, pre-existing): `scripts/generate_endpoints.py` (`make generate` / `make check`) writes to `Sources/NorbixSwift`, a folder that no longer exists — already recorded in `database-last-wave-swift.md`; still dead.
- F6 (note): `ExpandedReference.Display.from` uses `CFGetTypeID` to tell a JSON `true` from `1` on an untyped answer; the package only builds for Apple platforms (`Package.swift`), so that is fine today — it would need `#if canImport(Darwin)` for Linux.

## Rejected / moved out
- Merging the pull request — the computed task says open only (`--no-merge`), the gateway campaign is not on refactoringV2 yet.
- Routine C (coverage matrix) — runs after the gateway campaign lands.
- Fixing F1 here — it is a separate, pre-existing bug with its own branch; changing the typed decode shape in this item would mix two contracts.

## Needs you
- [ ] Merge https://github.com/norbix-code/sdk-swift/pull/26 (Rebase and merge) after the gateway branch audit/schema-content lands on refactoringV2.

## Open questions
- none
