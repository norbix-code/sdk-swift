# P5 — SDK fixes for the native apps (status.md step 1.10)
This file: /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/fix/native-app-sdk/docs/native-apps/sdk-native-fixes.md (branch fix/native-app-sdk, repo norbix-swift — the main chat copies it into the app repo at merge)

Where things are:
```
sdk-swift worktree:   /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/fix/native-app-sdk   (branch fix/native-app-sdk, made from fix/hub-optional-project 651ce56)
sdk-kotlin worktree:  /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-kotlin/fix/native-app-sdk  (branch fix/native-app-sdk, made from fix/hub-optional-project e01ec44)
main SDK folders:     /Users/djovaisas/Projects/norbix/sdks/norbix-swift, /Users/djovaisas/Projects/norbix/sdks/norbix-kotlin (branch fix/hub-optional-project — not edited; they get these commits with `git pull` at gate G1)
gateway (read only):  /Users/djovaisas/Projects/norbix/gateway
scratch:              ~/scratch/native/sdk-native-fixes/ (test logs, live answers, consumer/ = throwaway Swift package that imports the SDK)
```

## Goal
Both SDKs send the project and account ids in the headers the gateway reads, decode the fields and pages the apps need, and iOS can import the shared types — with tests, so the iOS / Android apps need no workarounds for these.
Not in scope: the gateway token bug (P6); new SDK methods for the gaps in inventory.md; releasing a new SDK version.

## Plan
1. [done] fix(sdk-swift,sdk-kotlin:core:headers): project / account id now go in nb-project-id / nb-account-id, the headers the gateway reads; the Api login also sends norbix-project-id   ref: 5.1
2. [done] fix(sdk-swift:dtos): root cause of empty `Description` found — the upstream Swift DTO generator, in a file the SDK does not compile; guard test + README rule; Kotlin/Gson not affected   ref: 5.2
3. [done] fix(sdk-swift:core:page): `Page` reads `list.items`, keeps the cursor fields, and throws when no known shape matches; Kotlin has no typed find   ref: 5.3
4. [done] fix(sdk-swift:api:database): typed `findOne` reads `result`; new `JSONValue` type decodes records with no fixed shape   ref: 5.4
5. [done] feat(sdk-swift:package): `NorbixCore` is a library product; README install note   ref: 5.5
6. [done] test(sdk): `swift test` (113 tests) and `./gradlew build` (67 tests) green; fix/native-app-sdk fast-forwarded onto fix/hub-optional-project on origin in both repos   ref: 5.6
7. [done] docs(native:sdk): "What the apps must change" block below   ref: 5.7

Decisions made while working (no questions asked):
- decision(sdk:core:headers): old X-CM-* names are **not** kept for a release — reason: no gateway version ever read them (`grep -rn 'X-CM-' gateway/src` → 0), so they protect no client; keeping them only adds noise.
- decision(sdk:core:headers): norbix-project-id / norbix-account-id are **not** sent on every call — reason: on `/auth` they change the kind of login (project user / collaborator), so an account owner re-login with a project chosen would break. Only the Api client's `login` sends norbix-project-id, because that login is a project-user login (README shows it followed by `membership.getCurrentUser()`).
- decision(sdk-swift:dtos): `references/*.dtos.swift` left as they are — reason: generated upstream output, not compiled, and the typegen rules say never to edit or copy it; the real fix is the typegen Swift generator (not written yet).
- decision(sdks:merge): fast-forward done with `git push origin fix/native-app-sdk:fix/hub-optional-project` from each worktree — reason: the branch is checked out in the main SDK folders, which app agents build against; moving the local ref there would leave their files out of step. The main chat pulls at G1.

