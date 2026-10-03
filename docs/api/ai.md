# API · Ai

End-user AI chat for a signed-in project user (`client.ai`). `startEndUserChatTurn` answers at once with a `turnId`; the answer streams over the gateway's SSE endpoint on the user's channel `ai-chat:{projectId}:{authId}` (`ai.chat.turn.*`, `ai.chat.session.*`). A channel that is not the caller's is refused with 403 and `responseStatus.errorCode = "AiChatChannelRefused"` before the stream starts — do not retry it. Path tokens are read from the request dictionary.

| Method | Verb | Path | Scope |
| --- | --- | --- | --- |
| `getEndUserChatAvailability` | `GET` | `/{version}/ai/chat/availability` | `project` |
| `listEndUserChatSessions` | `GET` | `/{version}/ai/chat/sessions` | `project` |
| `createEndUserChatSession` | `POST` | `/{version}/ai/chat/sessions` | `project` |
| `getEndUserChatSession` | `GET` | `/{version}/ai/chat/sessions/{SessionId}` | `project` |
| `renameEndUserChatSession` | `PATCH` | `/{version}/ai/chat/sessions/{SessionId}` | `project` |
| `deleteEndUserChatSession` | `DELETE` | `/{version}/ai/chat/sessions/{SessionId}` | `project` |
| `pinEndUserChatSession` | `PUT` | `/{version}/ai/chat/sessions/{SessionId}/pin` | `project` |
| `archiveEndUserChatSession` | `PUT` | `/{version}/ai/chat/sessions/{SessionId}/archive` | `project` |
| `getEndUserChatEntries` | `GET` | `/{version}/ai/chat/sessions/{SessionId}/entries` | `project` |
| `setEndUserChatEntryFeedback` | `PUT` | `/{version}/ai/chat/sessions/{SessionId}/entries/{EntryId}/feedback` | `project` |
| `listEndUserChatAttachments` | `GET` | `/{version}/ai/chat/sessions/{SessionId}/attachments` | `project` |
| `uploadEndUserChatAttachment` | `POST` | `/{version}/ai/chat/sessions/{SessionId}/attachments` | `project` |
| `deleteEndUserChatAttachment` | `DELETE` | `/{version}/ai/chat/attachments/{AttachmentId}` | `project` |
| `listEndUserChatMemory` | `GET` | `/{version}/ai/chat/memory` | `project` |
| `forgetEndUserChatMemory` | `DELETE` | `/{version}/ai/chat/memory/{NoteId}` | `project` |
| `startEndUserChatTurn` | `POST` | `/{version}/ai/chat/turn` | `project` |
