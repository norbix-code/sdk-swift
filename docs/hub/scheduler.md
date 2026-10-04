# HUB · Scheduler

Runs a task on a cron schedule. **Only `EmailCampaign` tasks run today**:
each run sends an email campaign.

| Method | Verb | Path | Scope |
| --- | --- | --- | --- |
| `enableScheduler` | `PUT` | `/{version}/scheduler/enable` | `project` |
| `disableScheduler` | `PUT` | `/{version}/scheduler/disable` | `project` |
| `getSchedulerTasks` | `GET` | `/{version}/scheduler/tasks` | `project` |
| `getSchedulerTask` | `GET` | `/{version}/scheduler/tasks/{id}` | `project` |
| `saveSchedulerTask` | `POST` | `/{version}/scheduler/tasks` | `project` |
| `deleteSchedulerTask` | `DELETE` | `/{version}/scheduler/tasks/{Id}` | `project` |
| `enableSchedulerTask` | `PUT` | `/{version}/scheduler/tasks/{Id}/enable` | `project` |
| `disableSchedulerTask` | `PUT` | `/{version}/scheduler/tasks/{Id}/disable` | `project` |

The module switch (`enableScheduler` / `disableScheduler`) sends **PUT** since
this version — it sent GET before; the gateway changed the route.

## Save a task

Every Monday at 09:00 UTC, email every project user with template `tmpl_1`:

```swift
let saved = try await hub.scheduler.saveSchedulerTask([
    "name": "Weekly digest",
    "cron": "0 9 * * 1",           // 5 fields, evaluated in UTC
    "initiatorUserId": "usr_1",    // you, or a project service user
    "isEnabled": true,
    "stopOnError": false,
    "task": [
        "type": "EmailCampaign",   // the only task type today
        "campaign": [
            "source": "AllUsers",
            "templateId": "tmpl_1",
        ],
        // "databaseIntegrationId": "...", // optional
    ],
])
// saved: ["id": "tsk_…", ...]
```

To update a task, send the same body with `"taskId": "tsk_…"`.

- `cron` has exactly 5 fields (minute, hour, day of month, month, day of
  week) and runs in UTC. A 6-field (seconds) expression is refused.
- `initiatorUserId` (`usr_…`) is required: the task runs as this user. It
  must be the caller or a service user of the project.
- `task.type` is the discriminator. `task.campaign` takes the same shape as an
  email campaign (`source` + `templateId` + the source's own fields, for
  example `rolesNames` / `userTags` for `AllUsers`). The typed shape is
  `EmailCampaignSchedulerTaskRequest` in `references/hub.dtos.swift`.

## List, read, switch and delete

```swift
// Filters and paging go in the query.
_ = try await hub.scheduler.getSchedulerTasks(["type": "EmailCampaign", "enabled": true, "pageSize": 20])

// The task id goes in the path.
_ = try await hub.scheduler.getSchedulerTask(["id": "tsk_1"])
_ = try await hub.scheduler.disableSchedulerTask(["id": "tsk_1"])
_ = try await hub.scheduler.enableSchedulerTask(["id": "tsk_1"])
_ = try await hub.scheduler.deleteSchedulerTask(["id": "tsk_1"])

// Module switch.
_ = try await hub.scheduler.enableScheduler()
_ = try await hub.scheduler.disableScheduler()
```
