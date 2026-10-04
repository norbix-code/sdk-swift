import XCTest
@testable import NorbixHub
import NorbixCore

/// `hub.scheduler` — all 8 Scheduler Hub endpoints, one test per method,
/// against `MockHTTPExecutor` (the same fake-transport pattern as
/// `HubSmsNotificationsModuleTests`). Never a real gateway. Each test checks
/// the verb, the full path with the task id substituted, where the
/// parameters go (path / query / body), and for save the JSON body with the
/// typed email-campaign task.
final class HubSchedulerModuleTests: XCTestCase {

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

    private func query(_ mock: MockHTTPExecutor) throws -> [String: String] {
        let url = try XCTUnwrap(mock.lastRequest?.url)
        let items = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems ?? []
        return Dictionary(uniqueKeysWithValues: items.map { ($0.name, $0.value ?? "") })
    }

    func testEnableScheduler() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.scheduler.enableScheduler()

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/scheduler/enable")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testDisableScheduler() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.scheduler.disableScheduler()

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/scheduler/disable")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testGetSchedulerTasks() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.scheduler.getSchedulerTasks([
            "type": "EmailCampaign",
            "enabled": true,
            "pageSize": 20,
        ])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/scheduler/tasks")
        XCTAssertEqual(
            try query(mock),
            ["type": "EmailCampaign", "enabled": "true", "pageSize": "20"]
        )
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    func testGetSchedulerTask() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.scheduler.getSchedulerTask(["id": "tsk_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/scheduler/tasks/tsk_1")
        XCTAssertEqual(try query(mock), [:])
    }

    func testSaveSchedulerTask() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.scheduler.saveSchedulerTask([
            "name": "Weekly digest",
            "cron": "0 9 * * 1",
            "initiatorUserId": "usr_1",
            "isEnabled": true,
            "stopOnError": false,
            "task": [
                "type": "EmailCampaign",
                "campaign": [
                    "source": "AllUsers",
                    "templateId": "tmpl_1",
                ],
            ],
        ])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/scheduler/tasks")
        XCTAssertEqual(try query(mock), [:])
        let expected: [String: Any] = [
            "name": "Weekly digest",
            "cron": "0 9 * * 1",
            "initiatorUserId": "usr_1",
            "isEnabled": true,
            "stopOnError": false,
            "task": [
                "type": "EmailCampaign",
                "campaign": ["source": "AllUsers", "templateId": "tmpl_1"],
            ],
        ]
        XCTAssertEqual(try body(mock) as NSDictionary, expected as NSDictionary)
    }

    func testDeleteSchedulerTask() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.scheduler.deleteSchedulerTask(["id": "tsk_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "DELETE")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/scheduler/tasks/tsk_1")
        XCTAssertEqual(try query(mock), [:])
    }

    func testEnableSchedulerTask() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.scheduler.enableSchedulerTask(["id": "tsk_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/scheduler/tasks/tsk_1/enable")
        XCTAssertEqual(try query(mock), [:])
    }

    func testDisableSchedulerTask() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.scheduler.disableSchedulerTask(["id": "tsk_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v2/scheduler/tasks/tsk_1/disable")
        XCTAssertEqual(try query(mock), [:])
    }
}
