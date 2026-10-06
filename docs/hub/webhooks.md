# HUB · Webhooks

| Method | Verb | Path | Scope |
| --- | --- | --- | --- |
| `getWebhookIntegration` | `GET` | `/{version}/webhooks/integration` | `project` |
| `revealWebhookIntegrationSecret` | `GET` | `/{version}/webhooks/integration/secret` | `project` |
| `rotateWebhookIntegrationSecret` | `POST` | `/{version}/webhooks/integration/secret/rotate` | `project` |
| `updateWebhookIntegrationExtraHeaders` | `PUT` | `/{version}/webhooks/integration/extra-headers` | `project` |
| `disableWebhookDestination` | `PUT` | `/{version}/webhooks/destinations/{DestinationId}/disable` | `project` |
| `enableWebhookDestination` | `PUT` | `/{version}/webhooks/destinations/{DestinationId}/enable` | `project` |
| `removeWebhookDestination` | `DELETE` | `/{version}/webhooks/destinations/{DestinationId}` | `project` |
| `saveWebhookDestination` | `POST` | `/{version}/webhooks/destinations` | `project` |

## What a destination receives

The `webhooks` module manages the webhook integration (destinations, secret,
extra headers). It does not receive webhooks. Your own server receives them:
Norbix POSTs a JSON envelope to each destination.

```json
{
  "id": "<delivery id>",
  "eventId": "<event id>",
  "event": "<event name>",
  "createdOn": "2026-10-06T10:00:00Z",
  "accountId": "<account id>",
  "projectId": "<project id>",
  "triggerId": null,
  "data": { }
}
```

- `id` — one per **delivery**. A retry of the same delivery keeps its `id`.
- `eventId` — one per **change**. Every delivery made for one record change
  carries the same `eventId`: the plain webhook delivery and each schema
  Webhook-trigger delivery.
- `triggerId` — `null` for the plain delivery (the destination is subscribed
  to the event); set when a schema Webhook trigger sent it.

A destination that is subscribed to the event **and** targeted by a schema
Webhook trigger gets **two** deliveries for one change: one with `triggerId`
null, one with `triggerId` set. They have two different `id`s and **one**
`eventId`. When a publisher has no shared event id (Files, Membership,
Payments, AI triggers), `eventId` equals `id`.

### De-duplicate on `eventId`

Use `id` to drop retries, and `eventId` to handle a change only once when it
arrives through several deliveries. Older gateways do not send `eventId`:
fall back to `id`.

```swift
import Foundation

struct NorbixWebhookEnvelope: Decodable {
    let id: String
    let eventId: String?   // older gateways do not send it
    let event: String
    let triggerId: String?

    /// The key to de-duplicate on: `eventId`, or `id` when it is missing.
    var dedupeKey: String { eventId ?? id }
}

func handleWebhook(rawBody: Data, seen: inout Set<String>) throws {
    let envelope = try JSONDecoder().decode(NorbixWebhookEnvelope.self, from: rawBody)
    guard seen.insert(envelope.dedupeKey).inserted else { return } // same change already handled
    // ... handle envelope.event (decode `data` with your own type)
}
```

`seen` stands for your own store (a database table with a unique key, a
cache with a time limit). Answer 2xx for a duplicate too, so Norbix does not
retry it.
