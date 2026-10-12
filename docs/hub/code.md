# HUB · Code

Code integrations (the credentials of your own cloud: AWS Lambda, Azure
Functions, Google Cloud Functions), the marketplace, and cloud functions.
Norbix does not host code: a trigger's `Code` action, a scheduler
`CodeFunctionalCall` task or `invokeCodeFunction` runs a function in your
cloud and sends it one event envelope (`CodeFunctionEventDto` in
`references/hub.dtos.swift`). Path ids go in the request dictionary (keys are
matched to the `{…}` tokens case-insensitively); the other keys are the query
for `GET` / `DELETE` and the JSON body otherwise.

| Method | Verb | Path | Scope |
| --- | --- | --- | --- |
| `enableCode` | `PUT` | `/{version}/code/enable` | `project` |
| `disableCode` | `PUT` | `/{version}/code/disable` | `project` |
| `getCodeIntegrations` | `GET` | `/{version}/code/integrations` | `project` |
| `getCodeIntegration` | `GET` | `/{version}/code/integrations/{id}` | `project` |
| `saveCodeIntegration` | `POST` | `/{version}/code/integrations` | `project` |
| `testCodeIntegration` | `POST` | `/{version}/code/integrations/test` | `project` |
| `confirmCodeIntegrationHumanDelivery` | `POST` | `/{version}/code/integrations/confirm-human-delivery` | `project` |
| `setCodeIntegrationAsDefault` | `PUT` | `/{version}/code/integrations/{Id}/default` | `project` |
| `deleteCodeIntegration` | `DELETE` | `/{version}/code/integrations/{Id}` | `project` |
| `enableCodeIntegration` | `PUT` | `/{version}/code/integrations/{Id}/enable` | `project` |
| `disableCodeIntegration` | `PUT` | `/{version}/code/integrations/{Id}/disable` | `project` |
| `getMarketplaceListings` | `GET` | `/{version}/code/marketplace/listings` | `project` |
| `getMarketplaceListing` | `GET` | `/{version}/code/marketplace/listings/{ListingViewId}` | `project` |
| `getMarketplaceListingFunctionTokens` | `GET` | `/{version}/code/marketplace/listings/{ListingViewId}/functions/{FunctionKey}/tokens` | `project` |
| `getMarketplaceIntegrations` | `GET` | `/{version}/code/marketplace/integrations` | `project` |
| `getMarketplaceIntegration` | `GET` | `/{version}/code/marketplace/integrations/{IntegrationViewId}` | `project` |
| `saveMarketplaceIntegration` | `POST` | `/{version}/code/marketplace/integrations` | `project` |
| `deleteMarketplaceIntegration` | `DELETE` | `/{version}/code/marketplace/integrations/{IntegrationViewId}` | `project` |
| `enableMarketplaceIntegration` | `POST` | `/{version}/code/marketplace/integrations/{IntegrationViewId}/enable` | `project` |
| `disableMarketplaceIntegration` | `POST` | `/{version}/code/marketplace/integrations/{IntegrationViewId}/disable` | `project` |
| `testMarketplaceIntegration` | `POST` | `/{version}/code/marketplace/integrations/{IntegrationViewId}/test` | `project` |
| `replaceMarketplaceIntegrationSecrets` | `PUT` | `/{version}/code/marketplace/integrations/{IntegrationViewId}/secrets` | `project` |
| `revealMarketplaceIntegrationSecrets` | `POST` | `/{version}/code/marketplace/integrations/{IntegrationViewId}/secrets/reveal` | `project` |
| `setMarketplaceIntegrationTokenMappings` | `PUT` | `/{version}/code/marketplace/integrations/{IntegrationViewId}/token-mappings` | `project` |
| `getMarketplaceFunctionCatalog` | `GET` | `/{version}/code/marketplace/integrations/{IntegrationViewId}/catalog` | `project` |
| `getMarketplaceFunctions` | `GET` | `/{version}/code/marketplace/integrations/{IntegrationViewId}/functions` | `project` |
| `getMarketplaceFunction` | `GET` | `/{version}/code/marketplace/integrations/{IntegrationViewId}/functions/{FunctionViewId}` | `project` |
| `saveMarketplaceFunction` | `POST` | `/{version}/code/marketplace/integrations/{IntegrationViewId}/functions` | `project` |
| `deleteMarketplaceFunction` | `DELETE` | `/{version}/code/marketplace/integrations/{IntegrationViewId}/functions/{FunctionViewId}` | `project` |
| `enableMarketplaceFunction` | `POST` | `/{version}/code/marketplace/integrations/{IntegrationViewId}/functions/{FunctionViewId}/enable` | `project` |
| `disableMarketplaceFunction` | `POST` | `/{version}/code/marketplace/integrations/{IntegrationViewId}/functions/{FunctionViewId}/disable` | `project` |
| `getMarketplaceFunctionTokens` | `GET` | `/{version}/code/marketplace/integrations/{IntegrationViewId}/functions/{FunctionViewId}/tokens` | `project` |
| `invokeMarketplaceFunction` | `POST` | `/{version}/code/marketplace/functions/{FunctionViewId}/invoke` | `project` |
| `getCodeFunctions` | `GET` | `/{version}/code/functions` | `project` |
| `getCodeFunctionQualifiers` | `GET` | `/{version}/code/functions/qualifiers` | `project` |
| `invokeCodeFunction` | `POST` | `/{version}/code/functions/invoke` | `project` |
| `getCodeFunctionEventSample` | `GET` | `/{version}/code/functions/event-sample` | `project` |
| `getCodeFunctionRuns` | `GET` | `/{version}/code/functions/runs` | `project` |

## Cloud functions

The five `code/functions` routes of the gateway contract `Code.Functions.md`
(§3.3, §3.4, §5.1); every route of the module is asserted (verb, path; the
five also query / body) in `Tests/NorbixHubTests/CodeModuleTests.swift`.

| Method | Parameters |
| --- | --- |
| `getCodeFunctions` | query: `integrationId` (required), `prefix`, `tag` (`key` or `key=value`), `pageSize`, `startingAfter`, `endingBefore` — a live listing from the provider |
| `getCodeFunctionQualifiers` | query: `integrationId`, `functionId` — the aliases and versions |
| `invokeCodeFunction` | body: `functionRef` `{integrationId, functionId, qualifier?}`, `payload?`, `invocationType` (`Sync` / `Async`), `runAsUserId?`, `config?` → `{statusCode, output, durationMs, requestId?, logs?}` |
| `getCodeFunctionEventSample` | query: `source` (`database` · `membership` · `files` · `payments` · `ai` · `scheduler` · `manual`), `event?`, `schemaId?` — a sample envelope for a local run |
| `getCodeFunctionRuns` | query: exactly one of `triggerId` / `taskId`, `limit` (1–50, default 20) — the last runs, newest first |

```swift
let functions = try await hub.code.getCodeFunctions(["integrationId": "int_1", "prefix": "orders-"])
let result = try await hub.code.invokeCodeFunction([
    "functionRef": ["integrationId": "int_1", "functionId": "orders-on-update", "qualifier": "prod"],
    "payload": ["orderId": "6ac54a59212c29912eaddd81", "dryRun": true],
    "invocationType": "Sync",
])
let runs = try await hub.code.getCodeFunctionRuns(["triggerId": "trg_1", "limit": 5])
```

The envelope the function receives: `event`, `source`, `context`
(`projectId`, `environment`, `hubUrl`, `apiUrl`, `runAs.accessToken` — a
15-minute token for the run-as user) and `data` with one slot per source
(`database`, `user`, `file`, `payment`, `ai`, `task`, `payload`).
