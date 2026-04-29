# Norbix Swift SDK — Architect Review

> **Update — round 3 applied.** On top of rounds 1 and 2 (three products,
> flat client API, default URLs, throwing init, Sendable error,
> `apiKeys` rename, lock-based `Transport`, typed Codable layer), round 3
> ships:
>
> - **Files helpers** on `NorbixApi`: `client.files.list`, `getInfo`,
>   `sign`, `download(id:)` and `download(id:, to:)`. No `upload` — bytes
>   go directly to the cloud provider via the pre-signed URL.
> - **Client protocols** `NorbixApiClientType` and `NorbixHubClientType`
>   for downstream testability without `@testable import`.
> - **Logger hooks**: `NorbixLogger` protocol, default `OSLogger` backed
>   by `os.Logger` (zero deps), `NoopLogger` to silence everything,
>   `verbose: Bool` on `NorbixConfig` (default off, `NORBIX_VERBOSE=1`
>   env override), automatic redaction of `Authorization` header and
>   secret body fields (`password`, `apiKey`, `bearerToken`, `secret`,
>   etc.).
> - **Retry policy + idempotency keys**: `RetryPolicy` with exponential
>   backoff + full jitter, retries `429` and `5xx`, honors `Retry-After`,
>   auto-attaches a UUID `Idempotency-Key` header to every
>   POST/PUT/PATCH/DELETE so a retry can't double-write.
>
> See **"What shipped"** at the bottom for the round-by-round changelog
> and **"Still open"** for what remains.

This document is an architect-level evaluation of the Norbix Swift SDK with focus on:

1. **Configuration UX** — how config is initiated, manual init vs. environment variables.
2. **Usage UX** — modular imports, ergonomics like `db.findAll()`, `files.download()`, `code.execute()`.

It compares the current shape of the SDK to best-in-class Swift libraries (Stripe-iOS, Supabase-swift, Firebase, AWS SDK for Swift, Apollo iOS) and lists concrete, prioritized improvements with code paths.

Files inspected:

- `Package.swift`
- `Sources/NorbixSwift/NorbixSwift.swift`
- `Sources/NorbixSwift/Core/Norbix.swift`
- `Sources/NorbixSwift/Core/Transport.swift`
- `Sources/NorbixSwift/Core/NorbixError.swift`
- `Sources/NorbixSwift/API/ApiNamespace.swift` and all `API/APIxxxModule.swift`
- `Sources/NorbixSwift/Hub/HubNamespace.swift` and all `Hub/HUBxxxModule.swift`
- `Tests/NorbixSwiftTests/*`
- `README.md`

---

## Suggestions (ranked by impact)

### 1. Replace `[String: Any]` request bags with typed parameters and typed responses

Right now every method accepts `_ request: [String: Any] = [:]` and returns `Any?`. This is the single biggest UX problem. It throws away Swift's main selling point — type safety. Best-in-class Swift SDKs use generated `Codable` request/response models.

See `Sources/NorbixSwift/API/APIDatabaseModule.swift` lines 12-22 — `findTerms` takes a dictionary where the user must guess that the path needs `taxonomyName`, and gets back `Any?` they have to cast.

### 2. Promote magic-string path params to real Swift parameters

The `{version}/database/collections/{collectionName}/{id}` pattern (`Sources/NorbixSwift/Core/Transport.swift`, `buildUrlAndBody`, lines ~150-180) does case-insensitive lookup against a dictionary. A caller writing `db.findOne(["id": "123", "collectionname": "orders"])` gets a runtime error if they typo the key. Path params should be required, named arguments: `findOne(collection: "orders", id: "123")`.

### 3. Add a dedicated `NorbixConfig` struct + a `Norbix.configure(from: .environment)` factory

Today config is read inside `Norbix.init` (`Sources/NorbixSwift/Core/Norbix.swift` lines 24-46). It mixes user-passed args and `ProcessInfo.processInfo.environment` reads, with `precondition` (which crashes the app) if `projectId` is missing. This is unfriendly:

- There is no way to load config from a `.env` file, an `Info.plist` key, a Keychain, or a custom provider.
- `precondition` should be a throwing initializer (`init(...) throws`) that returns a `NorbixError` with code `NORBIX_CONFIG_INVALID`.
- There is no programmatic way to *see* the resolved config (e.g., for debugging which `baseUrlApi` is in use).

