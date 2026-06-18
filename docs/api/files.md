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

## Uploading

Uploads go straight to the storage provider — the bytes never pass through
Norbix:

1. `requestUploadUrl(...)` — get a pre-signed `PUT` URL.
2. `PUT` the file bytes to that URL yourself.
3. `commitUpload(...)` — tell Norbix the upload finished.

## Downloading

Use `getSignedUrl(...)` to download straight from the provider, or
`download(...)` to stream the bytes through the API.