## Changes
| file (absolute, branch) | what changed | step |
|------|--------------|------|
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/fix/native-app-sdk/Sources/NorbixCore/Transport.swift (fix/native-app-sdk) | header constants; nb-project-id / nb-account-id instead of X-CM-*; per-call `headers` on the typed send | 5.1 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/fix/native-app-sdk/Sources/NorbixApi/NorbixApiClient.swift (fix/native-app-sdk) | `login` sends norbix-project-id | 5.1 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/fix/native-app-sdk/Tests/NorbixHubTests/NorbixHubClientTests.swift (fix/native-app-sdk) | header names updated; 2 new tests (project call headers, Hub login never sends norbix-project-id) | 5.1 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/fix/native-app-sdk/Tests/NorbixApiTests/NorbixApiClientTests.swift (fix/native-app-sdk) | new test: Api login sends norbix-project-id | 5.1 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/fix/native-app-sdk/Tests/NorbixApiTests/FilesModuleTests.swift (fix/native-app-sdk) | header name updated | 5.1 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-kotlin/fix/native-app-sdk/src/main/kotlin/ai/norbix/sdk/core/Transport.kt (fix/native-app-sdk) | same header change; doc comment line 16; per-call `headers`; header constants | 5.1 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-kotlin/fix/native-app-sdk/src/main/kotlin/ai/norbix/sdk/api/NorbixApi.kt (fix/native-app-sdk) | `login` sends norbix-project-id | 5.1 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-kotlin/fix/native-app-sdk/src/test/kotlin/ai/norbix/sdk/core/TenantHeadersTest.kt (fix/native-app-sdk) | new: 3 tests with a local HTTP server | 5.1 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-kotlin/fix/native-app-sdk/src/test/kotlin/ai/norbix/sdk/hub/HubWithoutProjectTest.kt (fix/native-app-sdk) | header names updated | 5.1 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-kotlin/fix/native-app-sdk/src/test/kotlin/ai/norbix/sdk/api/FilesTestIntegrationTest.kt (fix/native-app-sdk) | header name updated | 5.1 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/fix/native-app-sdk/Tests/NorbixCoreTests/DescriptionDecodingTests.swift (fix/native-app-sdk) | new: 2 tests pinning the `Description` root cause | 5.2 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/fix/native-app-sdk/Sources/NorbixCore/Responses.swift (fix/native-app-sdk) | `Page` decoding rewritten; cursor fields added | 5.3 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/fix/native-app-sdk/Sources/NorbixCore/JSONValue.swift (fix/native-app-sdk) | new `JSONValue` type | 5.4 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/fix/native-app-sdk/Sources/NorbixApi/Modules/DatabaseModule+Typed.swift (fix/native-app-sdk) | `findOne` reads `result`; `find` doc uses `pagingArgs` | 5.4 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/fix/native-app-sdk/Tests/NorbixApiTests/TypedDecodeTests.swift (fix/native-app-sdk) | 9 new tests with the gateway's answer shapes; findOne tests moved to the real `result` shape | 5.3, 5.4 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/fix/native-app-sdk/Package.swift (fix/native-app-sdk) | `NorbixCore` library product; wrong comment fixed | 5.5 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/fix/native-app-sdk/README.md (fix/native-app-sdk) | install note for NorbixCore; "Typed answers (Codable)" section; `take`/`skip` example → `pagingArgs` | 5.2, 5.4, 5.5 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/fix/native-app-sdk/docs/native-apps/sdk-native-fixes.md (fix/native-app-sdk) | this file | all |

## Findings

fix(sdk-swift,sdk-kotlin:core:headers): the SDKs sent the project id as X-CM-ProjectId, a name the gateway never reads, so every project-scoped call reached no project — done
    where: /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/fix/native-app-sdk/Sources/NorbixCore/Transport.swift:260 (branch fix/native-app-sdk)   ref: 5.1
