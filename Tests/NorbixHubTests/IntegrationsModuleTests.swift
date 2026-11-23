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

    /// GET /{version}/integrations/{IntegrationId}/secrets: the id in the path, env on
    /// the query, and rows without any value.
    func testGetIntegrationSecretsPutsTheIdInThePath() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"result":[{"key":"secretKey","field":"secretKey","isSet":true,"isOptional":false},{"key":"webhookSigningSecret","field":"webhookSigningSecret","isSet":false,"isOptional":true}]}"#.utf8)
        let client = try NorbixHubClient(projectId: "proj", bearerToken: "token", accountId: "acc", executor: mock)

        let result = try await client.integrations.getIntegrationSecrets("int_1", env: "TEST")

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/integrations/int_1/secrets")
        let items = URLComponents(url: try XCTUnwrap(mock.lastRequest?.url), resolvingAgainstBaseURL: false)?.queryItems ?? []
        XCTAssertTrue(items.contains(URLQueryItem(name: "env", value: "TEST")))
        let rows = try XCTUnwrap((result as? [String: Any])?["result"] as? [[String: Any]])
        XCTAssertEqual(rows.count, 2)
        XCTAssertEqual(rows[0]["key"] as? String, "secretKey")
        XCTAssertEqual(rows[0]["isSet"] as? Bool, true)
        XCTAssertEqual(rows[1]["isOptional"] as? Bool, true)
    }

    /// POST /{version}/integrations/{IntegrationId}/secrets/remove: the keys in the body.
    func testRemoveIntegrationSecretsSendsTheKeys() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"id":"int_1"}"#.utf8)
        let client = try NorbixHubClient(projectId: "proj", bearerToken: "token", accountId: "acc", executor: mock)

        let result = try await client.integrations.removeIntegrationSecrets("int_1", keys: ["webhookSigningSecret"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/integrations/int_1/secrets/remove")
        let body = try XCTUnwrap(JSONSerialization.jsonObject(with: try XCTUnwrap(mock.lastRequest?.httpBody)) as? [String: Any])
        XCTAssertEqual(body["keys"] as? [String], ["webhookSigningSecret"])
        XCTAssertNil(body["IntegrationId"])
        XCTAssertEqual((result as? [String: Any])?["id"] as? String, "int_1")
    }
}
