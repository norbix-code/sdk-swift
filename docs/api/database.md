# API · Database

| Method | Verb | Path | Scope |
| --- | --- | --- | --- |
| `findTerms` | `GET` | `/{version}/database/taxonomies/{taxonomyName}/terms` | `project` |
| `findTermsChildren` | `GET` | `/{version}/database/taxonomies/{taxonomyName}/terms/{parentId}/children` | `project` |
| `findTermTree` | `GET` | `/{version}/database/taxonomies/{taxonomyName}/terms/tree` | `project` |
| `findTaxonomyTree` | `GET` | `/{version}/database/taxonomies/tree` | `project` |
| `getDatabaseSchema` | `GET` | `/{version}/database/schemas/{id}` | `project` |
| `getDatabaseSchemas` | `GET` | `/{version}/database/schemas` | `project` |
| `aggregate` | `POST` | `/{version}/database/collections/{collectionName}/aggregate` | `project` |
| `changeResponsibility` | `PUT` | `/{version}/database/collections/{collectionName}/{id}/responsibility` | `project` |
| `count` | `GET` | `/{version}/database/collections/{collectionName}/count` | `project` |
| `deleteMany` | `DELETE` | `/{version}/database/collections/{collectionName}/many` | `project` |
| `deleteOne` | `DELETE` | `/{version}/database/collections/{collectionName}/{id}` | `project` |
| `distinct` | `GET` | `/{version}/database/collections/{collectionName}/distinct` | `project` |
| `executeAggregate` | `POST` | `/{version}/database/collections/{collectionName}/aggregates/{aggregateId}/execute` | `project` |
| `find` | `GET` | `/{version}/database/collections/{collectionName}` | `project` |
| `findOne` | `GET` | `/{version}/database/collections/{collectionName}/{id}` | `project` |
| `insertMany` | `POST` | `/{version}/database/collections/{collectionName}/many` | `project` |
| `insertOne` | `POST` | `/{version}/database/collections/{collectionName}` | `project` |
| `replaceOne` | `PUT` | `/{version}/database/collections/{collectionName}/{id}/replace` | `project` |
| `updateMany` | `PUT` | `/{version}/database/collections/{collectionName}/many` | `project` |
| `updateOne` | `PUT` | `/{version}/database/collections/{collectionName}/{id}` | `project` |
| `findOwn` | `GET` | `/{version}/database/collections/{collectionName}/own` | `project` |
| `findMergedTermTree` | `GET` | `/{version}/database/taxonomies/{taxonomyName}/merged-tree` | `project` |

Bulk writes, update bodies, owners, aggregates and term reads follow rules the
gateway checks (an empty filter on `updateMany` / `deleteMany` needs
`"allRecords": true`; `$` operators in an update body are refused). The rules
and their error codes: [Database — rules the gateway checks](../database-rules.md).

## Linked records — `expandReferences`

A reference field (a user, a role, a taxonomy term, a record of another
collection, a file) stores only the target's id. Send
`"expandReferences": true` on `find`, `findOne` or `findOwn` to get every such
value as `{ id, display }` instead — a `multiple` reference as a list of pairs.
`display` is whatever the schema's `displayField` names on the target (a
user's `displayName`, a role's `name`, a term's `name` or `slug`, a field of
the linked record); it is `null` when the target is gone. Nested forms and
arrays are expanded in place, at any depth. Without the flag the answer is
byte-for-byte what it was before.

`ExpandedReference` (`NorbixCore`) is the typed view of one pair: `id`,
`display` (`.text` or `.translated` — a language map for a translatable
name), `isResolved`, and `displayText(language:)` to flatten the display. It
also decodes a bare id (a read made without the flag) as an unresolved pair.

Typed — declare the field once in your `Codable` record:

```swift
import NorbixCore

struct Post: Codable, Sendable {
    let title: String
    let author: ExpandedReference      // "author": {"id":"usr_1","display":"Jane Doe"}
    let tags: [ExpandedReference]      // a multiple reference
}

let page: Page<Post> = try await client.database.find(
    collection: "posts", expandReferences: true, as: Post.self
)
let post = page.items[0]
print(post.author.displayText() ?? "?")            // Jane Doe
print(post.tags.map { $0.displayText(language: "en") }) // ["News", nil] — nil: the term is gone
print(post.tags[1].isResolved)                     // false
```