```csharp
// gateway/src/Isidos.CodeMash.Services.Api/CodeMashAppHostBase.cs:708-713 (gateway main folder, read only)
            // 2️⃣ Request header (nb-project-id)
            if (!string.IsNullOrWhiteSpace(req.Headers[EventMetadataHeaderNames.ProjectId]))   // <-- here: the name the gateway reads
            {
                var headerProjectIdResult =
                    req.Headers[EventMetadataHeaderNames.ProjectId]
                        .Required(ProjectIdMapper.Map, EventMetadataHeaderNames.ProjectId);
```
```csharp
// gateway/src/Isidos.CodeMash.Domain/Statics/Modules.cs:17-21
    public static class EventMetadataHeaderNames
    {
        public const string AccountId = "nb-account-id";   // <-- read at CodeMashAppHostBase.cs:645, only for calls without a session
        public const string CorrelationId = "nb-correlation-id";
        public const string ProjectId = "nb-project-id";   // <-- read at CodeMashAppHostBase.cs:709, every call
```
```swift
// before — sdks/norbix-swift/Sources/NorbixCore/Transport.swift:246-251 (fix/hub-optional-project)
        if !snapshot.projectId.isEmpty {
            httpRequest.setValue(snapshot.projectId, forHTTPHeaderField: "X-CM-ProjectId")   // <-- here: ignored by the gateway
        }
        if let accountId = snapshot.accountId {
            httpRequest.setValue(accountId, forHTTPHeaderField: "X-CM-AccountId")            // <-- here: ignored by the gateway
        }
```
```swift
// after — Sources/NorbixCore/Transport.swift:259-267 (fix/native-app-sdk)
        if !snapshot.projectId.isEmpty {
            httpRequest.setValue(snapshot.projectId, forHTTPHeaderField: Transport.projectIdHeader)   // "nb-project-id"
        }
        if let accountId = snapshot.accountId, !accountId.isEmpty {
            httpRequest.setValue(accountId, forHTTPHeaderField: Transport.accountIdHeader)            // "nb-account-id"
        }
        for (k, v) in headers {
            httpRequest.setValue(v, forHTTPHeaderField: k)
        }
```
```kotlin
// before — sdks/norbix-kotlin/src/main/kotlin/ai/norbix/sdk/core/Transport.kt:149-150 (fix/hub-optional-project)
        if (config.projectId.isNotBlank()) builder.header("X-CM-ProjectId", config.projectId)   // <-- here
        config.accountId?.let { builder.header("X-CM-AccountId", it) }                           // <-- here
// after — src/main/kotlin/ai/norbix/sdk/core/Transport.kt:156-158 (fix/native-app-sdk)
        if (config.projectId.isNotBlank()) builder.header(PROJECT_ID_HEADER, config.projectId)
        config.accountId?.takeIf { it.isNotBlank() }?.let { builder.header(ACCOUNT_ID_HEADER, it) }
        headers.forEach { (k, v) -> builder.header(k, v) }
```
The tests that prove it — Swift `NorbixHubClientTests.testProjectScopedCallSendsTheGatewayProjectAndAccountHeaders` (line 54), Kotlin `TenantHeadersTest.projectScopedHubCallSendsTheGatewayProjectAndAccountHeaders` (line 40):
```swift
// Tests/NorbixHubTests/NorbixHubClientTests.swift:54-67 (fix/native-app-sdk)
    func testProjectScopedCallSendsTheGatewayProjectAndAccountHeaders() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"list":[]}"#.utf8)
        let client = try NorbixHubClient(bearerToken: "tok", executor: mock)
        client.setScope(projectId: "prj_1", accountId: "acc_1")

        _ = try await client.membership.getRoles()

        let request = try XCTUnwrap(mock.lastRequest)
        XCTAssertEqual(request.value(forHTTPHeaderField: "nb-project-id"), "prj_1")
        XCTAssertEqual(request.value(forHTTPHeaderField: "nb-account-id"), "acc_1")
        XCTAssertNil(request.value(forHTTPHeaderField: "X-CM-ProjectId"))
        XCTAssertNil(request.value(forHTTPHeaderField: "X-CM-AccountId"))
    }
```
Live proof — your local Hub on http://127.0.0.1:5001 (gateway main folder, ManagedService build), P2's throwaway test owner, ss-id cookie from `POST /auth`. The project id `pr_1NMw…` is well-formed but not owned by the test account (it has no projects and a project cap of 0), so "permission missing" after the fix means the gateway found the project and went on to the permission check. Full answers: ~/scratch/native/sdk-native-fixes/live-5.1.txt, live-5.1-sdk.txt
```
# before — header X-CM-ProjectId
GET /v3/membership/roles  cookie ss-id + X-CM-ProjectId: pr_1NMwlmEkZF3Z5C2KULTpKs
{"roles":[],"responseStatus":{"isSuccess":false,"errors":[{"message":"Property ProjectId is required","errorCode":"CM-ERRORS-PROPERTY-001",...}]}}   <-- header ignored

# after — header nb-project-id
GET /v3/membership/roles  cookie ss-id + nb-project-id: pr_1NMwlmEkZF3Z5C2KULTpKs
{"roles":[],"responseStatus":{"isSuccess":false,"errors":[{"message":"Caller is missing required permission 'membership:read on membership:role:all'.","errorCode":"CM-ERRORS-MEMBERSHIP-039",...}]}}   <-- project resolved

# after, through the Swift SDK from this worktree (hub.setScope(projectId:) + hub.membership.getRoles(), session-cookie executor)
login ok, userId=31
getRoles NorbixError code=CM-ERRORS-MEMBERSHIP-039 message=Caller is missing required permission 'membership:read on membership:role:all'.
```

