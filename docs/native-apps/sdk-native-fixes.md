# P5 — SDK fixes for the native apps (status.md step 1.10)
This file: /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/fix/native-app-sdk/docs/native-apps/sdk-native-fixes.md (branch fix/native-app-sdk, repo norbix-swift — the main chat copies it into the app repo at merge)

Where things are:
```
sdk-swift worktree:   /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/fix/native-app-sdk   (branch fix/native-app-sdk, made from fix/hub-optional-project 651ce56)
sdk-kotlin worktree:  /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-kotlin/fix/native-app-sdk  (branch fix/native-app-sdk, made from fix/hub-optional-project e01ec44)
main SDK folders:     /Users/djovaisas/Projects/norbix/sdks/norbix-swift, /Users/djovaisas/Projects/norbix/sdks/norbix-kotlin (branch fix/hub-optional-project — not edited; app agents build against them)
gateway (read only):  /Users/djovaisas/Projects/norbix/gateway
scratch:              ~/scratch/native/sdk-native-fixes/
```

## Goal
Both SDKs send the project and account ids in the headers the gateway reads, decode the fields and pages the apps need, and iOS can import the shared types — with tests, so the iOS / Android apps need no workarounds for these.
Not in scope: the gateway token bug (P6); new SDK methods for the gaps in inventory.md; releasing a new SDK version.

## Plan
1. [todo] fix(sdk-swift,sdk-kotlin:core:headers): send nb-project-id / nb-account-id (what the gateway reads) instead of X-CM-ProjectId / X-CM-AccountId   ref: 5.1
2. [todo] fix(sdk-swift:dtos): `Description` fields decode empty — find the root cause once; Kotlin/Gson check   ref: 5.2
3. [todo] fix(sdk-swift:core:page): `Page` reads `list.items`, and throws when no known shape matches; Kotlin check   ref: 5.3
4. [todo] fix(sdk-swift:api:database): typed database calls return decoded objects (`findOne` reads `result`, a JSON value type for records)   ref: 5.4
5. [todo] feat(sdk-swift:package): export NorbixCore as a library product; README note   ref: 5.5
6. [todo] test(sdk): `swift test` and `./gradlew build` green; fast-forward merge into fix/hub-optional-project in both repos; push   ref: 5.6
7. [todo] docs(native:sdk): "What the apps must change" block   ref: 5.7

## Changes
| file (absolute, branch) | what changed | step |
|------|--------------|------|

## Findings

## Rejected / moved out

## Needs you

## Open questions
none
