# HUB · Notifications

| Method | Verb | Path | Scope |
| --- | --- | --- | --- |
| `getUserNotificationPreferences` | `GET` | `/{version}/notifications/user/preferences` | `project` |
| `updateUserNotificationsPreferences` | `PUT` | `/{version}/notifications/user/preferences` | `project` |
| `disableEmail` | `PUT` | `/{version}/notifications/email/disable` | `project` |
| `enableEmail` | `PUT` | `/{version}/notifications/email/enable` | `project` |
| `attachFileToTemplate` | `POST` | `/{version}/notifications/email/templates/attachments` | `project` |
| `createEmailTemplate` | `POST` | `/{version}/notifications/email/templates` | `project` |
| `deleteEmailTemplate` | `DELETE` | `/{version}/notifications/email/templates/{Id}` | `project` |
| `getEmailTemplate` | `GET` | `/{version}/notifications/email/templates/{id}` | `project` |
| `getEmailTemplates` | `GET` | `/{version}/notifications/email/templates` | `project` |
| `getMjml` | `POST` | `/{version}/notifications/email/templates/mjml` | `project` |
| `getSystemEmailTemplate` | `GET` | `/{version}/notifications/email/system-templates/{id}` | `project` |
| `getSystemEmailTemplates` | `GET` | `/{version}/notifications/email/system-templates` | `project` |
| `getEmailTemplateAvailableTokens` | `GET` | `/{version}/notifications/email/templates/{id}/tokens` | `project` |
| `updateEmailTemplate` | `PUT` | `/{version}/notifications/email/templates` | `project` |
| `deleteEmailSignature` | `DELETE` | `/{version}/notifications/email/signatures/{id}` | `project` |
| `getEmailSignature` | `GET` | `/{version}/notifications/email/signatures/{id}` | `project` |
| `getEmailSignatures` | `GET` | `/{version}/notifications/email/signatures` | `project` |
| `saveEmailSignature` | `POST` | `/{version}/notifications/email/signatures` | `project` |
| `getEmailSettings` | `GET` | `/{version}/notifications/email/settings` | `project` |
| `confirmEmailIntegrationHumanDelivery` | `POST` | `/{version}/notifications/email/integrations/confirm-human-delivery` | `project` |
| `deleteEmailIntegration` | `DELETE` | `/{version}/notifications/email/integrations/{Id}` | `project` |
| `disableEmailIntegration` | `PUT` | `/{version}/notifications/email/integrations/{Id}/disable` | `project` |
| `enableEmailIntegration` | `PUT` | `/{version}/notifications/email/integrations/{Id}/enable` | `project` |
| `getEmailIntegration` | `GET` | `/{version}/notifications/email/integrations/{id}` | `project` |
| `getEmailIntegrations` | `GET` | `/{version}/notifications/email/integrations` | `project` |
| `saveEmailIntegration` | `POST` | `/{version}/notifications/email/integrations` | `project` |
| `setEmailsIntegrationAsDefault` | `PUT` | `/{version}/notifications/email/integrations/{Id}/default` | `project` |
| `testEmailIntegration` | `POST` | `/{version}/notifications/email/integrations/test` | `project` |
| `archiveEmailTemplate` | `PUT` | `/{version}/notifications/email/templates/{Id}/archive` | `project` |
| `cloneEmailTemplate` | `POST` | `/{version}/notifications/email/templates/{Id}/clone` | `project` |
| `unArchiveEmailTemplate` | `PUT` | `/{version}/notifications/email/templates/{Id}/unarchive` | `project` |
| `deleteEmailFooter` | `DELETE` | `/{version}/notifications/email/footers/{id}` | `project` |
| `getEmailFooter` | `GET` | `/{version}/notifications/email/footers/{id}` | `project` |
| `getEmailFooters` | `GET` | `/{version}/notifications/email/footers` | `project` |
| `saveEmailFooter` | `POST` | `/{version}/notifications/email/footers` | `project` |
| `createEmailCampaign` | `POST` | `/{version}/notifications/email/campaigns` | `project` |
| `deleteEmailCampaign` | `DELETE` | `/{version}/notifications/email/campaigns/{Id}` | `project` |
| `getEmailCampaign` | `GET` | `/{version}/notifications/email/campaigns/{id}` | `project` |
| `getEmailCampaigns` | `GET` | `/{version}/notifications/email/campaigns` | `project` |
| `getEmailCampaignBatches` | `GET` | `/{version}/notifications/email/campaigns/{id}/batches` | `project` |
| `getEmailCampaignBatchNotification` | `GET` | `/{version}/notifications/email/campaigns/{id}/batches/{batchId}/{notificationId}` | `project` |
| `getEmailCampaignBatchNotifications` | `GET` | `/{version}/notifications/email/campaigns/{id}/batches/{batchId}` | `project` |
| `getEmailCampaignStatistics` | `GET` | `/{version}/notifications/email/campaigns/{id}/stats` | `project` |
| `retryFailedEmailNotifications` | `POST` | `/{version}/notifications/email/campaigns/{Id}/retry-failed` | `project` |
| `previewEmailNotification` | `GET` | `/{version}/notifications/email/preview` | `optional` |
| `previewPushNotification` | `GET` | `/{version}/notifications/push/preview` | `optional` |
| `previewSmsNotification` | `GET` | `/{version}/notifications/sms/preview` | `optional` |
| `getSmsCampaigns` | `GET` | `/{version}/notifications/sms/campaigns` | `project` |
| `createSmsCampaign` | `POST` | `/{version}/notifications/sms/campaigns` | `project` |
| `getSmsCampaignMessages` | `GET` | `/{version}/notifications/sms/campaigns/{campaignId}/messages` | `project` |
| `deleteSmsCampaign` | `DELETE` | `/{version}/notifications/sms/campaigns/{id}` | `project` |
| `getSmsCampaign` | `GET` | `/{version}/notifications/sms/campaigns/{id}` | `project` |
| `getSmsCampaignBatches` | `GET` | `/{version}/notifications/sms/campaigns/{id}/batches` | `project` |
| `getSmsCampaignBatchNotifications` | `GET` | `/{version}/notifications/sms/campaigns/{id}/batches/{batchId}` | `project` |
| `getSmsCampaignBatchNotification` | `GET` | `/{version}/notifications/sms/campaigns/{id}/batches/{batchId}/{notificationId}` | `project` |
| `getSmsCampaignStatistics` | `GET` | `/{version}/notifications/sms/campaigns/{id}/stats` | `project` |
| `stopSmsCampaign` | `POST` | `/{version}/notifications/sms/campaigns/{Id}/stop` | `project` |
| `retryFailedSmsNotifications` | `POST` | `/{version}/notifications/sms/campaigns/{Id}/retry-failed` | `project` |
| `disableSms` | `PUT` | `/{version}/notifications/sms/disable` | `project` |
| `getSmsDisableDependencies` | `GET` | `/{version}/notifications/sms/disable-dependencies` | `project` |
| `enableSms` | `PUT` | `/{version}/notifications/sms/enable` | `project` |
| `getSmsSettings` | `GET` | `/{version}/notifications/sms/settings` | `project` |
| `getSmsIntegrations` | `GET` | `/{version}/notifications/sms/integrations` | `project` |
| `saveSmsIntegration` | `POST` | `/{version}/notifications/sms/integrations` | `project` |
| `confirmSmsIntegrationHumanDelivery` | `POST` | `/{version}/notifications/sms/integrations/confirm-human-delivery` | `project` |
| `testSmsIntegration` | `POST` | `/{version}/notifications/sms/integrations/test` | `project` |
| `deleteSmsIntegration` | `DELETE` | `/{version}/notifications/sms/integrations/{Id}` | `project` |
| `setSmsIntegrationAsDefault` | `PUT` | `/{version}/notifications/sms/integrations/{Id}/default` | `project` |
| `disableSmsIntegration` | `PUT` | `/{version}/notifications/sms/integrations/{Id}/disable` | `project` |
| `enableSmsIntegration` | `PUT` | `/{version}/notifications/sms/integrations/{Id}/enable` | `project` |
| `getSmsIntegration` | `GET` | `/{version}/notifications/sms/integrations/{id}` | `project` |
| `getSmsTemplates` | `GET` | `/{version}/notifications/sms/templates` | `project` |
| `createSmsTemplate` | `POST` | `/{version}/notifications/sms/templates` | `project` |
| `updateSmsTemplate` | `PUT` | `/{version}/notifications/sms/templates` | `project` |
| `renderSms` | `POST` | `/{version}/notifications/sms/templates/render` | `project` |
| `deleteSmsTemplate` | `DELETE` | `/{version}/notifications/sms/templates/{Id}` | `project` |
| `archiveSmsTemplate` | `PUT` | `/{version}/notifications/sms/templates/{Id}/archive` | `project` |
| `cloneSmsTemplate` | `POST` | `/{version}/notifications/sms/templates/{Id}/clone` | `project` |
| `unArchiveSmsTemplate` | `PUT` | `/{version}/notifications/sms/templates/{Id}/unarchive` | `project` |
| `getSmsTemplate` | `GET` | `/{version}/notifications/sms/templates/{id}` | `project` |
| `getSmsMessageContentTokens` | `GET` | `/{version}/notifications/sms/templates/{id}/tokens` | `project` |
| `getEmailCampaignMessages` | `GET` | `/{version}/notifications/emails/campaigns/{campaignId}/messages` | `project` |
| `disablePush` | `PUT` | `/{version}/notifications/push/disable` | `project` |
| `enablePush` | `PUT` | `/{version}/notifications/push/enable` | `project` |
| `archivePushTemplate` | `PUT` | `/{version}/notifications/push/templates/{Id}/archive` | `project` |
| `clonePushTemplate` | `POST` | `/{version}/notifications/push/templates/{Id}/clone` | `project` |
| `createPushTemplate` | `POST` | `/{version}/notifications/push/templates` | `project` |
| `deletePushTemplate` | `DELETE` | `/{version}/notifications/push/templates/{Id}` | `project` |
| `getPushTemplate` | `GET` | `/{version}/notifications/push/templates/{id}` | `project` |
| `getPushTemplates` | `GET` | `/{version}/notifications/push/templates` | `project` |
| `getPushMessageContentTokens` | `GET` | `/{version}/notifications/push/templates/{id}/tokens` | `project` |
| `unArchivePushTemplate` | `PUT` | `/{version}/notifications/push/templates/{Id}/unarchive` | `project` |
| `updatePushTemplate` | `PUT` | `/{version}/notifications/push/templates` | `project` |
| `confirmPushIntegrationHumanDelivery` | `POST` | `/{version}/notifications/push/integrations/confirm-human-delivery` | `project` |
| `deletePushIntegration` | `DELETE` | `/{version}/notifications/push/integrations/{Id}` | `project` |
| `disablePushIntegration` | `PUT` | `/{version}/notifications/push/integrations/{Id}/disable` | `project` |
| `enablePushIntegration` | `PUT` | `/{version}/notifications/push/integrations/{Id}/enable` | `project` |
| `getPushIntegration` | `GET` | `/{version}/notifications/push/integrations/{id}` | `project` |
| `getPushIntegrations` | `GET` | `/{version}/notifications/push/integrations` | `project` |
| `savePushIntegration` | `POST` | `/{version}/notifications/push/integrations` | `project` |
| `setPushIntegrationAsDefault` | `PUT` | `/{version}/notifications/push/integrations/{Id}/default` | `project` |
| `testPushIntegration` | `POST` | `/{version}/notifications/push/integrations/test` | `project` |
| `registerDevice` | `POST` | `/{version}/notifications/push/devices` | `project` |
| `retryFailedPushNotifications` | `POST` | `/{version}/notifications/push/campaigns/{Id}/retry-failed` | `project` |