### 4. Split into multiple SwiftPM products so callers can import only what they need

`Package.swift` (lines 10-12) exposes one product `NorbixSwift` containing **23 modules** (7 API + 16 Hub). A mobile app that only uses `api.database` still pays compile cost and binary size for `HUBSchedulerModule`, `HUBPaymentsModule`, etc. Best practice (Firebase, AWS, Apollo) is one library product per domain: `NorbixDatabase`, `NorbixFiles`, `NorbixAuth`, with a thin `NorbixCore` shared transport.

### 5. Use Swift naming conventions, not snake_case

`ApiNamespace.access_token` and `HubNamespace.access_token` / `HubNamespace.internal_` (`Sources/NorbixSwift/API/ApiNamespace.swift` line 4, `Sources/NorbixSwift/Hub/HubNamespace.swift` lines 4, 13) violate Swift API Design Guidelines. Should be `accessToken` and `internalModule` (or rename to avoid the `internal` keyword clash entirely). Also, type prefixes `APIChatModule`, `HUBFilesModule` are Objective-C era; Swift uses module namespaces.

### 6. Make the entry point match the user's mental model: `db.findAll()`, `files.download()`

Today you write:

```swift
norbix.api.database.find(["collectionName": "orders", "take": 20])
```

Best-in-class would be:

```swift
let orders = try await norbix.db("orders").findAll(take: 20)
// or
try await norbix.files.download(id: "f_123", to: localURL)
try await norbix.code.execute(...)
```

The current API is a thin auto-generated transport wrapper; it does not feel like a Swift library, it feels like a JSON-RPC client.

### 7. Fix the auth precedence bug / contradictory docs

README says "If both set, bearer token is preferred." In `Transport.send` (lines ~95-100):

```swift
let token = bearerToken ?? config.bearerToken ?? config.apiKey
```

This is correct. However `Norbix.login(...)` (`Sources/NorbixSwift/Core/Norbix.swift` lines 61-78) writes `transport.config.bearerToken = token` *without* a thread-safe mechanism. `Transport.config` is a public mutable struct on a class with no lock. On iOS, two concurrent calls to `login` and `setApiKey` can race. Make `Transport` an `actor`, or wrap `config` access in a lock.

### 8. `Norbix` is a `final class` but mutable — should be an `actor` or use `Sendable` properly

`Norbix` exposes `transport` publicly and lets callers mutate `config` from anywhere. With Swift 6 concurrency this will warn/fail. Recommend: `public actor Norbix` or make `Transport` an actor and route mutation through `@MainActor` setters.

### 9. Replace `precondition` with throwing init and structured errors

`Sources/NorbixSwift/Core/Norbix.swift` line 27: `precondition(resolvedProjectId != nil, ...)` will crash the host app in production. A library should never crash its caller. Use `init(...) throws` and throw `NorbixError(code: "NORBIX_CONFIG_INVALID")`.

### 10. Improve error type — `details: [String: Any]` is not `Sendable`/`Equatable`

`Sources/NorbixSwift/Core/NorbixError.swift` uses `[String: Any]`. Cannot be tested with `XCTAssertEqual`, cannot cross actor boundaries cleanly. Use a typed `NorbixErrorDetails: Codable, Sendable` or at least `[String: AnyCodable]`.

### 11. Response is `Any?` — force-cast hell at call sites

README example:

```swift
if let payload = response as? [String: Any] {
    print("orders response:", payload)
}
```

This is exactly what users hate. Add generic typed methods:

```swift
public func find<T: Decodable>(_ collection: String, as: T.Type) async throws -> [T]
```

### 12. Logging / observability hooks are missing

