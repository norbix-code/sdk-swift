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
            ("enableDatabase", "/v2/database/enable", { _ = try await $0.database.enableDatabase() }),
            ("disableDatabase", "/v2/database/disable", { _ = try await $0.database.disableDatabase() }),
            ("enableFiles", "/v2/files/enable", { _ = try await $0.files.enableFiles() }),
            ("disableFiles", "/v2/files/disable", { _ = try await $0.files.disableFiles() }),
            ("enablePush", "/v2/notifications/push/enable", { _ = try await $0.notifications.enablePush() }),
            ("disablePush", "/v2/notifications/push/disable", { _ = try await $0.notifications.disablePush() }),
            ("enableSms", "/v2/notifications/sms/enable", { _ = try await $0.notifications.enableSms() }),
            ("disableSms", "/v2/notifications/sms/disable", { _ = try await $0.notifications.disableSms() }),
            ("enableEmail", "/v2/notifications/email/enable", { _ = try await $0.notifications.enableEmail() }),
            ("disableEmail", "/v2/notifications/email/disable", { _ = try await $0.notifications.disableEmail() }),
            ("enablePayments", "/v2/payments/enable", { _ = try await $0.payments.enablePayments() }),
            ("disablePayments", "/v2/payments/disable", { _ = try await $0.payments.disablePayments() }),
            ("enableLogging", "/v2/logs/enable", { _ = try await $0.logs.enableLogging() }),
            ("disableLogging", "/v2/logs/disable", { _ = try await $0.logs.disableLogging() }),
            ("enableMembership", "/v2/membership/enable", { _ = try await $0.membership.enableMembership() }),
            ("disableMembership", "/v2/membership/disable", { _ = try await $0.membership.disableMembership() }),
            ("enableScheduler", "/v2/scheduler/enable", { _ = try await $0.scheduler.enableScheduler() }),
            ("disableScheduler", "/v2/scheduler/disable", { _ = try await $0.scheduler.disableScheduler() }),
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
