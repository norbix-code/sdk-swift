# HUB · Logs

| Method | Verb | Path | Scope |
| --- | --- | --- | --- |
| `disableLogging` | `PUT` | `/{version}/logs/disable` | `project` |
| `enableLogging` | `PUT` | `/{version}/logs/enable` | `project` |
| `deleteLoggingIntegration` | `DELETE` | `/{version}/logs/integrations/{Id}` | `project` |
| `disableLoggingIntegration` | `PUT` | `/{version}/logs/integrations/{Id}/disable` | `project` |
| `enableLoggingIntegration` | `PUT` | `/{version}/logs/integrations/{Id}/enable` | `project` |
| `getLoggingIntegration` | `GET` | `/{version}/logs/integrations/{id}` | `project` |
| `getLoggingIntegrations` | `GET` | `/{version}/logs/integrations` | `project` |
| `saveLoggingIntegration` | `POST` | `/{version}/logs/integrations` | `project` |
| `testLoggingIntegration` | `POST` | `/{version}/logs/integrations/test` | `project` |
| `getLogs` | `GET` | `/{version}/logs` | `project` |
| `getLog` | `GET` | `/{version}/logs/{Id}` | `project` |
| `getLogsByCorrelationId` | `GET` | `/{version}/logs/audit` | `project` |
| `cleanLogs` | `POST` | `/{version}/logs/clean` | `project` |
| `getLogSettings` | `GET` | `/{version}/logs/settings` | `project` |
| `saveLogSettings` | `POST` | `/{version}/logs/settings` | `project` |

## Reading logs

```swift
let page = try await hub.logs.getLogs([
    "level": "Error",                 // Information | Warning | Error
    "logCorrelationId": "checkout-42",
    "eventCode": "app:order:paid",
    "pageSize": 20                    // paging: startingAfter / endingBefore
]) as? [String: Any]                  // { list }
let one = try await hub.logs.getLog(["id": "6650f0c2a1b2c3d4e5f60718"])   // { item }
let trail = try await hub.logs.getLogsByCorrelationId(["targetCorrelationId": "checkout-42"])
```

Other filters: `module`, `search`, `metaKey` + `metaValue`, `fromUtc`, `toUtc`.
`cleanLogs()` deletes every entry stored in the project's Norbix Logging.
`getLogSettings()` / `saveLogSettings(_:)` read and change
`skipCloudDashboardLogs`, `skipHttpBodyMeta` and `aiChatLoggingEnabled`
(a flag not sent stays unchanged).

## Logging integrations — test after saving

Nothing is delivered to a logging integration (Datadog, AWS CloudWatch,
MongoDB, …) until its last test passed. After saving or changing one, test it:

```swift
let saved = try await hub.logs.saveLoggingIntegration(["integration": [
    "provider": "MongoDB",
    "integrationName": "Audit copy",
    "isEnabled": true,
    "connectionString": "mongodb+srv://…",
    "databaseName": "logs"            // optional
]]) as? [String: Any]
_ = try await hub.logs.testLoggingIntegration(["integrationId": saved?["id"] ?? ""])
```

Request types (`MongoDbLoggingIntegrationRequest`,
`DataDogLoggingIntegrationRequest` with its `site`,
`AwsCloudWatchLoggingIntegrationRequest`, …) are in
the [API reference](https://docs.norbix.ai/api-reference/).
