# API · Files

Files live inside a **files integration** (`integrationId`, e.g. `nbin_xxx`)
and are addressed by a **path** inside that integration's storage.

| Method | Verb | Path | Scope |
| --- | --- | --- | --- |
| `requestUploadUrl` | `POST` | `/{version}/files/{filesIntegrationId}/upload-url` | `project` |
| `commitUpload` | `POST` | `/{version}/files/{filesIntegrationId}/commit` | `project` |
| `list` | `GET` | `/{version}/files/{filesIntegrationId}` | `project` |
| `getInfo` | `GET` | `/{version}/files/{filesIntegrationId}/info` | `project` |
| `getSignedUrl` | `GET` | `/{version}/files/{filesIntegrationId}/sign` | `project` |
| `download` | `GET` | `/{version}/files/{filesIntegrationId}/download` | `project` |
| `delete` | `DELETE` | `/{version}/files/{filesIntegrationId}` | `project` |
| `deleteMany` | `DELETE` | `/{version}/files/{filesIntegrationId}/bulk` | `project` |
| `testFilesIntegration` | `POST` | `/{version}/files/{filesIntegrationId}/test` | `project` |
| `getPublicFile` | `GET` | `/{version}/files/public/{PublicId}/{Name*}` | `unauthenticated` |
| `getFileById` | `GET` | `/{version}/files/{filesIntegrationId}/by-id/{id}` | `project` |

## Uploading

Uploads go straight to the storage provider — the bytes never pass through
Norbix:

1. `requestUploadUrl(...)` — get a pre-signed `PUT` URL.
2. `PUT` the file bytes to that URL yourself.
3. `commitUpload(...)` — tell Norbix the upload finished.

## Downloading

Use `getSignedUrl(...)` to download straight from the provider, or
`download(...)` to stream the bytes through the API.

## Files by id

Every Files call returns a file with a **stable id** (`nbfl_…`): it is derived
from the file's path inside the integration, so the same file has the same id
on every listing, in `getInfo`, and in a record's file field (a moved file has
a new id). `getFileById(integrationId:id:)` reads one file by that id — use it
to show a name for a file id stored in a record. It answers the `getInfo`
shape (`FileDetails`).

```swift
let details = try await client.files.getFileById(integrationId: "nbin_123", id: "nbfl_7f3…")
print(details.file?.resource.originalFileName ?? "?", details.isPublic ?? false)
```

An id no file of the integration has is a plain `404` (file not found). A
record's file field accepts the `nbfl_…` id or its bare UUID.

## Testing an integration

`testFilesIntegration(integrationId:)` runs a live probe against a files
integration: the gateway uploads a small file, reads it, lists the folder and
deletes the file again. The answer has one item per step — `UploadFile`,
`GetFile`, `GetAllFiles`, `DeleteFile`, in that order — with `operation`,
`result` (`"OK"`, `"FAILED"`, or `"NOT_TESTED"` once an earlier step failed)
and `errors`.

```swift
let result = try await client.files.testFilesIntegration(integrationId: "nbin_123")
for step in result.items where step.result != "OK" {
    print(step.operation, step.errors ?? [])
}
```

The probe writes to the storage, so the key needs the `files:create`
permission. The Hub has its own `testFilesIntegration`
(`POST /{version}/files/integrations/test`) for the dashboard; this one is the
API-plane route.

## Public links

`getPublicFile(publicId:name:)` reads a file somebody published from the Hub
side (`makeFilePublic` / `makeFolderPublic`). It is the one Files call that
sends **no** `Authorization` header — the link has to work in an e-mail, in an
`<img src>`, or in a browser on a stranger's phone, so the unguessable
`nbpf_…` id is the whole credential.

```swift
let bytes = try await client.files.getPublicFile(
    publicId: "nbpf_abc",
    name: "2026/q1/report.pdf"   // slashes stay slashes for a folder link
)
```

Every miss — unknown id, wrong name, made private again, file gone — is the
same plain `404`, on purpose: a more precise answer would tell a stranger that
the file exists.

A listing tells you what is public without a second call: each file carries
`isPublic` and `publicUrl`, and the page carries `publicFolders` — the subset
of `folders` anyone can read from.
