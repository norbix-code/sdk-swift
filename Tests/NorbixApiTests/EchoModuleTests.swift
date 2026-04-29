import XCTest
@testable import NorbixApi
import NorbixCore

final class EchoModuleTests: XCTestCase {
    func testModuleSurface() async throws {
        let client = try NorbixApiClient(
            projectId: "proj",
            bearerToken: "token",
            executor: MockHTTPExecutor()
        )
        XCTAssertNotNil(client.echo)
    }
}
