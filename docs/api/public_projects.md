# API · Public projects

No sign-in: both calls go out with no `Authorization` header, even when the
client has a key (like the public file link).

| Method | Verb | Path | Scope |
| --- | --- | --- | --- |
| `getPublicProjectConfig` | `GET` | `/{version}/public/projects/{ProjectId}/config` | `unauthenticated` |
| `getPublicProjectLegal` | `GET` | `/{version}/public/projects/{ProjectId}/legal/{Kind}` | `unauthenticated` |

```swift
let config = try await api.publicProjects.getPublicProjectConfig(projectId: "p1")
let terms = try await api.publicProjects.getPublicProjectLegal(projectId: "p1", kind: "terms") // or "privacy"
// ["kind": "terms", "title": ..., "body": <markdown>, "available": true]
```
