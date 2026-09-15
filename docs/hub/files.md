# HUB · Files

| Method | Verb | Path | Scope |
| --- | --- | --- | --- |
| `disableFiles` | `GET` | `/{version}/files/disable` | `project` |
| `enableFiles` | `GET` | `/{version}/files/enable` | `project` |
| `deleteFilesTrigger` | `DELETE` | `/{version}/files/triggers/{triggerId}` | `project` |
| `disableFilesTrigger` | `PATCH` | `/{version}/files/triggers/{triggerId}/disable` | `project` |
| `enableFilesTrigger` | `PATCH` | `/{version}/files/triggers/{triggerId}/enable` | `project` |
| `getFilesTrigger` | `GET` | `/{version}/files/triggers/{id}` | `project` |
| `getFilesTriggers` | `GET` | `/{version}/files/triggers` | `project` |
| `saveFilesTrigger` | `POST` | `/{version}/files/triggers` | `project` |
| `deleteFilesIntegration` | `DELETE` | `/{version}/files/integrations/{Id}` | `project` |
| `disableFilesIntegration` | `PUT` | `/{version}/files/integrations/{Id}/disable` | `project` |
| `enableFilesIntegration` | `PUT` | `/{version}/files/integrations/{Id}/enable` | `project` |
| `getFilesIntegration` | `GET` | `/{version}/files/integrations/{id}` | `project` |
| `getFilesIntegrations` | `GET` | `/{version}/files/integrations` | `project` |
| `saveFilesIntegration` | `POST` | `/{version}/files/integrations` | `project` |
| `setFilesIntegrationAsDefault` | `PUT` | `/{version}/files/integrations/{Id}/default` | `project` |
| `testFilesIntegration` | `POST` | `/{version}/files/integrations/test` | `project` |
| `getFolderFiles` | `GET` | `/{version}/files/folder` | `project` |
| `getFile` | `GET` | `/{version}/files/item` | `project` |
| `makeFilePublic` | `POST` | `/{version}/files/item/public` | `project` |
| `makeFilePrivate` | `POST` | `/{version}/files/item/private` | `project` |
| `makeFolderPublic` | `POST` | `/{version}/files/folder/public` | `project` |
| `makeFolderPrivate` | `POST` | `/{version}/files/folder/private` | `project` |

## Public links

Four calls turn the public link on and off. They are dashboard actions, so
they need the caller's token — only *reading* the resulting link does not
(`NorbixApi`'s `files.getPublicFile`).

| Call | What it does |
| --- | --- |
| `makeFilePublic` | Publishes one file. Answers with the `nbpf_…` public id. |
| `makeFilePrivate` | Takes that file's link away. Refused while a folder above it is public — switch the folder off instead. |
| `makeFolderPublic` | Publishes a whole folder prefix: one record, however many files sit under it, at any depth. The root cannot be published. |
| `makeFolderPrivate` | Takes back every link inside the folder, including per-file ones. |

```swift
_ = try await client.files.makeFolderPublic([
    "filesIntegrationId": "nbin_1",
    "path": "docs"
])
```

`getFolderFiles` then reports the published prefixes under `publicFolders`,
and `getFile` reports `isPublic` / `publicUrl` for a single file.

## Testing an integration before you save it

`testFilesIntegration` tries the credentials against the storage provider and
answers whether they work. Nothing is saved — use it before
`saveFilesIntegration` to tell a bad key from a bad bucket.
