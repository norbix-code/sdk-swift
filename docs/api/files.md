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
| `getPublicFile` | `GET` | `/{version}/files/public/{PublicId}/{Name*}` | `unauthenticated` |

## Uploading

Uploads go straight to the storage provider — the bytes never pass through
Norbix:

1. `requestUploadUrl(...)` — get a pre-signed `PUT` URL.
2. `PUT` the file bytes to that URL yourself.
3. `commitUpload(...)` — tell Norbix the upload finished.

## Downloading

Use `getSignedUrl(...)` to download straight from the provider, or
`download(...)` to stream the bytes through the API.

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
