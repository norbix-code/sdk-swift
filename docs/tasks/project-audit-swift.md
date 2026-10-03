# Project audit — Swift SDK: Project module completeness
This file: /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/audit/project/docs/tasks/project-audit-swift.md (branch audit/project)

## Goal
Give the Swift SDK every Project-module endpoint the gateway has: admin URL, legal documents, admin portal structure and service user, the public project config and legal pages, the developer MCP endpoint, and AI service users — each with a route test and a doc line.
Not in scope: AI plans, knowledge and credits (decided internal); a streaming (SSE) client.

## Plan
1. [done] docs(sdk-swift:project): task file with goal and plan
2. [todo] feat(sdk-swift:account): admin URL, legal documents, expose legal, admin portal structure and service user on `hub.account`, with route tests
3. [todo] feat(sdk-swift:public): new `api.publicProjects` module for the public project config and legal pages (API host), sent with no credentials, with route tests
4. [todo] feat(sdk-swift:account): AI service users (create, list, delete, rotate key, revoke key) on `hub.account`, with route tests
5. [todo] feat(sdk-swift:mcp): developer MCP endpoint (send, open stream, end session) on `hub.account`, returning the session id from the answer header, with tests
6. [todo] docs(sdk-swift:docs): docs/hub/account.md, new docs/api/public_projects.md, both index pages, README
7. [todo] chore(sdk-swift:checks): `swift build` and `swift test` green; push and open the pull request

## Changes
| file (absolute, branch audit/project) | what changed | step |
|------|--------------|------|
| /Users/djovaisas/Projects/norbix/worktrees/sdks/norbix-swift/audit/project/docs/tasks/project-audit-swift.md | this task file | 1 |

## Findings

## Rejected / moved out
- decision(sdk-swift:ai): AI plans, knowledge search and AI credits endpoints are not added — rejected — reason: decided internal by the campaign — new ticket/file: none

## Needs you
- [ ] release(sdk-swift:project): review and merge the pull request (Squash and merge) — needs you · action: merge the PR linked in the final report

## Open questions
- none
