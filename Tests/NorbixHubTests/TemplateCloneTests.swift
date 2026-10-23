import XCTest
@testable import NorbixHub
import NorbixCore

/// Template clone answers the new copy's id. The gateway's clone requests
/// (email, SMS and push templates) answer an `IdResponse`
/// (`{"id": "<new template id>"}`); the SDK hands it to the caller as is.
/// Every call goes to `MockHTTPExecutor` — never a real gateway.
final class HubTemplateCloneTests: XCTestCase {

    private func makeAnsweringClient() throws -> (NorbixHubClient, MockHTTPExecutor) {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"id":"tpl_copy"}"#.utf8)
        let client = try NorbixHubClient(
            projectId: "proj",
            bearerToken: "token",
            accountId: "acc",
            executor: mock
        )
        return (client, mock)
    }

    private func assertClone(_ mock: MockHTTPExecutor, _ channel: String, _ answer: Any?) throws {
        let map = try XCTUnwrap(answer as? [String: Any])
        XCTAssertEqual(map["id"] as? String, "tpl_copy")
        XCTAssertEqual(mock.capturedRequests.count, 1)
        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/notifications/\(channel)/templates/tpl_source/clone")
    }

    func testCloneEmailTemplateReturnsTheCopyId() async throws {
        let (client, mock) = try makeAnsweringClient()
        let answer = try await client.notifications.cloneEmailTemplate(["Id": "tpl_source"])
        try assertClone(mock, "email", answer)
    }

    func testCloneSmsTemplateReturnsTheCopyId() async throws {
        let (client, mock) = try makeAnsweringClient()
        let answer = try await client.notifications.cloneSmsTemplate(["Id": "tpl_source"])
        try assertClone(mock, "sms", answer)
    }

    func testClonePushTemplateReturnsTheCopyId() async throws {
        let (client, mock) = try makeAnsweringClient()
        let answer = try await client.notifications.clonePushTemplate(["Id": "tpl_source"])
        try assertClone(mock, "push", answer)
    }
}
