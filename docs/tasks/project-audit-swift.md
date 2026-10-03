# Project audit — Swift SDK: Project module completeness
This file: /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/audit/project/docs/tasks/project-audit-swift.md (branch audit/project)

## Goal
Give the Swift SDK every Project-module endpoint the gateway has: admin URL, legal documents, admin portal structure and service user, the public project config and legal pages, the developer MCP endpoint, and AI service users — each with a route test and a doc line.
Not in scope: AI plans, knowledge and credits (decided internal); a streaming (SSE) client.

## Plan
1. [done] docs(sdk-swift:project): task file with goal and plan
2. [done] feat(sdk-swift:account): admin URL, legal documents, expose legal, admin portal structure and service user on `hub.account`, with route tests
3. [done] feat(sdk-swift:public): new `api.publicProjects` module for the public project config and legal pages (API host), sent with no credentials, with route tests
   decision(sdk-swift:api): `publicProjects` is added to the public `NorbixApiClientType` protocol, as the AI pull request did for `ai`; an app's own fake that conforms to it must add the property — written as a `Breaking:` line in the pull request (minor version, major frozen)
4. [done] feat(sdk-swift:account): AI service users (create, list, delete, rotate key, revoke key) on `hub.account`, with route tests
5. [done] feat(sdk-swift:mcp): developer MCP endpoint (send, open stream, end session) on `hub.account`, returning the session id from the answer header, with tests
   decision(sdk-swift:mcp): one gateway route with three verbs becomes three methods returning `McpResponse`; plain `send` cannot carry it, because the gateway gives the session id only in the `Mcp-Session-Id` answer header and refuses every later call without it (gateway `McpHttpTransport.cs:157-165`); the TypeScript SDK has only the POST, named `mcp`, returning the body
6. [todo] docs(sdk-swift:docs): docs/hub/account.md, new docs/api/public_projects.md, both index pages, README
7. [todo] chore(sdk-swift:checks): `swift build` and `swift test` green; push and open the pull request

## Changes
| file (absolute, branch audit/project) | what changed | step |
|------|--------------|------|
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/audit/project/docs/tasks/project-audit-swift.md | this task file | 1 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/audit/project/Sources/NorbixHub/Modules/AccountModule.swift | 5 methods: updateProjectAdminUrl, updateProjectLegalDocuments, updateProjectExposeLegal, getAdminPortalStructure, assignAdminPortalServiceUser | 2 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/audit/project/Tests/NorbixHubTests/AccountProjectSettingsRoutesTests.swift | new: verb + path + auth + project header per method (5) | 2 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/audit/project/Sources/NorbixHub/Modules/AccountModule.swift | 5 methods: createAiServiceUser, listAiServiceUsers, rotateAiServiceUserKey, revokeAiServiceUserKey, deleteAiServiceUser | 4 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/audit/project/Tests/NorbixHubTests/AccountAiServiceUsersRoutesTests.swift | new: verb + path + auth + project header per method (5) | 4 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/audit/project/Sources/NorbixApi/Modules/PublicProjectsModule.swift | new module: getPublicProjectConfig, getPublicProjectLegal (scope .unauthenticated) | 3 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/audit/project/Sources/NorbixApi/NorbixApiClient.swift | exposes `api.publicProjects` | 3 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/audit/project/Sources/NorbixApi/NorbixApiClientType.swift | protocol gains `publicProjects` (same as the AI pull request added `ai`) | 3 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/audit/project/Tests/NorbixApiTests/PublicProjectsModuleTests.swift | new: path, verb, no Authorization header (2) | 3 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/audit/project/Sources/NorbixCore/Transport.swift | new public `sendRaw` + `NorbixRawResponse`; the private pipeline now also returns the HTTP answer and takes Accept, extra headers and a raw body; `send` / `downloadData` unchanged | 5 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/audit/project/Sources/NorbixHub/McpResponse.swift | new: statusCode, headers, body, sessionId, contentType, isEventStream, text, json | 5 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/audit/project/Sources/NorbixHub/Modules/AccountModule.swift | sendMcpMessage, openMcpStream, endMcpSession | 5 |
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/audit/project/Tests/NorbixHubTests/AccountMcpTests.swift | new: session id from header, SSE kept raw, GET asks for SSE, DELETE sends the session, 400 throws (5) | 5 |

## Findings
fix(sdk-swift:transport): the request pipeline returned only the body and had no way to add a request header, so an MCP session (id in an answer header, sent back as a request header) was impossible — done (fixed here with `sendRaw`, step 5)
    where: /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/audit/project/Sources/NorbixCore/Transport.swift (func sendRaw, branch audit/project)
```swift
// before — Sources/NorbixCore/Transport.swift, runWithRetry (main)
                let (data, response) = try await executor.execute(httpRequest)
                ...
                return data            // <-- here: the HTTPURLResponse (and its Mcp-Session-Id header) is dropped
```

docs(sdk-swift:files): the public file link route is written `{publicId}/{name}`, the gateway writes `{PublicId}/{Name*}`, so the coverage scanner (exact text match) counts it as missing; the URL on the wire is right — left open
    where: /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/audit/project/Sources/NorbixApi/Modules/FilesModule.swift:613 (branch audit/project)
```swift
// Sources/NorbixApi/Modules/FilesModule.swift:612-616 (main)
        try await transport.downloadData(
            path: "/{version}/files/public/{publicId}/{name}",   // <-- here: gateway route is /{version}/files/public/{PublicId}/{Name*}
            method: "GET",
            request: ["publicId": publicId, "name": name],
            scope: .unauthenticated,
```


## Rejected / moved out
- decision(sdk-swift:ai): AI plans, knowledge search and AI credits endpoints are not added — rejected — reason: decided internal by the campaign — new ticket/file: none

## Needs you
- [ ] release(sdk-swift:project): review and merge the pull request (Squash and merge) — needs you · action: merge the PR linked in the final report

## Open questions
- none
