import XCTest
@testable import NorbixHub
import NorbixCore

/// `client.logs` — the log routes (gateway campaign audit/logging, Logs stage
/// A and finding L12), through the mock executor: verb, path, path param,
/// query and body.
final class HubLogsModuleTests: XCTestCase {
    private func makeClient(_ mock: MockHTTPExecutor) throws -> NorbixHubClient {
        try NorbixHubClient(projectId: "proj", bearerToken: "token", accountId: "acc", executor: mock)
    }

    private func query(_ mock: MockHTTPExecutor) throws -> [String: String] {
        let url = try XCTUnwrap(mock.lastRequest?.url)
        let items = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems ?? []
        return Dictionary(items.map { ($0.name, $0.value ?? "") }, uniquingKeysWith: { a, _ in a })
    }

    private func jsonBody(_ mock: MockHTTPExecutor) throws -> [String: Any] {
        let body = try XCTUnwrap(mock.lastRequest?.httpBody)
        return try XCTUnwrap(JSONSerialization.jsonObject(with: body) as? [String: Any])
    }

    func testModuleSurface() async throws {
        let client = try NorbixHubClient(
            projectId: "proj",
            bearerToken: "token",
            accountId: "acc",
            executor: MockHTTPExecutor()
        )
        XCTAssertNotNil(client.logs)
    }

    func testGetLogsSendsAGetWithFiltersAndPagingOnTheQuery() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"list":{"items":[],"hasMore":false}}"#.utf8)
        let client = try makeClient(mock)

        let res = try await client.logs.getLogs([
            "level": "Error",
            "logCorrelationId": "corr_1",
            "eventCode": "app:order:paid",
            "pageSize": 20,
            "startingAfter": "cur_1"
        ]) as? [String: Any]

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/logs")
        XCTAssertEqual(try query(mock), [
            "level": "Error",
            "logCorrelationId": "corr_1",
            "eventCode": "app:order:paid",
            "pageSize": "20",
            "startingAfter": "cur_1"
        ])
        XCTAssertNil(mock.lastRequest?.httpBody)
        XCTAssertNotNil(res?["list"])
    }

    func testGetLogPutsTheIdInThePath() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"item":{"id":"6650f0c2a1b2c3d4e5f60718","title":"t"}}"#.utf8)
        let client = try makeClient(mock)

        let res = try await client.logs.getLog(["id": "6650f0c2a1b2c3d4e5f60718"]) as? [String: Any]

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/logs/6650f0c2a1b2c3d4e5f60718")
        XCTAssertNil(mock.lastRequest?.url?.query)
        XCTAssertEqual((res?["item"] as? [String: Any])?["title"] as? String, "t")
    }

    func testGetLogsByCorrelationIdSendsTargetCorrelationIdOnTheQuery() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"items":[]}"#.utf8)
        let client = try makeClient(mock)

        _ = try await client.logs.getLogsByCorrelationId(["targetCorrelationId": "corr_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/logs/audit")
        XCTAssertEqual(try query(mock), ["targetCorrelationId": "corr_1"])
    }

    func testCleanLogsPostsToClean() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.logs.cleanLogs()

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/logs/clean")
    }

    func testGetLogSettingsReadsTheFlags() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"skipCloudDashboardLogs":true,"skipHttpBodyMeta":false,"aiChatLoggingEnabled":false,"hasNorbixLogging":true}"#.utf8)
        let client = try makeClient(mock)

        let res = try await client.logs.getLogSettings() as? [String: Any]

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/logs/settings")
        XCTAssertEqual(res?["hasNorbixLogging"] as? Bool, true)
    }

    func testSaveLogSettingsPostsTheFlagsInTheBody() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.logs.saveLogSettings(["skipCloudDashboardLogs": true, "aiChatLoggingEnabled": true])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/logs/settings")
        let json = try jsonBody(mock)
        XCTAssertEqual(json["skipCloudDashboardLogs"] as? Bool, true)
        XCTAssertEqual(json["aiChatLoggingEnabled"] as? Bool, true)
        XCTAssertNil(json["skipHttpBodyMeta"])
    }

    func testTestLoggingIntegrationPostsTheIntegrationId() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"isSuccess":true}"#.utf8)
        let client = try makeClient(mock)

        _ = try await client.logs.testLoggingIntegration(["integrationId": "int_mongo"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/logs/integrations/test")
        XCTAssertEqual(try jsonBody(mock)["integrationId"] as? String, "int_mongo")
    }
}