There is no `URLProtocol` interception point, no request/response logger, no metrics hook. Production iOS apps need this. Add a `NorbixLogger` protocol or `RequestInterceptor` chain (see Alamofire, URLSession's `URLProtocol`).

### 13. Retry, rate-limit, idempotency keys

`Transport.send` has no retry on 5xx/429, no `Retry-After` honoring, no idempotency-key support on `POST`. For mobile networks this is a must.

### 14. No streaming support

For `chat` (LLM streaming) and `files.download` (large blobs), the SDK uses `URLSession.data(for:)` which buffers the whole body in memory (`URLSessionHTTPExecutor.execute`, lines ~58-65). Use `URLSession.bytes(for:)` for streaming and add an upload variant with `multipart/form-data`.

### 15. No file upload helper

`HUBFilesModule` exposes only triggers/integrations endpoints. There is no `files.upload(localURL:)` or `files.download(id:, to:)`. This is the most-requested mobile SDK helper and it is missing.

### 16. The `JSON` typealias leaks globally and `@_exported import Foundation` is risky

`Sources/NorbixSwift/NorbixSwift.swift`:

```swift
@_exported import Foundation
public typealias JSON = [String: Any]
```

`@_exported` is an underscored (unstable) attribute and should not be in a public SDK. `JSON` is a too-generic name to take in the global namespace — name it `NorbixJSON` or remove it entirely once typed models land.

### 17. `Package.swift` should declare `swiftLanguageVersions` and Linux/visionOS/tvOS support

Currently iOS 14 + macOS 12. Modern SDKs ship Linux (server-side Swift), tvOS, watchOS, visionOS. The HTTP transport is pure URLSession; supporting all platforms is a one-line change.

### 18. No `NorbixClientProtocol` for testability

`Norbix` is a concrete `final class`. Consumers cannot easily mock it for their own unit tests without depending on the SDK's `MockHTTPExecutor`. Extract `protocol NorbixClient` so app developers can substitute fakes.

### 19. Tests are very thin

`Tests/NorbixSwiftTests/NorbixClientTests.swift` has 2 tests covering auth state and login. There is no test for: env-var resolution, path-token substitution edge cases, query string array encoding, retry, account-scope enforcement error, malformed JSON response. The per-module tests appear to exist but should be verified that they are not just smoke tests of the transport mock.

### 20. Documentation gap: no DocC, no symbol-level comments

None of the `public` functions have `///` doc comments. Xcode's QuickHelp will be empty. For a public SDK in 2026, DocC + hosted documentation (e.g., on Swift Package Index) is table-stakes.

---

## Summary

The plan to ship a Swift SDK that mirrors API and Hub endpoints is sound, and the **transport layer** is well-organized: `HTTPExecuting` protocol, `Transport` with config, `URLSessionHTTPExecutor` default, mockable executor for tests. That is a solid foundation. CI, semantic-release, SwiftPM packaging, and platform pinning are all correct.

However, in its current form **this is a generated JSON-RPC wrapper, not a Swift SDK.** Compared to libraries the user asked me to benchmark against (Stripe-iOS, Supabase-swift, Firebase, AWS SDK for Swift, Apollo iOS), the gap is large in three areas: type safety, modular imports, and config UX.

### Config UX

**The good:** env vars *are* read — `NORBIX_PROJECT_ID`, `NORBIX_API_KEY`, `NORBIX_ACCOUNT_ID`, `NORBIX_API_URL`, `NORBIX_HUB_URL`, `NORBIX_API_VERSION`, `NORBIX_HUB_VERSION` (`Sources/NorbixSwift/Core/Norbix.swift` lines 24-37). So scripts can run without manual init, which is good.

**The bad:**

- The lookup is buried inside `Norbix.init`. There is no `NorbixConfig.fromEnvironment()` factory you can inspect, log, or override piece by piece.
- `precondition(resolvedProjectId != nil, ...)` (line 27) will **crash** the app if env var is missing. A library must never call `precondition` on user input — it must `throw`.
- There is no support for `.env` files (common in Vapor / server-side Swift), no `Info.plist` resolver, no Keychain resolver, no custom `ConfigProvider` protocol.
- The README says "If both [api key and bearer] set, bearer token is preferred" — verified correct in `Transport.send` (`token = bearerToken ?? config.bearerToken ?? config.apiKey`), but this precedence is invisible from the public API surface; a `client.authMode` getter would help debugging.

**What I would expect instead:**

```swift
// 1. Auto from env, throws on misconfig
let norbix = try Norbix(config: .fromEnvironment())

// 2. Explicit, fluent
let norbix = try Norbix(config: NorbixConfig(
    projectId: "proj_123",
    auth: .apiKey("sk_live_xxx"),
    region: .production
))

// 3. Override one thing
var cfg = try NorbixConfig.fromEnvironment()
cfg.timeout = 60
let norbix = try Norbix(config: cfg)
```

### Usage UX (`db.findAll()`, `files.download()`, `code.execute()`)

The current shape forces:

```swift
let r = try await norbix.api.database.find([
    "collectionName": "orders",
    "take": 20,
    "skip": 0,
])
if let payload = r as? [String: Any], let items = payload["items"] as? [[String: Any]] {
    // ... cast every field by hand
}
```

What best libraries do:

```swift
import NorbixDatabase  // single-domain import

let orders: [Order] = try await norbix.db("orders")
    .find()
    .take(20)
    .skip(0)
    .decode(as: Order.self)

try await norbix.files.upload(fileURL, to: "uploads/")
try await norbix.files.download(id: "f_123", to: localURL)
let result = try await norbix.code.execute(language: .python, source: "...")
```

To get there from the current code:

- Split `NorbixSwift` into `NorbixCore`, `NorbixDatabase` (`Sources/NorbixSwift/API/APIDatabaseModule.swift`), `NorbixFiles` (`Sources/NorbixSwift/Hub/HUBFilesModule.swift`), `NorbixAI`, `NorbixAuth`, etc. Update `Package.swift` (currently lines 10-12 expose only one product).
- Generate typed Swift models from the OpenAPI spec into each module (the `references/api.dtos.swift` and `references/hub.dtos.swift` files suggest the DTOs already exist — they should be wired into the modules instead of `[String: Any]`).
- Expose a hand-written ergonomic facade per module on top of the generated transport. The generated layer stays as a fallback for advanced users.

### Other architectural concerns worth flagging now

- **Concurrency safety.** `Norbix.transport` is publicly mutable (`Sources/NorbixSwift/Core/Norbix.swift` line 9: `public private(set) var transport: Transport`) and `Transport.config` is a `var` (`Sources/NorbixSwift/Core/Transport.swift`). `setBearerToken`, `setApiKey`, `setScope`, `login` all mutate it without synchronization. With Swift 6 strict concurrency this will not compile. Recommend: `public actor Norbix` or wrap `Transport` as an `actor`.
- **Naming.** `access_token` (snake_case property) in `ApiNamespace.swift` line 4 and `HubNamespace.swift` line 4, plus `internal_` in `HubNamespace.swift` line 13 — both violate Swift API Design Guidelines. The `internal_` is hiding a real problem: a module called `internal` is a reserved keyword in Swift; rename the public surface to something semantic like `platform` or `system`.
- **Error type.** `NorbixError.details: [String: Any]` (`Sources/NorbixSwift/Core/NorbixError.swift`) breaks `Equatable`, `Sendable`, and `Codable`. Replace with `[String: AnyCodable]` or a typed payload.
- **Path token lookup is brittle.** `Transport.buildUrlAndBody` does case-insensitive dictionary lookup for `{taxonomyName}`, `{collectionName}`, `{id}`, `{Id}` (mixed case in `HUBFilesModule.swift` — `{Id}` for delete vs `{id}` for get). This is a real footgun: a typo in the dictionary key produces a runtime `NORBIX_MISSING_PATH_PARAM` instead of a compile error. Make these explicit Swift parameters.
- **No DocC, no inline `///` docs**, and `JSON` typealias plus `@_exported import Foundation` should be removed from the public surface (`Sources/NorbixSwift/NorbixSwift.swift`).

### Bottom line

- Ship-readiness as an **internal/beta SDK: 6/10** — the transport works, tests run, CI is in place.
- Ship-readiness as a **public Swift SDK developers will love: 3/10** — fix typed models, modular products, throwing config, and an ergonomic facade *before* 1.0, otherwise every API change will be a breaking change for users who built around `[String: Any]` dictionaries.

The single highest-leverage change is **#1 (typed models) combined with #4 (split products)**. Everything else is much easier to add once those two land.

---

## What shipped (refactor changelog)

This refactor is a **green-field, breaking-change** rewrite of the package layout. Every consumer must migrate.

### New SwiftPM layout — addresses #4

`Package.swift` now exposes three products instead of one:

| Product       | Path                  | Purpose                                                |
|---------------|-----------------------|--------------------------------------------------------|
| `NorbixCore`  | `Sources/NorbixCore`  | Shared transport, config, errors. Imported transitively. |
| `NorbixApi`   | `Sources/NorbixApi`   | Project-scoped data plane (`https://api.norbix.ai`).   |
| `NorbixHub`   | `Sources/NorbixHub`   | Project / account configuration plane (`https://hub.norbix.ai`). |

Each plane is its own Swift module — apps import only what they use:

```swift
.product(name: "NorbixApi", package: "norbix-swift")
// or
.product(name: "NorbixHub", package: "norbix-swift")
```

Platforms expanded to iOS 14, macOS 12, tvOS 14, watchOS 7, visionOS 1.

### Flat client API — addresses #6

The old `client.api.database.find(...)` / `client.hub.files.getFiles...` shape is gone. Each client *is* the plane, so modules sit directly on the client:

```swift
import NorbixApi

let client = try NorbixApiClient(projectId: "proj_123", apiKey: "sk_live_xxx")
try await client.database.find(["collectionName": "orders"])
try await client.membership.getCurrentUser()
```

```swift
import NorbixHub

let hub = try NorbixHubClient(projectId: "proj_123", apiKey: "sk_live_xxx", accountId: "acc_456")
try await hub.files.getFilesIntegrations()
try await hub.account.getAccount()
```

Module classes were renamed: `APIDatabaseModule` → `DatabaseModule`, `HUBFilesModule` → `FilesModule`, `HUBInternalModule` → `PlatformModule` (the property is `hub.platform`). Same names can coexist across `NorbixApi` and `NorbixHub` because they're in different Swift modules.

### Default URLs + self-hosted override — new requirement

`NorbixDefaults` (in `Sources/NorbixCore/NorbixConfig.swift`) holds:

- `apiBaseUrl = "https://api.norbix.ai"`
- `hubBaseUrl = "https://hub.norbix.ai"`

Override per client for self-hosted or local dev:

```swift
let client = try NorbixApiClient(
    projectId: "proj_123",
    apiKey: "sk_live_xxx",
    baseUrl: "https://api.norbix.isidos.lt"
)

let hub = try NorbixHubClient(
    projectId: "proj_123",
    apiKey: "sk_live_xxx",
    baseUrl: "http://localhost:5000"
)
```

`NORBIX_API_URL` and `NORBIX_HUB_URL` env vars still take precedence when no `baseUrl` is passed.

### Throwing init + structured config errors — addresses #3 and #9

`precondition(resolvedProjectId != nil, ...)` (the call that crashed the host app) is gone. The new initializers are `throws` and surface `NorbixError(code: "NORBIX_CONFIG_INVALID")`:

```swift
do {
    let client = try NorbixApiClient() // missing projectId
} catch let error as NorbixError where error.code == "NORBIX_CONFIG_INVALID" {
    // recover gracefully
}
```

`NorbixConfig` is now a first-class struct with a `fromEnvironment(target:)` factory that returns a value you can inspect, log, or mutate before constructing a client. See `Sources/NorbixCore/NorbixConfig.swift`.

### Cleaner auth model — addresses #7 (partial)

Replaced the dual `apiKey` + `bearerToken` mutable fields with a single `NorbixAuth` enum:

```swift
public enum NorbixAuth: Sendable {
    case apiKey(String)
    case bearerToken(String)
    case unauthenticated
}
```

Bearer-wins-over-apiKey precedence is now a property of the type, not an `??` chain buried in `Transport.send`. `client.login(...)` flips the auth case to `.bearerToken(...)`. `setApiKey(nil)` / `setBearerToken(nil)` flip back to `.unauthenticated`.

### Tests reorganized — addresses #19 (partial)

Split into three test targets:

- `Tests/NorbixCoreTests/NorbixConfigTests.swift` — covers env-var resolution, bearer-wins precedence, missing projectId, custom base URL.
- `Tests/NorbixApiTests/` — `NorbixApiClientTests` plus one surface test per module. Verifies default `https://api.norbix.ai`, custom `baseUrl`, throwing init.
- `Tests/NorbixHubTests/` — `NorbixHubClientTests` plus one surface test per module. Verifies default `https://hub.norbix.ai`, `http://localhost:5000` override.

### README rewritten

`README.md` reflects the new dual-import flow, self-hosted examples, and the env-var table.

---

## Round 2 changes (typed layer + concurrency + cleanups)

### #3 quick cleanups — done

- **`apikeys → apiKeys`.** Renamed the property on both `NorbixApiClient` and `NorbixHubClient`, the class to `ApiKeysModule`, the file to `ApiKeysModule.swift`. (`Sources/NorbixApi/Modules/ApiKeysModule.swift`, `Sources/NorbixHub/Modules/ApiKeysModule.swift`.)
- **`NorbixError` is now `Sendable` and `Equatable`.** `details` was `[String: Any]` (not Sendable, not testable with `XCTAssertEqual`). Now `details: [String: String]` plus a new `rawBody: String?` field that carries the full untouched response body for callers who need it. A new helper `NorbixError.fromHTTPResponse(status:data:)` builds the error from an HTTP failure response and is used by `Transport`. (`Sources/NorbixCore/NorbixError.swift`.)
- **`swiftLanguageVersions: [.v5]`** declared on every target in `Package.swift`.

### #4 concurrency safety — done (lock-based, not actor)

`Transport` is now `@unchecked Sendable` with an internal `NSLock` protecting the `config` storage. The choice **not** to use `actor` was deliberate:

- `actor` would force every public client setter — `setApiKey`, `setBearerToken`, `setScope`, `logout`, `isAuthenticated` — to become `async`. That's friction every consumer pays.
- The lock-based approach is what `URLSession`, Stripe-iOS, and Firebase do internally for the same reason.

`Transport.send(...)` now takes one consistent **snapshot** of the config at the start of each request (`let snapshot = self.config`) so a request can't see a half-mutated config when another thread races a `setApiKey` call.

`HTTPExecuting` protocol now requires `Sendable` conformance. All `*Module` classes are `: Sendable`. `NorbixApiClient` and `NorbixHubClient` are `: Sendable`.

### #1 typed Codable layer — done (partial, generic-decoder pattern)

**The big architectural decision: don't depend on ServiceStack.** `references/api.dtos.swift` and `references/hub.dtos.swift` are ServiceStack-generated (1,260 types total) and `import ServiceStack`. Adding ServiceStack as a dependency would contradict the same advice given in the logging discussion (size, security surface, version coupling). Instead the SDK ships a small generic Codable layer that lets users decode into **their own** types.

#### `NorbixCore` — new shared types (`Sources/NorbixCore/Responses.swift`)

```swift
public struct AuthResponse: Codable, Sendable, Equatable {
    public let bearerToken: String
    public let userId: String?
    public let email: String?
    public let displayName: String?
    public let expiration: Date?
}

public struct Page<Item: Codable & Sendable>: Codable, Sendable {
    public let items: [Item]
    public let total: Int?
    public let take: Int?
    public let skip: Int?
}

public struct EmptyResponse: Codable, Sendable, Equatable { /* ... */ }

public extension JSONDecoder {
    /// ISO-8601 with optional fractional seconds, default key strategy.
    static var norbixDefault: JSONDecoder { /* ... */ }
}
```

#### `NorbixCore.Transport` — generic typed `send`

```swift
public func send<T: Decodable>(
    path: String, method: String, request: [String: Any] = [:],
    scope: NorbixScope = .project, timeout: TimeInterval? = nil,
    bearerToken: String? = nil, as type: T.Type,
    decoder: JSONDecoder = .norbixDefault
) async throws -> T
```

`Transport` now factors a private `performRequest(...) -> Data` helper used by both the dict-based `send -> Any?` and the typed `send<T>`. Decode errors surface as `NorbixError(code: "NORBIX_DECODE_ERROR", rawBody: ...)` so callers see exactly what came back.

#### Demo typed overlays (`Sources/NorbixApi/Modules/*+Typed.swift`)

```swift
// Database
let page: Page<Order> = try await client.database.find(
    collection: "orders",
    query: ["take": 20, "skip": 0],
    as: Order.self
)
let order: Order = try await client.database.findOne(
    collection: "orders", id: "o1", as: Order.self
)

// Membership
let user: User = try await client.membership.getUser(id: "u_123", as: User.self)
let users: Page<User> = try await client.membership.getUsers(as: User.self)
```

#### Login is now typed

`client.login(...)` and `hub.login(...)` return `AuthResponse` instead of `[String: Any]`. The dict-returning version is gone. (Green-field, breaking change, per project decision.)

The dict-based methods on every other module are unchanged — users opt in to typing per call site by picking the `as:`-suffixed overloads.

### Tests added in round 2

- `Tests/NorbixApiTests/TypedDecodeTests.swift` — three new tests: typed `find` returns a typed `Page<Order>`, typed `findOne` returns a typed `Order`, decode error surfaces as `NorbixError(code: "NORBIX_DECODE_ERROR")` with `rawBody` populated.
- `Tests/NorbixApiTests/NorbixApiClientTests.swift` — `testLoginStoresBearerToken` updated to assert on the new `AuthResponse.bearerToken` instead of `result["bearerToken"]`.
- `Tests/NorbixApiTests/ApiKeysModuleTests.swift` and `Tests/NorbixHubTests/ApiKeysModuleTests.swift` — track the renamed module/property.

---

## Round 3 changes (files / protocols / logging / retry)

### #15 Files helpers — done (sign / download / list / getInfo, **no upload**)

The user clarified: file uploads go directly to the cloud provider, the SDK never relays bytes. So `FilesModule` (on the API plane, `Sources/NorbixApi/Modules/FilesModule.swift`) ships these four operations:

```swift
import NorbixApi
import NorbixCore

let client = try NorbixApiClient(projectId: "p", apiKey: "k")

// List with pagination (typed)
let page: Page<FileInfo> = try await client.files.list(take: 50)

// Metadata for one file (typed)
let info: FileInfo = try await client.files.getInfo(id: "f_123")

// Get a pre-signed upload URL — caller PUTs bytes there directly
let signed: SignedUploadResponse = try await client.files.sign(
    originalFileName: "invoice.pdf",
    contentType: "application/pdf",
    sizeBytes: 12_345
)

// Download to memory or to a file
let bytes: Data = try await client.files.download(id: "f_123")
try await client.files.download(
    id: "f_123",
    to: URL.temporaryDirectory.appending(path: "invoice.pdf")
)
```

Supporting changes:

- New `Transport.downloadData(...)` that returns raw `Data` without JSON parsing — used by the `download(id:)` helper. `Sources/NorbixCore/Transport.swift`.
- New response models in `Sources/NorbixCore/Responses.swift`: `FileInfo` (`id`, `originalFileName`, `extension`, `sizeBytes`, `storedFileName`, `contentType`, `createdOn`) and `SignedUploadResponse` (`url`, `method`, `headers`, `fields`, `expiresAt`, `fileId`).
- `client.files` wired into `NorbixApiClient`.
- The dict-based fallbacks (`list(_:)`, `getInfo(id:)`, `sign(_:)`) live alongside the typed versions for advanced callers.

### #18 Client protocols — done

`NorbixApiClientType` and `NorbixHubClientType` (in their respective modules) capture every public surface (modules + auth helpers + `isAuthenticated`). Apps can depend on the protocol and inject a fake without `@testable import`:

```swift
final class MyOrdersService {
    private let norbix: NorbixApiClientType
    init(norbix: NorbixApiClientType) { self.norbix = norbix }
}
```

The concrete classes conform via a one-line extension at the bottom of each protocol file.

### #12 Logger hooks — done

New file `Sources/NorbixCore/NorbixLogger.swift` with:

- `NorbixLogLevel` (`debug`, `info`, `warning`, `error`).
- `NorbixLogEvent` (level, message, metadata, timestamp) — structured.
- `NorbixLogger` protocol (`Sendable`).
- `OSLogger` — default implementation using `os.Logger`. **Zero dependencies.** Maps levels to `debug` / `info` / `warning` / `error` on the unified logging system.
- `NoopLogger` — drops everything. Useful in tests.
- `NorbixLogRedaction` — header names (`authorization`, `x-api-key`, `cookie`, …) and body keys (`password`, `apikey`, `bearertoken`, `secret`, `refreshtoken`, …) that are always replaced with `<redacted>` before any logging.

Behavior, after the user's question about whether to default-on:

| Event                        | Always logged | Verbose only |
|------------------------------|:-------------:|:------------:|
| Client initialized           |       ✓       |              |
| Pre-request (`→ METHOD URL`) |               |       ✓      |
| Post-request success         |               |       ✓      |
| HTTP error                   |       ✓       |              |
| Network error                |       ✓       |              |
| Retry attempt                |       ✓       |              |

The `Authorization` header value never reaches the logger. Body fields whose key matches the redaction list are replaced before being serialized into log metadata. Decode errors include the raw response body in `NorbixError.rawBody` but not in the log line.

`verbose` is configured via:

```swift
let client = try NorbixApiClient(projectId: "p", apiKey: "k", verbose: true)
// or
NORBIX_VERBOSE=1
```

Default is **OFF** — verbose-on-by-default would leak request bodies (passwords, PII) into system logs and run afoul of Apple's privacy guidance.

### #13 Retry + idempotency — done

New file `Sources/NorbixCore/RetryPolicy.swift` with `RetryPolicy(maxRetries:, baseDelay:, maxDelay:, retryableStatusCodes:, retryableMethods:)`. Defaults:

- `RetryPolicy.standard` — 3 retries, 250 ms base, 5 s cap, retries `429` + `500..<600`, all methods retryable (because of auto-idempotency, see below).
- `RetryPolicy.none` — no retries (use in tests).

Backoff is **exponential with full jitter** (`Double.random(in: 0...capped)`) per AWS architecture guidance. If the server returns a `Retry-After` header (numeric seconds), it overrides the computed delay (capped at `maxDelay`).

Per-request flow on a retryable failure:

```
attempt 1 → 429 with Retry-After: 0.5
   sleep 0.5s, log "retrying #1 GET ..."
attempt 2 → 200 OK
```

#### Idempotency keys

Every `POST` / `PUT` / `PATCH` / `DELETE` automatically gets an `Idempotency-Key: <UUID>` header **unless** the caller provided one already (via `defaultHeaders`). This means a retried POST is safe — the server can dedupe.

`GET` / `HEAD` / `OPTIONS` don't get an idempotency key (they're already idempotent by spec).

