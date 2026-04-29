import XCTest
@testable import NorbixApi
import NorbixCore

final class MembershipModuleTests: XCTestCase {
    func testModuleSurface() async throws {
        let client = try NorbixApiClient(
            projectId: "proj",
            bearerToken: "token",
            executor: MockHTTPExecutor()
        )
        XCTAssertNotNil(client.membership)
    }
}