## Cloning a template

`cloneEmailTemplate`, `cloneSmsTemplate` and `clonePushTemplate` copy a
template and answer the new copy's id (a dictionary with `id`), so you can
open or edit the copy without listing the templates again:

```swift
let copy = try await hub.notifications.cloneEmailTemplate(["Id": "tpl_welcome"]) as? [String: Any]
let template = try await hub.notifications.getEmailTemplate(["id": copy?["id"] ?? ""])
```

## Retrying failed recipients (gateway 2.3.9)

`retryFailedEmailNotifications`, `retryFailedSmsNotifications` and
`retryFailedPushNotifications` send a campaign's failed recipients again
(`POST …/campaigns/{Id}/retry-failed`). Only rows in the `Failed` state are
sent again; a row that was accepted, is still sending, or was blocked or
cancelled is skipped and counted under `skipped`.

| Field | Meaning |
| --- | --- |
| `Id` | The campaign id (path). |
| `idempotencyKey` | Required, at most 64 characters, yours. The same key again replays the first answer (`replayed: true`) and sends nothing; the same key with another body is refused with 409. |
| `databaseIntegrationId` | Optional. Omit for the project default database integration of the environment. |
| `notificationIds` | Optional. Only these rows. Default: every failed recipient of the campaign. |
| `categories` | Optional. Only these failure classes: `Transient`, `Permanent`, `Unknown`. Default: all three. |
| `includeAmbiguous` | Optional, default `false`. Also retry rows whose send timed out after the request had gone out — the provider may already have delivered it, so this **may send a duplicate**. |