### Tests added in round 3

- `Tests/NorbixApiTests/FilesModuleTests.swift` — typed `list`, `getInfo`, `sign`, `download(id:)`, `download(id:to:)`.
- `Tests/NorbixApiTests/RetryAndIdempotencyTests.swift` — retries on 5xx and succeeds; gives up after `maxRetries`; honors `Retry-After`; does **not** retry 4xx; idempotency key auto-added on POST; not added on GET.
- `Tests/NorbixCoreTests/NorbixLoggerTests.swift` — body-key redaction; header-name redaction; "client initialized" event always emitted even with `verbose: false`; `NoopLogger` drops events.

`MockHTTPExecutor` upgraded with a `responseQueue` for tests that need different responses on consecutive calls (retry tests) and `capturedRequests` for assertions about retry count and idempotency keys.

---

## Still open (after round 3)

- **#14 streaming** — Long-form chat (LLM streaming) and large file downloads still go through `URLSession.data(for:)`, which buffers the whole body. The streaming path needs `URLSession.bytes(for:)` plus a `streamChat(...)` helper on the chat module and an `AsyncSequence`-returning download helper.
- **#17 Linux** — Pure-URLSession backend is Apple-only; Linux support needs a swift-nio HTTP backend. Not a blocker for v1.
- **Typed coverage of all modules** — `database.find/findOne`, `membership.getUser/getUsers`, and the four `files.*` methods have typed overloads. The remaining ~17 modules still expose only the dict methods. Mechanical work, ideal for the code-gen step that already produces the dict-based modules.
- **#19, #20** — Per-method DocC documentation; broader integration tests (e.g. against a stub server).
- **Telemetry / interceptor chain** — Logger covers most observability needs, but a separate `RequestInterceptor` chain (sign requests, tag with trace IDs, etc.) is sometimes wanted. Nice-to-have, not required for v1.
