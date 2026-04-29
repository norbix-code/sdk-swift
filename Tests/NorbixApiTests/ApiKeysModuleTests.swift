import XCTest
@testable import NorbixApi
import NorbixCore

final class ApiKeysModuleTests: XCTestCase {
    func testModuleSurface() async throws {
        let client = try NorbixApiClient(
            projectId: "proj",
            bearerToken: "token",
            executor: MockHTTPExecutor()
        )
        XCTAssertNotNil(client.apiKeys)
    }
}