fix(sdk-swift,sdk-kotlin:api:auth): the Api client's login is a project-user login, but the gateway picks the project on /auth only from norbix-project-id, which the SDKs never sent — done
    where: /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/fix/native-app-sdk/Sources/NorbixApi/NorbixApiClient.swift:141 (branch fix/native-app-sdk)   ref: 5.1
```csharp
// gateway/src/Isidos.CodeMash.Services.Api/Configure/Plugins/Auth/Gateway/GatewayCredentialsAuthProvider.cs:136, 150-153 (read only)
        var projectIdAsString = authService.Request.Headers.Get(AuthStatics.ProjectIdHeaderKey);   // "norbix-project-id" (AuthStatics.cs:10)
        // Project User scope
        // DB - Project DB Integration
        // Includes norbix-project-id (e.g. from API, SDK, CM Cloud)
        if (!string.IsNullOrWhiteSpace(projectIdAsString))                                          // <-- here: without it, /auth is an account login
```
```swift
// after — Sources/NorbixApi/NorbixApiClient.swift:131-142 (fix/native-app-sdk)
    public func login(_ credentials: LoginCredentials) async throws -> AuthResponse {
        let auth: AuthResponse = try await transport.send(
            path: "/auth",
            method: "POST",
            request: [
                "userName": credentials.userName,
                "password": credentials.password,
                "provider": credentials.provider
            ],
            scope: .unauthenticated,
            headers: [Transport.loginProjectIdHeader: transport.config.projectId],   // <-- added; the Hub login does not send it
            as: AuthResponse.self
```
Tests: Swift `NorbixApiClientTests.testLoginSendsTheLoginProjectHeader` (line 32), `NorbixHubClientTests.testHubLoginDoesNotSendTheLoginProjectHeader` (line 71); Kotlin `TenantHeadersTest.apiLoginSendsTheLoginProjectHeader` (line 65), `hubLoginDoesNotSendTheLoginProjectHeader` (line 56). Not checked live: needs a project user in a project the test account owns.

fix(sdk-swift:dtos): `Description` fields decode empty because the upstream Swift DTO generator writes a capital D and no CodingKeys; the file is not compiled by the SDK, so nothing in the SDK itself was broken — done (guard test + README); generator fix moved out
    where: /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/fix/native-app-sdk/Tests/NorbixCoreTests/DescriptionDecodingTests.swift:28 (branch fix/native-app-sdk)   ref: 5.2
```swift
// references/hub.dtos.swift:36071-36080 (fix/native-app-sdk) — header of the file: "Options: ... DefaultImports: Foundation,ServiceStack", made by the gateway's /types/swift
public class RoleItemDto : Codable
{
    public var id:String?
    public var name:String?
    public var displayName:String?
    public var Description:String?     // <-- here: synthesized Codable looks for JSON key "Description"; gateway sends "description"
    public var isSystem:Bool?
    public var attachedPolicies:[String]?

    required public init(){}
}
```
```swift
// Package.swift:25-40 (fix/native-app-sdk) — the targets compile only Sources/*, never references/
        .target(
            name: "NorbixCore",
            path: "Sources/NorbixCore"
        ),
        .target(
            name: "NorbixApi",
            dependencies: ["NorbixCore"],
            path: "Sources/NorbixApi"
        ),
```
Checked: `rg '[dD]escription' Sources` → no model field, only method names / error text. The SDK decoder has no key strategy (`JSONDecoder.norbixDefault` sets only dates), so an app model with `description` decodes fine. A global key strategy would break lower-case `description` in every other model, so it was not added. The Swift generator in `sdks/typegen/languages/swift/` has only its README (no `generate.py`) — that is where the rule belongs.
```swift
// the test that pins it — Tests/NorbixCoreTests/DescriptionDecodingTests.swift:23-32 (fix/native-app-sdk)
    func testNorbixDecoderReadsLowerCaseDescription() throws {
        let role = try JSONDecoder.norbixDefault.decode(Role.self, from: body)
        XCTAssertEqual(role.description, "Full access")
    }

    func testCapitalDescriptionWithoutCodingKeysDecodesEmpty() throws {
        let role = try JSONDecoder.norbixDefault.decode(UpstreamStyleRole.self, from: body)
        XCTAssertEqual(role.name, "Admins")
        XCTAssertNil(role.Description)
    }
```
Kotlin: not affected — the reference file uses lower-case `description` (68 in hub.dtos.kt, 13 in api.dtos.kt), Gson matches field names as they are, and the SDK returns untyped maps anyway.

