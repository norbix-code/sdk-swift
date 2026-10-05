# HUB · Account

| Method | Verb | Path | Scope |
| --- | --- | --- | --- |
| `getAccountProfile` | `GET` | `/{version}/account/profile` | `project` |
| `updateAccountProfile` | `PUT` | `/{version}/account/profile` | `project` |
| `getMyAccountUserProfile` | `GET` | `/{version}/account/me` | `project` |
| `updateMyAccountUserPhone` | `PUT` | `/{version}/account/me/phone` | `project` |
| `resendAccountVerificationToken` | `GET` | `/{version}/account/verify/resend` | `project` |
| `getAccountStatus` | `GET` | `/{version}/account/status` | `project` |
| `createStripeCheckoutSession` | `POST` | `/{version}/account/stripe/create-checkout-session` | `project` |
| `getStripeBillingPortalUrl` | `POST` | `/{version}/account/stripe/get-portal-url` | `project` |
| `createTeamMemberFromInvitation` | `POST` | `/{version}/account/team/member` | `unauthenticated` |
| `verifyAccount` | `GET` | `/{version}/account/verify` | `unauthenticated` |
| `deleteNotificationsGroup` | `DELETE` | `/{version}/account/projects/{projectId}/notifications/settings/group` | `project` |
| `deleteNotificationsTag` | `DELETE` | `/{version}/account/projects/{projectId}/notifications/settings/tag` | `project` |
| `removeTagFromNotificationsGroup` | `DELETE` | `/{version}/account/projects/{projectId}/notifications/settings/group/tag` | `project` |
| `saveNotificationsGroup` | `POST` | `/{version}/account/projects/{projectId}/notifications/settings/group` | `project` |
| `saveNotificationsTag` | `POST` | `/{version}/account/projects/{projectId}/notifications/settings/tag` | `project` |
| `createProject` | `POST` | `/{version}/account/projects` | `project` |
| `deleteProject` | `DELETE` | `/{version}/account/projects/{projectId}` | `project` |
| `getProject` | `GET` | `/{version}/account/projects/{projectId}` | `project` |
| `getProjects` | `GET` | `/{version}/account/projects` | `project` |
| `getAccountRegions` | `GET` | `/{version}/account/regions` | `unauthenticated` |
| `getProjectTokens` | `GET` | `/{version}/account/projects/{projectId}/tokens` | `project` |
| `updateProjectAccentColor` | `PATCH` | `/{version}/account/projects/{projectId}/settings/accent-color` | `project` |
| `updateProjectIcon` | `PATCH` | `/{version}/account/projects/{projectId}/settings/icon` | `project` |
| `updateProjectLogo` | `PATCH` | `/{version}/account/projects/{projectId}/settings/logo` | `project` |
| `updateProjectMainColor` | `PATCH` | `/{version}/account/projects/{projectId}/settings/main-color` | `project` |
| `updateProjectAllowedOrigins` | `PATCH` | `/{version}/account/projects/{projectId}/settings/origins` | `project` |
| `updateProjectDefaultLanguage` | `PATCH` | `/{version}/account/projects/{projectId}/settings/default-language` | `project` |
| `updateProjectDescription` | `PATCH` | `/{version}/account/projects/{projectId}/settings/description` | `project` |
| `disableProject` | `PATCH` | `/{version}/account/projects/{projectId}/disable` | `project` |
| `enableProject` | `PATCH` | `/{version}/account/projects/{projectId}/enable` | `project` |
| `updateProjectLanguages` | `PATCH` | `/{version}/account/projects/{projectId}/settings/languages` | `project` |
| `updateProjectUrl` | `PATCH` | `/{version}/account/projects/{projectId}/settings/url` | `project` |
| `updateProjectName` | `PATCH` | `/{version}/account/projects/{projectId}/settings/name` | `project` |
| `updateProjectRegions` | `PATCH` | `/{version}/account/projects/{projectId}/settings/regions` | `project` |
| `createAccount` | `POST` | `/{version}/account` | `unauthenticated` |
| `getAccountCollaborators` | `GET` | `/{version}/account/collaborators` | `project` |
| `sendInviteToTeamMember` | `POST` | `/{version}/account/team/member/invite` | `project` |
| `getLicenses` | `GET` | `/{version}/account/licenses` | `project` |
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

Every `project` method here works with a token only (`apiKey` or
`bearerToken`): the gateway takes the account from the signed-in session, or
from the project id in the path. The client does not need `accountId`.

The four `unauthenticated` methods — `createAccount` (sign-up),
`createTeamMemberFromInvitation`, `getAccountRegions` and `verifyAccount` —
need no token and no `accountId`: the gateway routes are anonymous, and the SDK
sends no `Authorization` header. `verifyAccount` takes the account id once, in
the request — pass `accountId` and `token` from the verification email; they go
in the query. `hub.regions.getAccountRegions` is anonymous too.

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
