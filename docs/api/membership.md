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