fix(sdk-swift:core:page): typed `find` read a top-level `items`, while the gateway sends records under `list.items`, so the page came back empty with no error — done
    where: /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/fix/native-app-sdk/Sources/NorbixCore/Responses.swift:106 (branch fix/native-app-sdk)   ref: 5.3
```csharp
// gateway/src/Isidos.CodeMash.Gateway.Api.Database/Collections/Find.cs:67-75 (read only) — GetUsersResponse (Api membership) has the same `List`
public record FindResponse : ResponseBase
{
    public PaginatedResponse<object?>? List { get; set; }    // <-- records under "list"
}
// gateway/src/Isidos.CodeMash.Sharable/PaginatedResponse.cs:52-66 — Items, HasMore, HasPrevious, StartingAfter, EndingBefore (no total)
```
```swift
// before — Sources/NorbixCore/Responses.swift:52-58 (fix/hub-optional-project)
        if let items = try? c.decode([Item].self, forKey: .items) {     // <-- here: top-level "items" only; also hides item decode errors
            self.items = items
        } else if let single = try? decoder.singleValueContainer().decode([Item].self) {
            self.items = single
        } else {
            self.items = []                                             // <-- here: {"list":{"items":[…]}} lands here — empty, no error
        }
```
```swift
// after — Sources/NorbixCore/Responses.swift:105-116 (fix/native-app-sdk)
        let page: KeyedDecodingContainer<AnswerKeys>
        if root.contains(.list), try !root.decodeNil(forKey: .list) {
            page = try root.nestedContainer(keyedBy: AnswerKeys.self, forKey: .list)
        } else {
            page = root
        }
        guard page.contains(.items) else {
            throw DecodingError.dataCorrupted(.init(
                codingPath: decoder.codingPath,
                debugDescription: "Page: none of the known shapes matched (list.items, items, array). Keys: \(root.allKeys.map(\.stringValue))."
            ))
        }
```
Tests (Tests/NorbixApiTests/TypedDecodeTests.swift, fix/native-app-sdk): `testFindReadsListItemsFromTheGatewayAnswer` (44), `testFindReadsAnEmptyList` (61), `testGetUsersReadsListItems` (73), `testPageStillReadsABareArray` (84), `testUnknownAnswerShapeThrowsInsteadOfAnEmptyPage` (89), `testItemsThatDoNotDecodeThrowInsteadOfAnEmptyPage` (103). Kotlin: no typed find exists (`Transport.send` returns `Any?`), so `list.items` reaches the app as nested maps — nothing to change.

fix(sdk-swift:api:database): typed `findOne` decoded the whole answer as the record, but the gateway wraps it in `result`; records are JSON objects while the upstream DTOs say `String` — done
    where: /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/fix/native-app-sdk/Sources/NorbixApi/Modules/DatabaseModule+Typed.swift:62 (branch fix/native-app-sdk)   ref: 5.4
```swift
// references/api.dtos.swift (fix/native-app-sdk) — upstream types, not compiled
public class FindResponse : ResponseBase
    public var list:PaginatedResponse<String>?     // <-- here: String; the gateway renders records as objects (Find.cs:70 "rendered natively ... rather than as an extended-JSON string")
public class FindOneResponse : ResponseBase
    public var result:String?                      // <-- here: String
```
```swift
// before — Sources/NorbixApi/Modules/DatabaseModule+Typed.swift:57-65 (fix/hub-optional-project)
        try await transport.send(
            path: "/{version}/database/collections/{collectionName}/{id}",
            method: "GET",
            request: ["collectionName": collection, "id": id],
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken,
            as: T.self                             // <-- here: decodes {"result":{…}} itself as T
        )
```
```swift
// after — Sources/NorbixApi/Modules/DatabaseModule+Typed.swift:62-77 (fix/native-app-sdk)
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
```
New `NorbixCore.JSONValue` (Sources/NorbixCore/JSONValue.swift) for records with no fixed shape: `Page<JSONValue>` / `findOne(..., as: JSONValue.self)`, with `record["title"]?.stringValue`, `intValue`, `boolValue`, `[index]`, `anyValue` (→ `[String: Any]`). Tests: `testFindOneReturnsTypedItem` (118), `testFindOneWithoutResultThrows` (154), `testFindDecodesRecordsAsJSONValue` (168), `testFindOneDecodesARecordAsJSONValue` (182). The `find` doc example sent `take` / `skip`, which the gateway does not read (`FindRequest.PagingArgs`, Find.cs:50) — changed to `"pagingArgs": "{pageSize:20}"` (same inline format FilesModule already uses).

