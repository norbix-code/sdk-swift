import XCTest
@testable import NorbixHub
import NorbixCore

/// Every module switch (enable / disable a whole module for a project) is a
/// PUT. The gateway moved these routes from GET to PUT; it still answers a
/// GET on the same path for a while, but marks it deprecated. Each case
/// calls the SDK method against the fake transport and checks the verb and
/// the path. No real server is called.
final class ModuleEnableDisableVerbTests: XCTestCase {

    private func makeClient(_ mock: MockHTTPExecutor) throws -> NorbixHubClient {
        try NorbixHubClient(
            projectId: "proj",
            bearerToken: "token",
            accountId: "acc",
            executor: mock
        )
    }

    private typealias Call = (NorbixHubClient) async throws -> Void

    private var cases: [(name: String, path: String, call: Call)] {
        [
            ("enableDatabase", "/v3/database/enable", { _ = try await $0.database.enableDatabase() }),
            ("disableDatabase", "/v3/database/disable", { _ = try await $0.database.disableDatabase() }),
            ("enableFiles", "/v3/files/enable", { _ = try await $0.files.enableFiles() }),
            ("disableFiles", "/v3/files/disable", { _ = try await $0.files.disableFiles() }),
            ("enablePush", "/v3/notifications/push/enable", { _ = try await $0.notifications.enablePush() }),
            ("disablePush", "/v3/notifications/push/disable", { _ = try await $0.notifications.disablePush() }),
            ("enableSms", "/v3/notifications/sms/enable", { _ = try await $0.notifications.enableSms() }),
            ("disableSms", "/v3/notifications/sms/disable", { _ = try await $0.notifications.disableSms() }),
            ("enableEmail", "/v3/notifications/email/enable", { _ = try await $0.notifications.enableEmail() }),
            ("disableEmail", "/v3/notifications/email/disable", { _ = try await $0.notifications.disableEmail() }),
            ("enablePayments", "/v3/payments/enable", { _ = try await $0.payments.enablePayments() }),
            ("disablePayments", "/v3/payments/disable", { _ = try await $0.payments.disablePayments() }),
            ("enableLogging", "/v3/logs/enable", { _ = try await $0.logs.enableLogging() }),
            ("disableLogging", "/v3/logs/disable", { _ = try await $0.logs.disableLogging() }),
            ("enableMembership", "/v3/membership/enable", { _ = try await $0.membership.enableMembership() }),
            ("disableMembership", "/v3/membership/disable", { _ = try await $0.membership.disableMembership() }),
            ("enableScheduler", "/v3/scheduler/enable", { _ = try await $0.scheduler.enableScheduler() }),
            ("disableScheduler", "/v3/scheduler/disable", { _ = try await $0.scheduler.disableScheduler() }),
        ]
    }

    func testEveryModuleSwitchSendsPut() async throws {
        for c in cases {
            let mock = MockHTTPExecutor()
            try await c.call(try makeClient(mock))
            XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT", c.name)
            XCTAssertEqual(mock.lastRequest?.url?.path, c.path, c.name)
        }
    }
}
