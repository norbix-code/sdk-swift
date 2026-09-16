
# sdk-swift
# NorbixSwift

[![CI](https://github.com/norbix-code/sdk-swift/actions/workflows/ci.yml/badge.svg)](https://github.com/norbix-code/sdk-swift/actions/workflows/ci.yml)
[![Release](https://img.shields.io/github/v/release/norbix-code/sdk-swift)](https://github.com/norbix-code/sdk-swift/releases)
[![Swift](https://img.shields.io/badge/swift-5.9+-orange.svg)](https://swift.org)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](./LICENSE)

Official Swift SDK for [Norbix](https://norbix.ai). The SDK ships as **two
separate libraries** that mirror the two Norbix planes:

- **`NorbixApi`** — project-scoped data operations (default `https://api.norbix.ai`)
- **`NorbixHub`** — project / account configuration operations (default `https://hub.norbix.ai`)

A small shared `NorbixCore` module holds the transport, config, and error types
both clients use.

Built for Apple platforms (iOS, macOS, tvOS, watchOS, visionOS) with standard
Swift tooling: **Swift Package Manager**, **XCTest**, GitHub Actions CI, and
semantic-release based tagging.

## Install (Swift Package Manager)

In Xcode:

1. **File -> Add Packages...**
2. Use URL: `https://github.com/norbix-code/sdk-swift`
3. Pick a version rule (recommended: Up to Next Major)
4. Add **`NorbixApi`** and/or **`NorbixHub`** to your target — only the planes
   you need.

Or in `Package.swift`:

```swift
.package(url: "https://github.com/norbix-code/sdk-swift.git", from: "0.1.0")
```

```swift
.target(
    name: "MyApp",
    dependencies: [
        .product(name: "NorbixApi", package: "sdk-swift"),
        // .product(name: "NorbixHub", package: "sdk-swift"),
    ]
)
```

## Quickstart — API

```swift
import NorbixApi

let client = try NorbixApiClient(projectId: "proj_123", apiKey: "sk_live_xxx")
let _ = try await client.database.getDatabaseSchemas()
let me = try await client.membership.getCurrentUser()
```

Login flow:

```swift
import NorbixApi
import NorbixCore

let client = try NorbixApiClient(projectId: "proj_123")
let _ = try await client.login(.init(userName: "alice@team.io", password: "secret"))
let me = try await client.membership.getCurrentUser()
```

## Quickstart — Hub

```swift
import NorbixHub

let hub = try NorbixHubClient(
    projectId: "proj_123",
    apiKey: "sk_live_xxx",
    accountId: "acc_456"
)
let account = try await hub.account.getAccount()
let integrations = try await hub.files.getFilesIntegrations()
```

## Self-hosted / on-prem deployments

Both clients accept a `baseUrl` parameter. Use it for self-hosted Norbix or
local development:

```swift
// Custom company domain
let client = try NorbixApiClient(
    projectId: "proj_123",
    apiKey: "sk_live_xxx",
    baseUrl: "https://api.norbix.isidos.lt"
)

// Local development
let hub = try NorbixHubClient(
    projectId: "proj_123",
    apiKey: "sk_live_xxx",
    baseUrl: "http://localhost:5000"
)
```

If you do not pass `baseUrl`, the SDK uses Norbix' production endpoints:
`https://api.norbix.ai` and `https://hub.norbix.ai`.

## Multi-region support

Norbix projects can live in more than one region. The SDK targets a region
by sending its code (e.g. `nb-eu-germany`) in the `nb-region` header.
There is **no default region**: when no region is configured, no header is
sent and the backend picks its own default.

### Selecting a region

Pass `region` when constructing either client:

```swift
let client = try NorbixApiClient(
    projectId: "proj_123",
    apiKey: "sk_live_xxx",
    region: "nb-eu-germany"
)

let hub = try NorbixHubClient(
    projectId: "proj_123",
    apiKey: "sk_live_xxx",
    accountId: "acc_456",
    region: "nb-eu-germany"
)
```

Or set the `NORBIX_REGION` environment variable — the convenience
initializers and `NorbixConfig.fromEnvironment` fall back to it when no
`region` argument is given:

```bash
NORBIX_REGION=nb-eu-germany
```

### Switching at runtime

Both clients expose `setRegion(_:)` and a `region` getter:

```swift
hub.setRegion("nb-eu-germany")
print(hub.region ?? "unset") // "nb-eu-germany"

hub.setRegion(nil)           // unset: no nb-region header is sent again
print(hub.region ?? "unset") // "unset"
```

Passing `nil` (or an empty string) unsets the region. Unlike `setEnv`
there is no value that means "the default region" — unset simply omits the
header.

### Per-call override

The `hub.regions` methods accept a `region:` argument that overrides the
client's region for that single request. The override affects the
`nb-region` header **only** — it never changes the request URL:

```swift
let regions = try await hub.regions.getAccountRegions([:], region: "nb-us-east")
```

### Regional base URLs

When a client uses an SDK-default base URL, configuring a region (at init
or via `setRegion`) also composes the regional endpoint by prefixing the
region code as a subdomain:

- `https://api.norbix.ai` → `https://nb-eu-germany.api.norbix.ai`
- `https://hub.norbix.ai` → `https://nb-eu-germany.hub.norbix.ai`

`setRegion(nil)` restores the default URL. A custom `baseUrl` (self-hosted
/ on-prem / local development) is **never rewritten**: the `nb-region`
header is still sent, but the URL stays exactly as you configured it.

### Managing a project's regions (Hub)

`hub.regions` wraps the regions endpoints. Both are account-scoped, so the
client needs `accountId`:

```swift
// GET /v2/account/regions — regions available to the account.
// Response carries "items"; each item has "id" (the region code,
// e.g. "nb-eu-germany"), "continent", and "name".
let available = try await hub.regions.getAccountRegions([:])

// PATCH /v2/account/projects/{projectId}/settings/regions
// Pass nil to leave a field unchanged. Empty response on success.
_ = try await hub.regions.updateProjectRegions(
    projectId: "proj_123",
    primaryRegion: "nb-eu-germany",
    additionalRegions: ["nb-us-east"]
)
```

The SDK is untyped on the wire, so region fields on other endpoints pass
straight through — for example, creating a project with a primary region:

```swift
_ = try await hub.account.createProject([
    "primaryRegion": "nb-eu-germany"
    // ...other project fields
])
```

## Real-world examples

### 1) Fetch recent orders (API)

```swift
import NorbixApi
import NorbixCore

let client = try NorbixApiClient(projectId: "proj_123", apiKey: "sk_live_xxx")

do {
    let response = try await client.database.find([
        "collectionName": "orders",
        "take": 20,
        "skip": 0,
    ])
    if let payload = response as? [String: Any] {
        print("orders response:", payload)
    }
} catch let error as NorbixError {
    print(error.code, error.status, error.message)
}
```

### 2) Login then call user endpoint (API)

```swift
import NorbixApi

let client = try NorbixApiClient(projectId: "proj_123")
let auth = try await client.login(.init(userName: "alice@team.io", password: "secret"))
print("logged in:", auth["bearerToken"] ?? "")

let me = try await client.membership.getCurrentUser()
print(me)
```

### 3) Account-scoped Hub call

```swift
import NorbixHub

let hub = try NorbixHubClient(
    projectId: "proj_123",
    apiKey: "sk_live_xxx",
    accountId: "acc_456" // required for account-scoped hub endpoints
)

let account = try await hub.account.getAccount()
print(account)
```

## Authentication

- API key mode: `apiKey` or `NORBIX_API_KEY`
- Bearer mode: `bearerToken`, `NORBIX_BEARER_TOKEN`, or `client.login(...)`
- If both set, **bearer token wins**
- If none set, the SDK throws `NORBIX_NOT_AUTHENTICATED` on the first
  authenticated call

## Environment configuration

```bash
NORBIX_PROJECT_ID=proj_123
NORBIX_API_KEY=sk_live_...
NORBIX_BEARER_TOKEN=...
NORBIX_ACCOUNT_ID=acc_456
NORBIX_API_URL=https://api.norbix.ai
NORBIX_HUB_URL=https://hub.norbix.ai
NORBIX_API_VERSION=v2
NORBIX_HUB_VERSION=v2
NORBIX_REGION=nb-eu-germany
```

You can also build a config explicitly:

```swift
import NorbixCore
import NorbixApi

let cfg = try NorbixConfig.fromEnvironment(target: .api)
let client = NorbixApiClient(config: cfg)
```

## Errors

Every failure is a `NorbixError` from `NorbixCore`:

```swift
import NorbixCore

do {
    _ = try await client.database.find(["collectionName": "orders"])
} catch let error as NorbixError {
    switch error.code {
    case "NORBIX_NOT_AUTHENTICATED":      /* re-login */ break
    case "NORBIX_ACCOUNT_SCOPE_REQUIRED": /* set accountId */ break
    case "NORBIX_NETWORK_ERROR":          /* retry */ break
    default:                              print(error.localizedDescription)
    }
}
```

## SDK maintenance

API/Hub wrappers, tests, and module docs are generated by the SDK maintenance
workflow.

## Development

```bash
swift test
swift build
```

## Release model

Push to `main`, `next`, or `beta`:

- run CI
- semantic-release calculates version from commits
- create git tag + GitHub release

Swift Package Manager consumers get new versions from git tags/releases.