feat(sdk-swift:package): `NorbixCore` was not a library product, and the comment promised re-exporting typealiases that do not exist — done
    where: /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/fix/native-app-sdk/Package.swift:23 (branch fix/native-app-sdk)   ref: 5.5
```swift
// before — Package.swift:19-23 (fix/hub-optional-project)
        // Hub via public typealiases. This matches the Stripe iOS pattern.      // <-- here: no such typealiases in Sources/
        // Project-scoped data plane (https://api.norbix.ai by default).
        .library(name: "NorbixApi", targets: ["NorbixApi"]),
        // Project / account configuration plane (https://hub.norbix.ai by default).
        .library(name: "NorbixHub", targets: ["NorbixHub"])                     // <-- missing: NorbixCore
```
```swift
// after — Package.swift:16-23 (fix/native-app-sdk)
        // Project-scoped data plane (https://api.norbix.ai by default).
        .library(name: "NorbixApi", targets: ["NorbixApi"]),
        // Project / account configuration plane (https://hub.norbix.ai by default).
        .library(name: "NorbixHub", targets: ["NorbixHub"]),
        // Shared types both clients use (LoginCredentials, NorbixError,
        // HTTPExecuting, Page, JSONValue, ...). Add it next to NorbixApi /
        // NorbixHub to `import NorbixCore` in an app.
        .library(name: "NorbixCore", targets: ["NorbixCore"])
```
Checked with a throwaway package (~/scratch/native/sdk-native-fixes/consumer) that lists `.product(name: "NorbixCore", package: …)`: builds and runs, prints `consumer ok a 1 nb-project-id`.

fix(sdk-swift:api:membership): typed `getUser` has the same wrapper bug as `findOne` — the gateway sends the user under `user`, the SDK decodes the whole answer — todo (moved out)
    where: /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/fix/native-app-sdk/Sources/NorbixApi/Modules/MembershipModule+Typed.swift:19 (branch fix/native-app-sdk)
```swift
// Sources/NorbixApi/Modules/MembershipModule+Typed.swift:19-27 (fix/native-app-sdk)
        try await transport.send(
            path: "/{version}/membership/auth/{id}",
            method: "GET",
            request: ["id": id],
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken,
            as: T.self                             // <-- here: answer is {"user":{…}}
        )
```
```csharp
// gateway/src/Isidos.CodeMash.Gateway.Api.Membership/Users/Get.cs:36-39 (read only)
public record GetUserResponse : ResponseBase
{
    public AuthDto? User { get; set; }             // <-- "user"
}
```
Not used by the native apps (they use the Hub, not Api membership), so it stays out of this item.

## What the apps must change
For each fix, the app code that becomes simpler. Link the SDK on `fix/hub-optional-project` after `git pull` in both main SDK folders (gate G1).

1. Project-scoped calls (5.1) — no more `"projectId"` in every request dictionary (the workaround inventory.md proposed). Choose the project once:
```swift
// before (workaround from inventory.md, project-header finding)
let roles = try await hub.membership.getRoles(["projectId": projectId])
// after
hub.setScope(projectId: projectId, accountId: accountId)   // NorbixClients.rescope already does this
let roles = try await hub.membership.getRoles()
```
```kotlin
// after (Android)
hub.setProjectId(projectId); hub.setAccountId(accountId)
val roles = hub.membership.getRoles()
```
2. `Description` fields (5.2) — nothing to map by hand if the app's own models name the field as the gateway sends it; never copy `references/*.dtos.swift` into the app:
```swift
// before (inventory.md: "P6 typed models: map description yourself")
enum CodingKeys: String, CodingKey { case name, Description = "description" }
// after
struct RoleItem: Decodable { let name: String; let description: String? }
```
3. Records and lists (5.3, 5.4) — no hand-decoding of `list` / `result` from `Any?`:
```swift
// before (inventory.md: "use the untyped find and decode list yourself")
let raw = try await api.database.find(["collectionName": "orders"]) as? [String: Any]
let items = (raw?["list"] as? [String: Any])?["items"] as? [[String: Any]] ?? []
// after
let page: Page<JSONValue> = try await api.database.find(collection: "orders", query: ["pagingArgs": "{pageSize:20}"], as: JSONValue.self)
let title = page.items.first?["title"]?.stringValue      // page.hasMore / page.startingAfter for the next page
let one: JSONValue = try await api.database.findOne(collection: "orders", id: id, as: JSONValue.self)
```
The Hub modules still return `Any?` (typed Hub modules are a later ticket), so the app's typed-model layer for Hub answers (status.md 1.4) stays.

