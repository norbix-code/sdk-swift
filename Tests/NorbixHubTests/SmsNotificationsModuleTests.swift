import XCTest
@testable import NorbixHub
import NorbixCore

/// `hub.notifications` SMS — all 34 SMS Hub endpoints, one test per method,
/// against `MockHTTPExecutor` (the same fake-transport pattern as
/// `HubFilesModuleTests`). Never a real gateway, never a real provider. Each
/// test checks the verb, the full path with the ids substituted in the
/// gateway's own spelling, and the body or query where the call carries one.
final class HubSmsNotificationsModuleTests: XCTestCase {

    private func makeClient(_ mock: MockHTTPExecutor) throws -> NorbixHubClient {
        try NorbixHubClient(
            projectId: "proj",
            bearerToken: "token",
            accountId: "acc",
            executor: mock
        )
    }

    private func body(_ mock: MockHTTPExecutor) throws -> [String: Any] {
        let data = try XCTUnwrap(mock.lastRequest?.httpBody)
        return try XCTUnwrap(JSONSerialization.jsonObject(with: data) as? [String: Any])
    }

    func testEnableSms() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.enableSms([:])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/enable")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testDisableSms() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.disableSms([:])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/disable")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testGetSmsDisableDependencies() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.getSmsDisableDependencies([:])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/disable-dependencies")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testGetSmsSettings() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.getSmsSettings([:])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/settings")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testPreviewSmsNotification() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.previewSmsNotification(["hash": "abc.def"])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/preview")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        let query = mock.lastRequest?.url?.query ?? ""
        XCTAssertTrue(query.contains("hash=abc.def"), "got: \(query)")
    }

    func testGetSmsIntegrations() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.getSmsIntegrations([:])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/integrations")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testGetSmsIntegration() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.getSmsIntegration(["id": "nbin_1"])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/integrations/nbin_1")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testSaveSmsIntegration() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.saveSmsIntegration(["integration": ["smsType": "Fake", "integrationName": "sms-sdk-secondary-fake"]])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/integrations")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        let json = try body(mock)
        XCTAssertEqual((json["integration"] as? [String: Any])?["smsType"] as? String, "Fake")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testTestSmsIntegration() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.testSmsIntegration(["integrationId": "nbin_1", "phoneNumber": "+37060000000"])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/integrations/test")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        let json = try body(mock)
        XCTAssertEqual(json["integrationId"] as? String, "nbin_1")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testConfirmSmsIntegrationHumanDelivery() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.confirmSmsIntegrationHumanDelivery(["integrationId": "nbin_1"])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/integrations/confirm-human-delivery")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        let json = try body(mock)
        XCTAssertEqual(json["integrationId"] as? String, "nbin_1")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testDeleteSmsIntegration() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.deleteSmsIntegration(["Id": "nbin_1"])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/integrations/nbin_1")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "DELETE")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testSetSmsIntegrationAsDefault() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.setSmsIntegrationAsDefault(["Id": "nbin_1"])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/integrations/nbin_1/default")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testEnableSmsIntegration() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.enableSmsIntegration(["Id": "nbin_1"])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/integrations/nbin_1/enable")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testDisableSmsIntegration() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.disableSmsIntegration(["Id": "nbin_1"])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/integrations/nbin_1/disable")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testGetSmsTemplates() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.getSmsTemplates(["pageSize": 20])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/templates")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        let query = mock.lastRequest?.url?.query ?? ""
        XCTAssertTrue(query.contains("pageSize=20"), "got: \(query)")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testGetSmsTemplate() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.getSmsTemplate(["id": "tpl_1"])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/templates/tpl_1")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testCreateSmsTemplate() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.createSmsTemplate(["name": "sms-sdk-secondary-t1", "content": ["body": "Hi @Model.FirstName"]])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/templates")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        let json = try body(mock)
        XCTAssertEqual(json["name"] as? String, "sms-sdk-secondary-t1")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testUpdateSmsTemplate() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.updateSmsTemplate(["id": "tpl_1", "name": "sms-sdk-secondary-t1"])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/templates")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        let json = try body(mock)
        XCTAssertEqual(json["id"] as? String, "tpl_1")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testDeleteSmsTemplate() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.deleteSmsTemplate(["Id": "tpl_1"])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/templates/tpl_1")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "DELETE")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testArchiveSmsTemplate() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.archiveSmsTemplate(["Id": "tpl_1"])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/templates/tpl_1/archive")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testUnArchiveSmsTemplate() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.unArchiveSmsTemplate(["Id": "tpl_1"])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/templates/tpl_1/unarchive")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testCloneSmsTemplate() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.cloneSmsTemplate(["Id": "tpl_1"])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/templates/tpl_1/clone")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testGetSmsMessageContentTokens() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.getSmsMessageContentTokens(["id": "tpl_1"])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/templates/tpl_1/tokens")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testRenderSms() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.renderSms(["code": "Hi @Model.FirstName", "tokens": [["name": "FirstName", "value": "Ada"]]])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/templates/render")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        let json = try body(mock)
        XCTAssertEqual(json["code"] as? String, "Hi @Model.FirstName")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testGetSmsCampaigns() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.getSmsCampaigns(["templateId": "tpl_1"])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/campaigns")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        let query = mock.lastRequest?.url?.query ?? ""
        XCTAssertTrue(query.contains("templateId=tpl_1"), "got: \(query)")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testCreateSmsCampaign() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.createSmsCampaign(["templateId": "tpl_1", "deliveryStrategy": "AllUsers"])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/campaigns")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        let json = try body(mock)
        XCTAssertEqual(json["templateId"] as? String, "tpl_1")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testGetSmsCampaign() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.getSmsCampaign(["id": "cmp_1"])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/campaigns/cmp_1")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testDeleteSmsCampaign() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.deleteSmsCampaign(["id": "cmp_1"])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/campaigns/cmp_1")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "DELETE")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testStopSmsCampaign() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.stopSmsCampaign(["Id": "cmp_1"])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/campaigns/cmp_1/stop")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testGetSmsCampaignStatistics() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.getSmsCampaignStatistics(["id": "cmp_1"])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/campaigns/cmp_1/stats")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testGetSmsCampaignBatches() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.getSmsCampaignBatches(["id": "cmp_1"])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/campaigns/cmp_1/batches")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testGetSmsCampaignBatchNotifications() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.getSmsCampaignBatchNotifications(["id": "cmp_1", "batchId": "b_1"])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/campaigns/cmp_1/batches/b_1")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testGetSmsCampaignBatchNotification() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.getSmsCampaignBatchNotification(["id": "cmp_1", "batchId": "b_1", "notificationId": "n_1"])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/campaigns/cmp_1/batches/b_1/n_1")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testGetSmsCampaignMessages() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.notifications.getSmsCampaignMessages(["campaignId": "cmp_1"])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/notifications/sms/campaigns/cmp_1/messages")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testStopSmsCampaignRefusedByTheGatewayThrowsTheTypedError() async throws {
        let mock = MockHTTPExecutor()
        mock.responseStatus = 400
        mock.responseBody = Data(#"{"responseStatus":{"errorCode":"CM-ERRORS-SMS-001","message":"Campaign is already stopped"}}"#.utf8)
        let client = try makeClient(mock)

        do {
            _ = try await client.notifications.stopSmsCampaign(["Id": "cmp_1"])
            XCTFail("expected a NorbixError")
        } catch let error as NorbixError {
            XCTAssertEqual(error.status, 400)
            XCTAssertEqual(error.code, "CM-ERRORS-SMS-001")
        }
    }
}
