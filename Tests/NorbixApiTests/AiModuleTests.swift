import XCTest
@testable import NorbixApi
import NorbixCore

/// Every wave-3 route on `ai` and the method that calls it, checked on
/// the mock executor (verb, resolved path, auth and project headers). Never a
/// real gateway, never a real provider.
final class ApiAiModuleTests: XCTestCase {
    private typealias Case = (name: String, verb: String, path: String, call: (NorbixApiClient) async throws -> Void)

    private let cases: [Case] = [
            ("getEndUserChatAvailability", "GET", "/v3/ai/chat/availability", { c in _ = try await c.ai.getEndUserChatAvailability(["probe": "value"]) }),
            ("listEndUserChatSessions", "GET", "/v3/ai/chat/sessions", { c in _ = try await c.ai.listEndUserChatSessions(["probe": "value"]) }),
            ("createEndUserChatSession", "POST", "/v3/ai/chat/sessions", { c in _ = try await c.ai.createEndUserChatSession(["probe": "value"]) }),
            ("getEndUserChatSession", "GET", "/v3/ai/chat/sessions/sessionId1", { c in _ = try await c.ai.getEndUserChatSession(["SessionId": "sessionId1", "probe": "value"]) }),
            ("renameEndUserChatSession", "PATCH", "/v3/ai/chat/sessions/sessionId1", { c in _ = try await c.ai.renameEndUserChatSession(["SessionId": "sessionId1", "probe": "value"]) }),
            ("deleteEndUserChatSession", "DELETE", "/v3/ai/chat/sessions/sessionId1", { c in _ = try await c.ai.deleteEndUserChatSession(["SessionId": "sessionId1", "probe": "value"]) }),
            ("pinEndUserChatSession", "PUT", "/v3/ai/chat/sessions/sessionId1/pin", { c in _ = try await c.ai.pinEndUserChatSession(["SessionId": "sessionId1", "probe": "value"]) }),
            ("archiveEndUserChatSession", "PUT", "/v3/ai/chat/sessions/sessionId1/archive", { c in _ = try await c.ai.archiveEndUserChatSession(["SessionId": "sessionId1", "probe": "value"]) }),
            ("getEndUserChatEntries", "GET", "/v3/ai/chat/sessions/sessionId1/entries", { c in _ = try await c.ai.getEndUserChatEntries(["SessionId": "sessionId1", "probe": "value"]) }),
            ("setEndUserChatEntryFeedback", "PUT", "/v3/ai/chat/sessions/sessionId1/entries/entryId1/feedback", { c in _ = try await c.ai.setEndUserChatEntryFeedback(["SessionId": "sessionId1", "EntryId": "entryId1", "probe": "value"]) }),
            ("listEndUserChatAttachments", "GET", "/v3/ai/chat/sessions/sessionId1/attachments", { c in _ = try await c.ai.listEndUserChatAttachments(["SessionId": "sessionId1", "probe": "value"]) }),
            ("uploadEndUserChatAttachment", "POST", "/v3/ai/chat/sessions/sessionId1/attachments", { c in _ = try await c.ai.uploadEndUserChatAttachment(["SessionId": "sessionId1", "probe": "value"]) }),
            ("deleteEndUserChatAttachment", "DELETE", "/v3/ai/chat/attachments/attachmentId1", { c in _ = try await c.ai.deleteEndUserChatAttachment(["AttachmentId": "attachmentId1", "probe": "value"]) }),
            ("listEndUserChatMemory", "GET", "/v3/ai/chat/memory", { c in _ = try await c.ai.listEndUserChatMemory(["probe": "value"]) }),
            ("forgetEndUserChatMemory", "DELETE", "/v3/ai/chat/memory/noteId1", { c in _ = try await c.ai.forgetEndUserChatMemory(["NoteId": "noteId1", "probe": "value"]) }),
            ("startEndUserChatTurn", "POST", "/v3/ai/chat/turn", { c in _ = try await c.ai.startEndUserChatTurn(["probe": "value"]) }),
    ]

    func testEveryRouteHitsTheExpectedPathAndVerb() async throws {
        XCTAssertEqual(cases.count, 16)
        for c in cases {
            let mock = MockHTTPExecutor()
            mock.responseBody = Data(#"{"responseStatus":{}}"#.utf8)
            let client = try NorbixApiClient(projectId: "proj", bearerToken: "token", executor: mock)
            try await c.call(client)
            XCTAssertEqual(mock.lastRequest?.httpMethod, c.verb, c.name)
            XCTAssertEqual(mock.lastRequest?.url?.path, c.path, c.name)
            XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token", c.name)
            XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "X-CM-ProjectId"), "proj", c.name)
        }
    }
}