4. `import NorbixCore` (5.5) — add the product in XcodeGen and drop the TODO:
```yaml
# /Users/djovaisas/Projects/norbix/worktrees/app/native/ios-scaffold/ios/project.yml:58-61 (branch native/items/ios-scaffold) — before
      - package: Norbix
        product: NorbixHub
      - package: Norbix
        product: NorbixApi
# after — add
      - package: Norbix
        product: NorbixCore
```
```swift
// /Users/djovaisas/Projects/norbix/worktrees/app/native/ios-scaffold/ios/NorbixApp/Core/Clients/NorbixClients.swift:4 (branch native/items/ios-scaffold)
import NorbixCore // TODO(P5): import NorbixCore product      // <-- before
import NorbixCore                                              // <-- after
```
Unchanged by this item: the `SessionCookieExecutor` stays until the gateway token fix (P6).

## Test results (step 5.6)
Swift — `swift test` in /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/fix/native-app-sdk (log ~/scratch/native/sdk-native-fixes/swift-final.log): 113 tests, 0 failures (was 99)
```
	 Executed 43 tests, with 0 failures (0 unexpected) in 0.128 (0.139) seconds    <- NorbixApiTests
	 Executed 11 tests, with 0 failures (0 unexpected) in 0.020 (0.022) seconds    <- NorbixCoreTests
	 Executed 59 tests, with 0 failures (0 unexpected) in 0.905 (0.926) seconds    <- NorbixHubTests
```
Kotlin — `./gradlew clean build` in /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-kotlin/fix/native-app-sdk (log ~/scratch/native/sdk-native-fixes/kotlin-final.log): 67 tests, 0 failures (was 64)
```
BUILD SUCCESSFUL in 10s
6 actionable tasks: 6 executed
```

## Rejected / moved out
- decision(typegen:swift): the Swift generator must write `description` (lower case, with a CodingKey) — moved out — reason: lives in the private `sdks/typegen` repo (`languages/swift/` has no generator yet), not in this item's two repos — new ticket: typegen swift "write description with a CodingKey" (to create; evidence in Findings, 5.2)
- decision(sdk-swift:api:membership): typed `getUser` should read `user` — moved out — reason: not used by the native apps — new ticket: sdk-swift "typed getUser reads the user wrapper" (to create)
- decision(sdk-js:headers): norbix-js still sends X-CM-ProjectId (tests/hub/notifications.test.ts:180 and more), and the gateway CORS allow-list (Cors.cs:174-205) has norbix-project-id but not nb-project-id / nb-account-id, so a browser client cannot just switch — moved out — reason: other SDK + gateway change; native apps do not need CORS — new ticket: sdks "tenant headers in the browser SDK + CORS" (to create)
- decision(sdk-swift:references): no hand edits to references/*.dtos.swift — rejected — reason: generated upstream output; typegen rules forbid copying or patching it
- decision(sdk-swift:make): Makefile targets `sync-types` / `generate` call scripts/ that are not in the repo — moved out — reason: unrelated to the apps — new ticket: none (noted here)
- decision(sdk-kotlin:page): Kotlin typed find / Page — dropped — reason: Kotlin has no typed calls; answers are maps

## Needs you
- [ ] release(sdks:hub): fix/hub-optional-project on origin now carries these commits in both SDKs — needs you · action: main chat runs `git pull` in /Users/djovaisas/Projects/norbix/sdks/norbix-swift and /Users/djovaisas/Projects/norbix/sdks/norbix-kotlin at gate G1 (then the pull requests to main)
- [ ] chore(app:ios): app follow-up from "What the apps must change" item 4 — needs you · action: the iOS scaffold owner adds the NorbixCore product to project.yml and drops the TODO

## Open questions
none
