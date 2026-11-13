# API · Membership

| Method | Verb | Path | Scope |
| --- | --- | --- | --- |
| `blockUser` | `PATCH` | `/{version}/membership/users/block` | `project` |
| `saveSystemUserWithPermissions` | `POST` | `/{version}/membership/users/register/service` | `project` |
| `saveGuestUser` | `POST` | `/{version}/membership/users/register/guest` | `project` |
| `saveUserNameUser` | `POST` | `/{version}/membership/users/register/user-name` | `project` |
| `saveEmailUser` | `POST` | `/{version}/membership/users/register/email` | `project` |
| `savePhoneUser` | `POST` | `/{version}/membership/users/register/phone` | `project` |
| `savePhoneUserNameWithPermissions` | `POST` | `/{version}/membership/users/register/phone-with-permissions` | `project` |
| `saveEmailUserNameWithPermissions` | `POST` | `/{version}/membership/users/register/email-with-permissions` | `project` |
| `saveUserNameWithPermissions` | `POST` | `/{version}/membership/users/register/user-name-with-permissions` | `project` |
| `deleteUser` | `DELETE` | `/{version}/membership/users` | `project` |
| `getUser` | `GET` | `/{version}/membership/users/{id}` | `project` |
| `getUsers` | `GET` | `/{version}/membership/users` | `project` |
| `getUserPreferences` | `GET` | `/{version}/membership/users/{id}/preferences` | `project` |
| `inviteUser` | `POST` | `/{version}/membership/users/invite` | `project` |
| `assignRolePermissions` | `PUT` | `/{version}/membership/users/assign-roles` | `project` |
| `unblockUser` | `PATCH` | `/{version}/membership/users/unblock` | `project` |
| `updateUser` | `PUT` | `/{version}/membership/users` | `project` |
| `updateUserPreferences` | `PUT` | `/{version}/membership/users/{id}/preferences` | `project` |
| `startLinkIdentity` | `POST` | `/{version}/membership/auth/{UserId}/link-identity/start` | `project` |
| `linkIdentity` | `POST` | `/{version}/membership/auth/{UserId}/link-identity` | `project` |
| `exchangeSocialSignInCode` | `POST` | `/{version}/membership/auth/social/{Provider}/exchange` | `unauthenticated` |
| `socialSignInUrl` | — | builds `GET /{version}/membership/auth/social/{provider}?projectId=…` (a URL, not a call) | — |

## Social sign-in and link identity

Project users can sign in with Google, Apple, Microsoft, GitHub, Facebook, X or
Okta. The project's enabled providers are in the public config
(`publicProjects.getPublicProjectConfig` → `auth.socialSignIn`: `provider`,
`displayName`, `startPath`).

```swift
// 1. PKCE: keep the verifier in memory; only the challenge travels.
let pkce = PkcePair.create()
// Open the start URL with ASWebAuthenticationSession (not a WKWebView). It is not a call: it redirects.
let start = client.membership.socialSignInUrl(
    "google", returnUrl: "https://app.example.com/oauth/callback", codeChallenge: pkce.codeChallenge
)

// 2. The return page gets ?code=…&provider=google (or ?error=…). Trade the code within 2 minutes:
let token = try await client.membership.exchangeSocialSignInCode(
    ["provider": "google", "code": code, "codeVerifier": pkce.codeVerifier]
) as? [String: Any]
// token?["bearerToken"]: the project JWT (14 days, no refresh token)

// Link another provider to the signed-in user (yourself only):
let linkPkce = PkcePair.create()
let link = try await client.membership.startLinkIdentity([
    "userId": "usr_…", "provider": "github", "returnUrl": "https://app.example.com/settings",
    "codeChallenge": linkPkce.codeChallenge,
]) as? [String: Any]
// open link?["authorizeUrl"]; it comes back with ?intent=link&code=…
_ = try await client.membership.linkIdentity(["userId": "usr_…", "code": linkCode, "codeVerifier": linkPkce.codeVerifier])
```

- `socialSignInUrl(_:mode:returnUrl:)` puts the project id and a non-PROD env
  in the query, because a navigation sends no headers. The start and the
  provider callback have no call method.
- `exchangeSocialSignInCode` sends no credentials, even when the client has a
  key or a JWT: the gateway refuses an old token on any route, and the
  exchange is how a user signs in again.
- `linkIdentity` now takes `userId` and `code` (the link code); `provider` /
  `providerToken` are gone.
- PKCE (S256) is optional but strongly recommended: `PkcePair.create()`
  gives `codeVerifier` and `codeChallenge` (32 random bytes, base64url;
  CryptoKit SHA-256). A code started with a challenge needs its verifier; a
  verifier for a code started without one is refused too.
- Refusals: `CM-ERRORS-MEMBERSHIP-051` (code used, expired or unknown), `-055`
  (409, the provider account belongs to another user), `-056` (403, not
  yourself), `-058` (PKCE: `context.Reason` `verifier_missing`,
  `verifier_wrong` or `challenge_missing`; the code is used up — start
  again), `-059` (the challenge is not a 43-character S256). A refused
  `returnUrl` sends the browser to the mode's failure page with
  `error=return_url_not_allowed`.

## Credential version (gateway 2.3.9)

Every login carries a `credentialVersion`. It changes only when the password
is changed or reset, never on sign-in or a profile edit:

- `client.login(...)` answers it as `AuthResponse.credentialVersion` (read from
  `meta.credentialVersion` on the sign-in answer; `nil` from an older gateway).
- `changePassword` and `confirmPasswordReset` answer `{ authId, credentialVersion }`.
- A user read (`getUser`, `getUsers`, `getCurrentUser`) carries `credentialVersion`.

A session signed in before the password changed is refused with HTTP 401 and
the code `CM-ERRORS-MEMBERSHIP-USERS-050` ("credentials changed, sign in
again"). The SDK surfaces it as a `NorbixError` like every other gateway code —
check `error.errorCode` and sign in again:

```swift
do {
    _ = try await client.membership.getCurrentUser()
} catch let error as NorbixError where error.errorCode == "CM-ERRORS-MEMBERSHIP-USERS-050" {
    let auth = try await client.login(.init(userName: "alice@team.io", password: newPassword))
    print("signed in again, version", auth.credentialVersion ?? "-")
}
```
