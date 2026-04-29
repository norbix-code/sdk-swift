import XCTest
@testable import NorbixHub
import NorbixCore

final class HubNotificationsModuleTests: XCTestCase {
    func testModuleSurface() async throws {
        let client = try NorbixHubClient(
            projectId: "proj",
            bearerToken: "token",
            accountId: "acc",
            executor: MockHTTPExecutor()
        )
        XCTAssertNotNil(client.notifications)
    }
}
