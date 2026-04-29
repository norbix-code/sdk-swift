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

### Account-scoped Hub call

```swift
import NorbixSwift

let client = Norbix(apiKey: "sk_live_xxx", projectId: "proj_123", accountId: "acc_456")
let schemas = try await client.hub.database.getDatabaseSchemas([:])
print(schemas)
```
