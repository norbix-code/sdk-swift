# API · Logs

| Method | Verb | Path | Scope |
| --- | --- | --- | --- |
| `writeLogs` | `POST` | `/{version}/logs` | `project` |

## Write your app's own log lines

`writeLogs` sends 1–100 entries to the project's Logs. The call returns at
once — the entries are queued — and answers `{ accepted }`.

```swift
_ = try await client.logs.writeLogs(["entries": [[
    "level": "error",                     // information (default) | warning | error
    "title": "Payment failed",            // required, 1–200 characters
    "message": "card declined",           // at most 8 000
    "eventCode": "order:payment_failed",  // a-z 0-9 _ . : -, at most 64; stored as app:<code>
    "correlationId": "checkout-42",       // letters digits _ -, at most 64
    "timestamp": "2026-10-21T10:00:00Z",  // UTC, at most 7 days old, 5 minutes ahead
    "meta": ["orderId": "ord_1"]          // at most 20 keys
]]])
```

Refusals throw `NorbixError`:

| Status | Code | When |
| --- | --- | --- |
| 400 | — | an entry is broken (missing title, too long, bad event code …) |
| 400 | `CM-ERRORS-LOGGING-002` | the Logs module is off |
| 429 | `CM-ERRORS-LOGGING-003` | the project's per-minute quota is used up |

The gateway sends a `Retry-After` header (seconds) with the 429. A POST is
resent on a 429 only when you set an `Idempotency-Key` header yourself (in
`NorbixConfig.defaultHeaders`); that retry waits the `Retry-After`. Otherwise
the error reaches you, and `NorbixError` does not carry response headers yet —
wait about a minute before sending again.
