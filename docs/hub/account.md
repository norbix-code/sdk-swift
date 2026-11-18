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
| `getManagedServiceBundles` | `GET` | `/{version}/account/stripe/bundles` | `project` |
| `changeManagedServiceBundle` | `POST` | `/{version}/account/stripe/change-bundle` | `project` |
| `checkBundleDiscount` | `POST` | `/{version}/account/stripe/discount/check` | `project` |
| `applyBundleDiscount` | `POST` | `/{version}/account/stripe/discount` | `project` |
| `getTrialAvailability` | `GET` | `/{version}/account/trial-availability` | `project` |
| `joinTrialWaitlist` | `POST` | `/{version}/account/trial-waitlist` | `project` |
| `getFlexClusters` | `GET` | `/{version}/account/flex-clusters` | `project` |
| `upgradeFlexCluster` | `POST` | `/{version}/account/flex-clusters/{flexClusterId}/upgrade` | `project` |
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

## Bundles and Flex clusters

A Managed Service subscription is one of three bundles (`Starter`, `Growth`,
`Scale`), paid `Monthly` or `Annual`. Each bundle allows a number of enabled
projects.

- `getManagedServiceBundles()` answers `bundles`, each with `bundle`,
  `projectCap` and the `monthly` and `annual` prices (`amount` in minor units,
  lower-case `currency`).
- `changeManagedServiceBundle` takes `bundle` and `billingPeriod`. It is
  refused with `CM-ERRORS-ACCOUNT-023` when the account has more enabled
  projects than the new bundle allows.
- `createStripeCheckoutSession` for a Managed Service subscription needs
  `bundle` and `billingPeriod`. `projectCap` is no longer accepted.
- `getAccountStatus()` also answers `bundle`, `billingPeriod`, `isTrial`,
  `renewsOn` and `enabledProjects`.
- `getFlexClusters()` answers `clusters` (the account's Norbix-managed Atlas
  clusters with their `databases`, `usage`, `nearLimits`, `nextTierCode` — the
  next upgrade step, empty when there is none — and `topTierCode`, the plan's
  highest tier), `canCreateNew`
  and `cannotCreateReason` (`TrialOneCluster` or `ClusterLimitReached`).
- `upgradeFlexCluster` takes `flexClusterId` (it goes in the path) and
  `tierCode` — the cluster's `nextTierCode`: one step on FLEX → M10 → M20 →
  M30 → M40, within the plan (trial: FLEX only · Starter: up to M20 · Growth:
  up to M30 · Scale: up to M40); the upgrade is queued.

```swift
let bundles = try await hub.account.getManagedServiceBundles()
_ = try await hub.account.changeManagedServiceBundle(["bundle": "Growth", "billingPeriod": "Annual"])

let flex = try await hub.account.getFlexClusters()
_ = try await hub.account.upgradeFlexCluster(["flexClusterId": "fxc_1", "tierCode": "M20"]) // the cluster's nextTierCode
```

To put a new managed database on a cluster the account already has, send
`flexClusterId` in the `MongoDbAtlasFlexManaged` database integration request;
to name a new cluster, send `clusterDisplayName`.

## Bundle discount codes

- `checkBundleDiscount` takes `code` and, optionally, `bundle` and
  `billingPeriod` (the plan about to be bought; left out, the current plan).
  It changes nothing. The answer's `discount` has `code`, `percentOff`
  (20 = 20%) or `amountOff` (minor units, with `currency`), `months` (null =
  forever) and `endsAt` (null before checkout).
- `applyBundleDiscount` takes `code` and puts it on the running Managed Service
  subscription. The discount shows a moment later, through the Stripe webhook,
  as `discount` in `getAccountStatus()`. Refused with `CM-ERRORS-PROJECTS-039`
  when the account has no subscription.
- `createStripeCheckoutSession` takes an optional `discountCode`; it is checked
  first and a refused code fails the call with no checkout made.
- `getAccountStatus()` also answers `discount` (same shape as above) while one
  is on the subscription.

A refused code fails with `CM-ERRORS-ACCOUNT-027` (HTTP 400). The reason is in
the error context, `reason`: `not_found`, `not_started`, `expired`,
`not_for_bundle`, `monthly_only`, `wrong_billing_period`,
`already_has_discount` or `already_used`.

```swift
do {
    let answer = try await hub.account.checkBundleDiscount([
        "code": "LAUNCH30", "bundle": "Growth", "billingPeriod": "Monthly",
    ])
    _ = try await hub.account.applyBundleDiscount(["code": "LAUNCH30"])
} catch let error as NorbixError where error.code == "CM-ERRORS-ACCOUNT-027" {
    let reason = error.errors.first?.context["reason"] // e.g. "already_used"
}
```

## Trial limits and the waiting list

- `getTrialAvailability` takes an optional `region` (sent in the query string)
  and asks whether a free Managed Service trial can start there now, before
  opening a checkout. `limitsOn` false means this installation has no trial
  limits: start the trial as before. `trialsOpen` false means the region's
  trials are full: offer buy now without a trial (`createStripeCheckoutSession`
  with `withoutTrial` true) or the waiting list when `waitlistOpen` is true.
  `onWaitlist` says the owner email is already on the list. `refusal` says why
  this account's trial was refused after checkout (`CardAlreadyHadTrial`), or
  is empty.
- `joinTrialWaitlist` takes `region`, `consent` (must be true) and
  `consentVersion` (the consent text shown) and puts the account owner's email
  on the region's waiting list. When a slot frees, Norbix emails an invitation
  link valid a few days. `status` is `added`, `alreadyListed` or
  `alreadyCustomer` (an email that already had a trial or pays is never
  added); `message` can be shown as is. Fails with `CM-ERRORS-ACCOUNT-044`
  (list switched off), `CM-ERRORS-ACCOUNT-043` (unknown region) or a
  validation error when `consent` is not true.
- `createStripeCheckoutSession` takes optional `region`, `withoutTrial` and
  `trialInvite`. A trial checkout in a full region fails with
  `CM-ERRORS-ACCOUNT-040`. The invitation token from the waiting-list email
  goes in `trialInvite` and starts the trial once even when the region is
  full; an expired invitation or someone else's fails with
  `CM-ERRORS-ACCOUNT-042`.

The website's waiting-list intake route (`/{version}/account/trial-waitlist/intake`)
is called by the website server with a shared key and has no method here.

```swift
let availability = try await hub.account.getTrialAvailability(["region": "nb-eu-germany"])
if let map = availability as? [String: Any], map["trialsOpen"] as? Bool == false,
   map["waitlistOpen"] as? Bool == true {
    _ = try await hub.account.joinTrialWaitlist([
        "region": "nb-eu-germany", "consent": true, "consentVersion": "2026-11",
    ])
}
```

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
