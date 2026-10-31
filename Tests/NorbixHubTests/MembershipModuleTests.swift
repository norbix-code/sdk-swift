import XCTest
@testable import NorbixHub
import NorbixCore

final class HubMembershipModuleTests: XCTestCase {
    func testModuleSurface() async throws {
        let client = try NorbixHubClient(
            projectId: "proj",
            bearerToken: "token",
            accountId: "acc",
            executor: MockHTTPExecutor()
        )
        XCTAssertNotNil(client.membership)
    }

    func testSaveMembershipTriggerSendsTheTriggerSubjectAudience() async throws {
        let executor = MockHTTPExecutor()
        let client = try NorbixHubClient(
            projectId: "proj",
            bearerToken: "token",
            accountId: "acc",
            executor: executor
        )

        _ = try await client.membership.saveMembershipTrigger([
            "trigger": [
                "type": "Membership",
                "name": "welcome",
                "when": "OnRegistered",
                "action": [
                    "type": "Email",
                    "integrationId": "int_1",
                    "templateId": "tpl_1",
                    "deliverySettings": ["recipientsSourceType": "TriggerSubject"],
                ],
            ],
        ])

        let request = try XCTUnwrap(executor.lastRequest)
        XCTAssertEqual(request.httpMethod, "POST")
        XCTAssertEqual(request.url?.path, "/v3/membership/triggers")
        let body = try XCTUnwrap(request.httpBody)
        let json = try XCTUnwrap(JSONSerialization.jsonObject(with: body) as? [String: Any])
        let trigger = try XCTUnwrap(json["trigger"] as? [String: Any])
        let action = try XCTUnwrap(trigger["action"] as? [String: Any])
        let settings = try XCTUnwrap(action["deliverySettings"] as? [String: Any])
        XCTAssertEqual(settings["recipientsSourceType"] as? String, "TriggerSubject")
    }
}