Untyped — read the pair out of the dictionary:

```swift
let answer = try await client.database.findOne([
    "collectionName": "posts", "id": "rec_1", "expandReferences": true
])
let record = (answer as? [String: Any])?["result"] as? [String: Any]
let author = ExpandedReference.from(record?["author"])
let tags = ExpandedReference.listFrom(record?["tags"])
```

The caller needs read permission on **every** source the schema links to
(users, roles, the taxonomy, the other collection, the files integration).
When one is missing the whole read is refused with `CM-ERRORS-DATABASE-056`,
whose context names the `SourceKind`, the `Source`, the `Fields` and the
`MissingPermissions` — read again without the flag to get the ids. A taxonomy
the schema names that the project does not have is `CM-ERRORS-DATABASE-055`.

## Nested documents — dotted paths and `arrayFilters`

A schema can declare an **object** field (a nested form, closed: an undeclared
member is refused with `CM-ERRORS-DATABASE-047`) and an **array** field (a list
of any field type, with `minItems` / `maxItems` / `uniqueItems`). Records carry
them as plain JSON; filters use MongoDB's dotted paths and `$elemMatch`:

```swift
let page = try await client.database.find([
    "collectionName": "orders",
    "filter": #"{"address.city":"Vilnius","lines":{"$elemMatch":{"sku":"A-1","qty":{"$gte":2}}}}"#,
    "sortBy": "address.city"   // a path through nested forms sorts and pages
])
```

A sort **on or through a list** (`lines`, `lines.qty`, `tags`, or an array
position such as `lines.0.qty`) is refused with `CM-ERRORS-DATABASE-039` — a
cursor on a multi-valued path repeats or skips rows.

`updateOne` / `updateMany` apply the `update` body with `$set`, and its keys
may be dotted paths into nested data:

```swift
// one nested member
_ = try await client.database.updateOne([
    "collectionName": "orders", "id": id, "update": #"{"address.city":"Vilnius"}"#
])
// an element by index, or every element
_ = try await client.database.updateOne([
    "collectionName": "orders", "id": id, "update": #"{"lines.2.qty":3}"#
])
_ = try await client.database.updateOne([
    "collectionName": "orders", "id": id, "update": #"{"lines.$[].qty":1}"#
])
// the elements a filter matches: one filter per $[name] identifier
_ = try await client.database.updateOne([
    "collectionName": "orders", "id": id,
    "update": #"{"lines.$[line].qty":3}"#,
    "arrayFilters": #"[{"line.sku":"A-1"}]"#
])
```

`arrayFilters` is a JSON array of filter documents (identifiers are lower-case
letters and digits, starting with a letter; `$and` / `$or` / `$nor` are allowed
inside a filter). A filter without its identifier, an identifier without its
filter, or keys that overlap (`address` and `address.city` in one update) are
refused with `CM-ERRORS-DATABASE-014` and a `Reason` in the context. A **JSON**
field (a free-form object, `maxBytes` optional) is set as a whole.

## Schema field shapes

`getDatabaseSchema` / `getDatabaseSchemas` describe each field with a
`$fieldType`. New with this contract: `object` (`properties`, `required`),
`array` (`items`, `minItems`, `maxItems`, `uniqueItems`), `json` (`maxBytes`),
and a typed `default` on string / integer / decimal / date / boolean / enum /
tags / currency (`{ value, currency }`); `unique` on string / integer / decimal;
`multipleOf` / `minimum` / `maximum` on currency; `minItems` / `maxItems` on
tags and files plus `allowedFileType` / `maxSizeMb` on files; `displayField` on
every reference kind (`collection`, `user`, `taxonomy`, `role`). The SDK hands
the shapes back untouched — see `references/api.dtos.swift` (`ObjectFieldDto`,
`ArrayFieldDto`, `JsonFieldDto`, `CurrencyDefaultDto`) for the exact members.
Term rows (`findTerms`, trees) carry `slug` next to `name`.

## Working with terms

A **taxonomy** is a named tree of **terms** (labels). A term can have one parent (a clean hierarchy) or several parents (the same item under many categories). Pick the call that matches what you want:

| I want to… | Call | Returns |
| --- | --- | --- |
| Get a taxonomy's terms as a flat list | `findTerms` | a paginated `list` of terms |
| Get only the children of one term | `findTermsChildren` | a `list` of child terms (direct + multi-parent) |
| Get a taxonomy's terms as a ready-made tree | `findTermTree` | a `tree` of nested term nodes |
| Get the taxonomy structure (e.g. Countries → Cities) | `findTaxonomyTree` | a `tree` of taxonomy nodes |

The examples below all use one example `services` taxonomy shaped like this:

```text
Indoors
  └─ Air conditioning
       └─ Wall-mounted
Outdoors
  └─ Solar panels
```

---

### List a taxonomy's terms (flat)
**Goal:** show every term of `services` in a simple list, in display order.
```swift
let res = try await client.api.database.findTerms(["taxonomyName": "services"])
```
```json
{
  "list": {
    "items": [
      { "id": "term_indoors",   "taxonomyName": "services", "parentId": null,           "order": 1, "name": "Indoors" },
      { "id": "term_air_con",   "taxonomyName": "services", "parentId": "term_indoors", "order": 1, "name": "Air conditioning" },
      { "id": "term_wall",      "taxonomyName": "services", "parentId": "term_air_con", "order": 1, "name": "Wall-mounted" },
      { "id": "term_outdoors",  "taxonomyName": "services", "parentId": null,           "order": 2, "name": "Outdoors" },
      { "id": "term_solar",     "taxonomyName": "services", "parentId": "term_outdoors","order": 1, "name": "Solar panels" }
    ],
    "hasMore": false, "hasPrevious": false, "startingAfter": null, "endingBefore": null
  },
  "responseStatus": { "isSuccess": true }
}
```
The list is flat — every term is one row, with its `parentId` telling you where it sits. The nesting is not built for you here (use `findTermTree` for that).

---

### List only top-level terms (filtered)
**Goal:** show just the roots (no parent) — for the first level of a menu.
```swift
let res = try await client.api.database.findTerms([
    "taxonomyName": "services",
    "filter": "{ \"parentId\": null }"
])
```
```json
{
  "list": {
    "items": [
      { "id": "term_indoors",  "taxonomyName": "services", "parentId": null, "order": 1, "name": "Indoors" },
      { "id": "term_outdoors", "taxonomyName": "services", "parentId": null, "order": 2, "name": "Outdoors" }
    ],
    "hasMore": false, "hasPrevious": false, "startingAfter": null, "endingBefore": null
  },
  "responseStatus": { "isSuccess": true }
}
```
`filter` is an optional MongoDB filter, ANDed with the taxonomy. Use it to fetch one level at a time (lazy tree loading) or to find terms by any field.

---

### Get a term's children
**Goal:** the user expanded *Indoors* — load what is directly under it.
```swift
let res = try await client.api.database.findTermsChildren([
    "taxonomyName": "services",
    "parentId": "term_indoors"
])
```
```json
{
  "list": {
    "items": [
      {
        "id": "term_air_con",
        "taxonomyName": "services",
        "parentId": "term_indoors",
        "order": 1,
        "name": "Air conditioning",
        "multiParents": [
          { "taxonomyId": "tax_service_types", "parentId": "term_indoors",          "name": "Indoors" },
          { "taxonomyId": "tax_service_types", "parentId": "term_energy_efficient", "name": "Energy efficient" }
        ]
      }
    ],
    "hasMore": false, "hasPrevious": false
  },
  "responseStatus": { "isSuccess": true }
}
```
This returns **both** direct children (their `parentId` is `term_indoors`) **and** multi-parent children (terms that list `term_indoors` in `multiParents`). Parent names are already resolved, so no second lookup.

---

### Multi-parent: one product in several categories
**Goal:** in a `products` taxonomy, a *Relaxing massage oil* belongs to *For couples*, *Gift ideas*, **and** *Body care*. Listing the children of **any** of those categories returns it.
```swift
let res = try await client.api.database.findTermsChildren([
    "taxonomyName": "products",
    "parentId": "term_gift_ideas"
])
```
```json
{
  "list": {
    "items": [
      {
        "id": "term_relaxing_oil",
        "taxonomyName": "products",
        "name": "Relaxing massage oil",
        "multiParents": [
          { "taxonomyId": "tax_categories", "parentId": "term_for_couples", "name": "For couples" },
          { "taxonomyId": "tax_categories", "parentId": "term_gift_ideas",  "name": "Gift ideas" },
          { "taxonomyId": "tax_categories", "parentId": "term_body_care",   "name": "Body care" }
        ]
      }
    ],
    "hasMore": false, "hasPrevious": false
  },
  "responseStatus": { "isSuccess": true }
}
```
One product, three category links — no duplicate listings. The same product would also come back from the children of `term_for_couples` and `term_body_care`.

