# API · Code

Workflows are in beta; bugs may occur. The end-user side of workflows: the runs
waiting on the caller and the resume by run id, plus the signed resume links
(`optional` scope — the token in the link is the key, auth is sent only when the
client has one). Asserted in `Tests/NorbixApiTests/CodeModuleTests.swift`.

| Method | Verb | Path | Scope |
| --- | --- | --- | --- |
| `getCodeWorkflowWaitingRuns` | `GET` | `/{version}/code/workflows/runs` | `project` |
| `resumeCodeWorkflowRun` | `POST` | `/{version}/code/workflows/runs/{RunId}/resume` | `project` |
| `openCodeWorkflowResumeLink` | `GET` | `/{version}/code/workflows/resume/{Token}` | `optional` |
| `useCodeWorkflowResumeLink` | `POST` | `/{version}/code/workflows/resume/{Token}` | `optional` |
