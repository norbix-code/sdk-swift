import XCTest
@testable import NorbixHub
import NorbixCore

/// Every wave-3 route on `ai` and the method that calls it, checked on
/// the mock executor (verb, resolved path, auth and project headers). Never a
/// real gateway, never a real provider.
final class HubAiEmbeddingRoutesTests: XCTestCase {
    private typealias Case = (name: String, verb: String, path: String, call: (NorbixHubClient) async throws -> Void)

    private let cases: [Case] = [
            ("getEmbeddingIntegrations", "GET", "/v2/ai/integrations/embeddings", { c in _ = try await c.ai.getEmbeddingIntegrations(["probe": "value"]) }),
            ("saveEmbeddingIntegration", "POST", "/v2/ai/integrations/embeddings", { c in _ = try await c.ai.saveEmbeddingIntegration(["probe": "value"]) }),
            ("getEmbeddingIntegration", "GET", "/v2/ai/integrations/embeddings/id1", { c in _ = try await c.ai.getEmbeddingIntegration(["Id": "id1", "probe": "value"]) }),
            ("deleteEmbeddingIntegration", "DELETE", "/v2/ai/integrations/embeddings/id1", { c in _ = try await c.ai.deleteEmbeddingIntegration(["Id": "id1", "probe": "value"]) }),
            ("testEmbeddingIntegration", "POST", "/v2/ai/integrations/embeddings/id1/test", { c in _ = try await c.ai.testEmbeddingIntegration(["Id": "id1", "probe": "value"]) }),
            ("setLlmIntegrationAsDefault", "PUT", "/v2/ai/integrations/llms/id1/default", { c in _ = try await c.ai.setLlmIntegrationAsDefault(["Id": "id1", "probe": "value"]) }),
    ]

    func testEveryRouteHitsTheExpectedPathAndVerb() async throws {
        XCTAssertEqual(cases.count, 6)
        for c in cases {
            let mock = MockHTTPExecutor()
            mock.responseBody = Data(#"{"responseStatus":{}}"#.utf8)
            let client = try NorbixHubClient(projectId: "proj", bearerToken: "token", accountId: "acc", executor: mock)
            try await c.call(client)
            XCTAssertEqual(mock.lastRequest?.httpMethod, c.verb, c.name)
            XCTAssertEqual(mock.lastRequest?.url?.path, c.path, c.name)
            XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token", c.name)
            XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "X-CM-ProjectId"), "proj", c.name)
        }
    }
}