---

### Get the whole term tree in one call
**Goal:** render the full `services` tree at once, already nested.
```swift
let res = try await client.api.database.findTermTree(["taxonomyName": "services"])
```
```json
{
  "tree": [
    {
      "id": "term_indoors",
      "name": "Indoors",
      "order": 1,
      "children": [
        {
          "id": "term_air_con",
          "name": "Air conditioning",
          "order": 1,
          "children": [
            { "id": "term_wall", "name": "Wall-mounted", "order": 1, "children": null }
          ]
        }
      ]
    },
    {
      "id": "term_outdoors",
      "name": "Outdoors",
      "order": 2,
      "children": [
        { "id": "term_solar", "name": "Solar panels", "order": 1, "children": null }
      ]
    }
  ],
  "responseStatus": { "isSuccess": true }
}
```
Roots are in `tree`; each node carries its own `children`; a leaf has `children: null`. The tree arrives ready to render — no client-side tree building.

---

### Get only a sub-tree, capped by depth
**Goal:** start from *Indoors* and go at most 2 levels deep.
```swift
let res = try await client.api.database.findTermTree([
    "taxonomyName": "services",
    "rootTermId": "term_indoors",
    "depth": 2
])
```
```json
{
  "tree": [
    {
      "id": "term_indoors",
      "name": "Indoors",
      "order": 1,
      "children": [
        { "id": "term_air_con", "name": "Air conditioning", "order": 1, "children": null }
      ]
    }
  ],
  "responseStatus": { "isSuccess": true }
}
```
With `depth` 2 you get *Indoors* (level 1) and *Air conditioning* (level 2); *Wall-mounted* (level 3) is cut off, so *Air conditioning* shows `children: null`.

---

### Get the taxonomy structure tree — without terms
**Goal:** see how taxonomies relate to each other (e.g. a `Cities` taxonomy whose parent is `Countries`), structure only.
```swift
let res = try await client.api.database.findTaxonomyTree()
```
```json
{
  "tree": [
    {
      "viewId": "txn_countries",
      "taxonomyName": "Countries",
      "taxonomySlug": "countries",
      "parentId": null,
      "children": [
        { "viewId": "txn_cities", "taxonomyName": "Cities", "taxonomySlug": "cities", "parentId": "txn_countries", "children": null, "terms": null }
      ],
      "terms": null
    }
  ],
  "responseStatus": { "isSuccess": true }
}
```
This is the **taxonomy** tree, not the term tree: nodes are taxonomies. Every `terms` is `null` because we did not ask for terms.

---

### Get the taxonomy structure tree — with terms
**Goal:** same structure, but also pull each taxonomy's terms in the same call.
```swift
let res = try await client.api.database.findTaxonomyTree(["includeTerms": true])
```
```json
{
  "tree": [
    {
      "viewId": "txn_countries",
      "taxonomyName": "Countries",
      "taxonomySlug": "countries",
      "parentId": null,
      "terms": [
        { "id": "term_lt", "name": "Lithuania", "order": 1, "children": null },
        { "id": "term_lv", "name": "Latvia",    "order": 2, "children": null }
      ],
      "children": [
        {
          "viewId": "txn_cities",
          "taxonomyName": "Cities",
          "taxonomySlug": "cities",
          "parentId": "txn_countries",
          "terms": [
            { "id": "term_vilnius", "name": "Vilnius", "order": 1, "children": null },
            { "id": "term_kaunas",  "name": "Kaunas",  "order": 2, "children": null }
          ],
          "children": null
        }
      ]
    }
  ],
  "responseStatus": { "isSuccess": true }
}
```
Now each taxonomy node's `terms` holds that taxonomy's full term tree (same shape as `findTermTree`) — *Countries* carries its countries, *Cities* carries its cities.

> Every term-reading call also accepts an optional `databaseIntegrationId` key to target a non-default database.
