# Norbix Swift SDK docs

- [API reference](./api/_index.md)
- [Hub reference](./hub/_index.md)

## Practical usage snippets

### Service-to-service call

```swift
import NorbixSwift

let client = Norbix(apiKey: "sk_live_xxx", projectId: "proj_123")
let response = try await client.api.database.find(["collectionName": "orders", "take": 10])
print(response)
```

### User login flow

```swift
import NorbixSwift

let client = Norbix(projectId: "proj_123")
_ = try await client.login(.init(userName: "alice@team.io", password: "secret"))
let profile = try await client.api.membership.getCurrentUser([:])
print(profile)
```

### Hub call (token only)

Hub calls, the account ones included, work with a token only — no `accountId`.
`hub.account.createAccount`, `createTeamMemberFromInvitation`,
`getAccountRegions` (also `hub.regions.getAccountRegions`) and `verifyAccount`
need no token at all; `verifyAccount` takes `accountId` and `token` in the
request (query), from the verification email link.

```swift
import NorbixSwift

let client = Norbix(apiKey: "sk_live_xxx", projectId: "proj_123")
let schemas = try await client.hub.database.getDatabaseSchemas([:])
let profile = try await client.hub.account.getAccountProfile()
print(schemas, profile)
```
