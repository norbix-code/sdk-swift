import XCTest
@testable import NorbixHub
import NorbixCore

final class HubIntegrationsModuleTests: XCTestCase {
    func testModuleSurface() async throws {
        let client = try NorbixHubClient(projectId: "proj", bearerToken: "token", accountId: "acc", executor: MockHTTPExecutor())
        XCTAssertNotNil(client.integrations)
    }

    /// GET /{version}/integrations/keyless/setup (gateway feat/keyless-cloud): verb, path,
    /// module / cloud / integration id on the query, no body, and the answer.
    func testGetKeylessIntegrationSetupSendsAGetWithTheQuery() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"integrationId":"int_1","module":"files","cloud":"aws","available":true,"subject":"p/proj/e/PROD/files/i/int_1","audience":"sts.amazonaws.com","script":"aws iam create-role ...","templates":[{"kind":"terraform","fileName":"norbix-files-aws.tf","content":"resource \"aws_iam_role\" ..."}]}"#.utf8)
        let client = try NorbixHubClient(projectId: "proj", bearerToken: "token", accountId: "acc", executor: mock)

        let result = try await client.integrations.getKeylessIntegrationSetup(["module": "files", "cloud": "aws", "integrationId": "int_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/integrations/keyless/setup")
        let items = URLComponents(url: try XCTUnwrap(mock.lastRequest?.url), resolvingAgainstBaseURL: false)?.queryItems ?? []
        let query = Dictionary(items.map { ($0.name, $0.value ?? "") }, uniquingKeysWith: { a, _ in a })
        XCTAssertEqual(query["module"], "files")
        XCTAssertEqual(query["cloud"], "aws")
        XCTAssertEqual(query["integrationId"], "int_1")
        XCTAssertNil(mock.lastRequest?.httpBody)
        let answer = try XCTUnwrap(result as? [String: Any])
        XCTAssertEqual(answer["subject"] as? String, "p/proj/e/PROD/files/i/int_1")
        XCTAssertEqual(answer["available"] as? Bool, true)
        let template = try XCTUnwrap((answer["templates"] as? [[String: Any]])?.first)
        XCTAssertEqual(template["kind"] as? String, "terraform")
        XCTAssertEqual(template["fileName"] as? String, "norbix-files-aws.tf")
        XCTAssertEqual(template["content"] as? String, #"resource "aws_iam_role" ..."#)
    }
}