The answer is `{ retryRequestId, selected, skipped: { reason: count }, replayed, warning? }`;
`warning` is the duplicate notice, present only with `includeAmbiguous`.

```swift
let answer = try await hub.notifications.retryFailedEmailNotifications([
    "Id": "cmp_1",
    "idempotencyKey": "retry-2026-10-26-1",   // yours; reuse it to read the first answer again
    "categories": ["Transient", "Unknown"],   // leave Permanent failures alone
]) as? [String: Any]
print(answer?["selected"] ?? 0, "rows queued, request", answer?["retryRequestId"] ?? "")
```

## Delivery state on recipient rows

The rows answered by `getEmailCampaignBatchNotification(s)`,
`getEmailCampaignMessages` and their SMS / push twins carry the delivery
bookkeeping the gateway keeps per recipient:

- `state` — `Pending`, `Sending`, `Retrying`, `Accepted`, `Failed`, `Blocked` or `Cancelled`,
  and `stateChangedAt` (UTC) for the last change.
- `attempts[]` — one entry per send attempt (number, time, trigger such as the
  automatic retry or a manual `retryRequestId`, the outcome and the provider's
  message); `deliveryEvents[]` — what the provider reported afterwards
  (delivered, bounced, complained …) when delivery events are switched on.
- `deliveryOutcome` and `deliveryOutcomeRank` — the best thing known about the
  row so far, as a word and as a number you can sort by.

`getEmailCampaignStatistics` / `getSmsCampaignStatistics` / push statistics
gain `failedRetryable` (failed rows a retry would pick up) and `cancelled`.

## Delivery events on integrations

`saveEmailIntegration` / `saveSmsIntegration` take the provider's delivery
report settings as plain dictionary fields:

| Provider | Fields |
| --- | --- |
| `awsSes` | `deliveryEventsEnabled` (Bool), `snsTopicArn` |
| `sendGrid` | `deliveryEventsEnabled` (Bool), `eventWebhookPublicKey` |
| `twilio` (SMS) | `deliveryEventsEnabled` (Bool), `statusCallbackUrl` |
| `azureCommunication` (new email provider) | `endpoint`, `accessKey`, `deliveryEventsEnabled?` (Bool), `eventGridKey?` |

The SDK does not check provider names: pass what the Hub expects and the Hub
validates. The public webhook routes the providers call back (SES-SNS,
SendGrid, Twilio, Azure Event Grid) are not SDK operations.
