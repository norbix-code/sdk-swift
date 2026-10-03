# HUB · Account

| Method | Verb | Path | Scope |
| --- | --- | --- | --- |
| `getAccountProfile` | `GET` | `/{version}/account/profile` | `account` |
| `updateAccountProfile` | `PUT` | `/{version}/account/profile` | `account` |
| `resendAccountVerificationToken` | `GET` | `/{version}/account/verify/resend` | `account` |
| `getAccountStatus` | `GET` | `/{version}/account/status` | `account` |
| `createStripeCheckoutSession` | `POST` | `/{version}/account/stripe/create-checkout-session` | `account` |
| `getStripeBillingPortalUrl` | `POST` | `/{version}/account/stripe/get-portal-url` | `account` |
| `createTeamMemberFromInvitation` | `POST` | `/{version}/account/team/member` | `account` |
| `verifyAccount` | `GET` | `/{version}/account/verify` | `account` |
| `deleteNotificationsGroup` | `DELETE` | `/{version}/account/projects/{projectId}/notifications/settings/group` | `account` |
| `deleteNotificationsTag` | `DELETE` | `/{version}/account/projects/{projectId}/notifications/settings/tag` | `account` |
| `removeTagFromNotificationsGroup` | `DELETE` | `/{version}/account/projects/{projectId}/notifications/settings/group/tag` | `account` |
| `saveNotificationsGroup` | `POST` | `/{version}/account/projects/{projectId}/notifications/settings/group` | `account` |
| `saveNotificationsTag` | `POST` | `/{version}/account/projects/{projectId}/notifications/settings/tag` | `account` |
| `createProject` | `POST` | `/{version}/account/projects` | `account` |
| `deleteProject` | `DELETE` | `/{version}/account/projects/{projectId}` | `account` |
| `getProject` | `GET` | `/{version}/account/projects/{projectId}` | `account` |
| `getProjects` | `GET` | `/{version}/account/projects` | `account` |
| `getAccountRegions` | `GET` | `/{version}/account/regions` | `account` |
| `getProjectTokens` | `GET` | `/{version}/account/projects/{projectId}/tokens` | `account` |
| `updateProjectAccentColor` | `PATCH` | `/{version}/account/projects/{projectId}/settings/accent-color` | `account` |
| `updateProjectIcon` | `PATCH` | `/{version}/account/projects/{projectId}/settings/icon` | `account` |
| `updateProjectLogo` | `PATCH` | `/{version}/account/projects/{projectId}/settings/logo` | `account` |
| `updateProjectMainColor` | `PATCH` | `/{version}/account/projects/{projectId}/settings/main-color` | `account` |
| `updateProjectAllowedOrigins` | `PATCH` | `/{version}/account/projects/{projectId}/settings/origins` | `account` |
| `updateProjectDefaultLanguage` | `PATCH` | `/{version}/account/projects/{projectId}/settings/default-language` | `account` |
| `updateProjectDescription` | `PATCH` | `/{version}/account/projects/{projectId}/settings/description` | `account` |
| `disableProject` | `PATCH` | `/{version}/account/projects/{projectId}/disable` | `account` |
| `enableProject` | `PATCH` | `/{version}/account/projects/{projectId}/enable` | `account` |
| `updateProjectLanguages` | `PATCH` | `/{version}/account/projects/{projectId}/settings/languages` | `account` |
| `updateProjectUrl` | `PATCH` | `/{version}/account/projects/{projectId}/settings/url` | `account` |
| `updateProjectName` | `PATCH` | `/{version}/account/projects/{projectId}/settings/name` | `account` |
| `updateProjectRegions` | `PATCH` | `/{version}/account/projects/{projectId}/settings/regions` | `account` |
| `createAccount` | `POST` | `/{version}/account` | `account` |
| `getAccountCollaborators` | `GET` | `/{version}/account/collaborators` | `account` |
| `sendInviteToTeamMember` | `POST` | `/{version}/account/team/member/invite` | `account` |
| `getLicenses` | `GET` | `/{version}/account/licenses` | `account` |
| `getProjectAiSettings` | `GET` | `/{version}/account/projects/{projectId}/ai/settings` | `project` |
| `updateProjectAiSettings` | `PUT` | `/{version}/account/projects/{projectId}/ai/settings` | `project` |
| `createProjectAiAssistant` | `POST` | `/{version}/account/projects/{projectId}/ai/assistants` | `project` |
| `updateProjectAiAssistant` | `PUT` | `/{version}/account/projects/{projectId}/ai/assistants/{assistantId}` | `project` |
| `deleteProjectAiAssistant` | `DELETE` | `/{version}/account/projects/{projectId}/ai/assistants/{assistantId}` | `project` |
| `getProjectAiUsage` | `GET` | `/{version}/account/projects/{projectId}/ai/usage` | `project` |
| `setAdminPortalEnabled` | `PUT` | `/{version}/account/projects/{projectId}/admin-portal/enabled` | `project` |
| `updateProjectAdminUrl` | `PATCH` | `/{version}/account/projects/{projectId}/settings/admin-url` | `project` |
| `updateProjectLegalDocuments` | `PATCH` | `/{version}/account/projects/{projectId}/settings/legal` | `project` |
| `updateProjectExposeLegal` | `PATCH` | `/{version}/account/projects/{projectId}/settings/legal/expose` | `project` |
| `updateProjectExposeBrand` | `PATCH` | `/{version}/account/projects/{projectId}/settings/brand/expose` | `project` |
| `updateProjectExposeAuth` | `PATCH` | `/{version}/account/projects/{projectId}/settings/auth/expose` | `project` |
| `getAdminPortalStructure` | `GET` | `/{version}/account/projects/{projectId}/admin-portal/structure` | `project` |
| `assignAdminPortalServiceUser` | `PUT` | `/{version}/account/projects/{projectId}/settings/admin-portal/service-user` | `project` |
| `createAiServiceUser` | `POST` | `/{version}/account/ai/service-users` | `project` |
| `listAiServiceUsers` | `GET` | `/{version}/account/ai/service-users` | `project` |
| `rotateAiServiceUserKey` | `POST` | `/{version}/account/ai/service-users/{Id}/keys` | `project` |
| `revokeAiServiceUserKey` | `DELETE` | `/{version}/account/ai/service-users/{Id}/keys/{KeyId}` | `project` |
| `deleteAiServiceUser` | `DELETE` | `/{version}/account/ai/service-users/{Id}` | `project` |
| `sendMcpMessage` | `POST` | `/{version}/account/mcp` | `project` |
| `openMcpStream` | `GET` | `/{version}/account/mcp` | `project` |
| `endMcpSession` | `DELETE` | `/{version}/account/mcp` | `project` |

## Developer MCP endpoint

`sendMcpMessage`, `openMcpStream` and `endMcpSession` return an `McpResponse`
(`statusCode`, `headers`, `body`, `sessionId`, `contentType`, `isEventStream`,
`text`, `json`), not a parsed value: the gateway hands out the session id only
in the `Mcp-Session-Id` answer header of `initialize`, and a `tools/call` may
answer with an SSE stream. This SDK has no SSE client — `openMcpStream` returns
only when the server closes the stream.

```swift
let initialize = try await hub.account.sendMcpMessage([
    "jsonrpc": "2.0", "id": 1, "method": "initialize",
    "params": ["protocolVersion": "2025-11-25", "capabilities": [String: Any](),
               "clientInfo": ["name": "my-app", "version": "1.0"]],
])
let sessionId = initialize.sessionId!
let tools = try await hub.account.sendMcpMessage(["jsonrpc": "2.0", "id": 2, "method": "tools/list"], sessionId: sessionId)
print(tools.json ?? tools.text)
_ = try await hub.account.endMcpSession(sessionId: sessionId)
```

A service user key (`nbsu_...`, from `createAiServiceUser` / `rotateAiServiceUserKey`)
used as the client's key narrows the MCP tools to that user's scope.
