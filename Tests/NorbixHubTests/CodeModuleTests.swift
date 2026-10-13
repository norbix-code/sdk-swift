import XCTest
@testable import NorbixHub
import NorbixCore

/// `hub.code` — every Code Hub endpoint (38: the module switch, the
/// integrations, the marketplace and the five cloud-function routes of
/// `Code.Functions.md`), against `MockHTTPExecutor` (the same fake-transport
/// pattern as `HubSchedulerModuleTests`). Never a real gateway. The table
/// checks the verb and the full path with every id substituted; the five
/// cloud-function tests also check where the parameters go (query / body).
final class HubCodeModuleTests: XCTestCase {

    private func makeClient(_ mock: MockHTTPExecutor) throws -> NorbixHubClient {
        try NorbixHubClient(
            projectId: "proj",
            bearerToken: "token",
            accountId: "acc",
            executor: mock
        )
    }

    private func body(_ mock: MockHTTPExecutor) throws -> [String: Any] {
        let data = try XCTUnwrap(mock.lastRequest?.httpBody)
        return try XCTUnwrap(JSONSerialization.jsonObject(with: data) as? [String: Any])
    }

    private func query(_ mock: MockHTTPExecutor) throws -> [String: String] {
        let url = try XCTUnwrap(mock.lastRequest?.url)
        let items = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems ?? []
        return Dictionary(uniqueKeysWithValues: items.map { ($0.name, $0.value ?? "") })
    }

    // (method name, verb, path with the ids substituted, the call)
    private typealias Route = (name: String, method: String, path: String, call: (CodeModule) async throws -> Any?)

    private let routes: [Route] = [
        ("enableCode", "PUT", "/v3/code/enable", { try await $0.enableCode([:]) }),
        ("disableCode", "PUT", "/v3/code/disable", { try await $0.disableCode([:]) }),
        ("getCodeIntegrations", "GET", "/v3/code/integrations", { try await $0.getCodeIntegrations([:]) }),
        ("getCodeIntegration", "GET", "/v3/code/integrations/int_1", { try await $0.getCodeIntegration(["id": "int_1"]) }),
        ("saveCodeIntegration", "POST", "/v3/code/integrations", { try await $0.saveCodeIntegration([:]) }),
        ("testCodeIntegration", "POST", "/v3/code/integrations/test", { try await $0.testCodeIntegration([:]) }),
        ("confirmCodeIntegrationHumanDelivery", "POST", "/v3/code/integrations/confirm-human-delivery", { try await $0.confirmCodeIntegrationHumanDelivery([:]) }),
        ("deleteCodeIntegration", "DELETE", "/v3/code/integrations/int_1", { try await $0.deleteCodeIntegration(["id": "int_1"]) }),
        ("enableCodeIntegration", "PUT", "/v3/code/integrations/int_1/enable", { try await $0.enableCodeIntegration(["id": "int_1"]) }),
        ("disableCodeIntegration", "PUT", "/v3/code/integrations/int_1/disable", { try await $0.disableCodeIntegration(["id": "int_1"]) }),
        ("getMarketplaceListings", "GET", "/v3/code/marketplace/listings", { try await $0.getMarketplaceListings([:]) }),
        ("getMarketplaceListing", "GET", "/v3/code/marketplace/listings/lst_1", { try await $0.getMarketplaceListing(["listingViewId": "lst_1"]) }),
        ("getMarketplaceListingFunctionTokens", "GET", "/v3/code/marketplace/listings/lst_1/functions/fn-key/tokens", { try await $0.getMarketplaceListingFunctionTokens(["listingViewId": "lst_1", "functionKey": "fn-key"]) }),
        ("getMarketplaceIntegrations", "GET", "/v3/code/marketplace/integrations", { try await $0.getMarketplaceIntegrations([:]) }),
        ("getMarketplaceIntegration", "GET", "/v3/code/marketplace/integrations/mpi_1", { try await $0.getMarketplaceIntegration(["integrationViewId": "mpi_1"]) }),
        ("saveMarketplaceIntegration", "POST", "/v3/code/marketplace/integrations", { try await $0.saveMarketplaceIntegration([:]) }),
        ("deleteMarketplaceIntegration", "DELETE", "/v3/code/marketplace/integrations/mpi_1", { try await $0.deleteMarketplaceIntegration(["integrationViewId": "mpi_1"]) }),
        ("enableMarketplaceIntegration", "POST", "/v3/code/marketplace/integrations/mpi_1/enable", { try await $0.enableMarketplaceIntegration(["integrationViewId": "mpi_1"]) }),
        ("disableMarketplaceIntegration", "POST", "/v3/code/marketplace/integrations/mpi_1/disable", { try await $0.disableMarketplaceIntegration(["integrationViewId": "mpi_1"]) }),
        ("testMarketplaceIntegration", "POST", "/v3/code/marketplace/integrations/mpi_1/test", { try await $0.testMarketplaceIntegration(["integrationViewId": "mpi_1"]) }),
        ("getMarketplaceIntegrationTools", "GET", "/v3/code/marketplace/integrations/mpi_1/tools", { try await $0.getMarketplaceIntegrationTools(["integrationViewId": "mpi_1"]) }),
        ("getMarketplaceIntegrationAccess", "GET", "/v3/code/marketplace/integrations/mpi_1/access", { try await $0.getMarketplaceIntegrationAccess(["integrationViewId": "mpi_1"]) }),
        ("setMarketplaceIntegrationRoleAccess", "PUT", "/v3/code/marketplace/integrations/mpi_1/access/roles", { try await $0.setMarketplaceIntegrationRoleAccess(["integrationViewId": "mpi_1"]) }),
        ("saveMarketplaceIntegrationCustomAccess", "POST", "/v3/code/marketplace/integrations/mpi_1/access/roles/custom", { try await $0.saveMarketplaceIntegrationCustomAccess(["integrationViewId": "mpi_1"]) }),
        ("startMarketplaceIntegrationSignIn", "POST", "/v3/code/marketplace/integrations/mpi_1/oauth/start", { try await $0.startMarketplaceIntegrationSignIn(["integrationViewId": "mpi_1"]) }),
        ("signOutMarketplaceIntegration", "POST", "/v3/code/marketplace/integrations/mpi_1/oauth/sign-out", { try await $0.signOutMarketplaceIntegration(["integrationViewId": "mpi_1"]) }),
        ("replaceMarketplaceIntegrationSecrets", "PUT", "/v3/code/marketplace/integrations/mpi_1/secrets", { try await $0.replaceMarketplaceIntegrationSecrets(["integrationViewId": "mpi_1"]) }),
        ("revealMarketplaceIntegrationSecrets", "POST", "/v3/code/marketplace/integrations/mpi_1/secrets/reveal", { try await $0.revealMarketplaceIntegrationSecrets(["integrationViewId": "mpi_1"]) }),
        ("setMarketplaceIntegrationTokenMappings", "PUT", "/v3/code/marketplace/integrations/mpi_1/token-mappings", { try await $0.setMarketplaceIntegrationTokenMappings(["integrationViewId": "mpi_1"]) }),
        ("getMarketplaceFunctionCatalog", "GET", "/v3/code/marketplace/integrations/mpi_1/catalog", { try await $0.getMarketplaceFunctionCatalog(["integrationViewId": "mpi_1"]) }),
        ("getMarketplaceFunctions", "GET", "/v3/code/marketplace/integrations/mpi_1/functions", { try await $0.getMarketplaceFunctions(["integrationViewId": "mpi_1"]) }),
        ("getMarketplaceFunction", "GET", "/v3/code/marketplace/integrations/mpi_1/functions/mpf_1", { try await $0.getMarketplaceFunction(["integrationViewId": "mpi_1", "functionViewId": "mpf_1"]) }),
        ("saveMarketplaceFunction", "POST", "/v3/code/marketplace/integrations/mpi_1/functions", { try await $0.saveMarketplaceFunction(["integrationViewId": "mpi_1"]) }),
        ("deleteMarketplaceFunction", "DELETE", "/v3/code/marketplace/integrations/mpi_1/functions/mpf_1", { try await $0.deleteMarketplaceFunction(["integrationViewId": "mpi_1", "functionViewId": "mpf_1"]) }),
        ("enableMarketplaceFunction", "POST", "/v3/code/marketplace/integrations/mpi_1/functions/mpf_1/enable", { try await $0.enableMarketplaceFunction(["integrationViewId": "mpi_1", "functionViewId": "mpf_1"]) }),
        ("disableMarketplaceFunction", "POST", "/v3/code/marketplace/integrations/mpi_1/functions/mpf_1/disable", { try await $0.disableMarketplaceFunction(["integrationViewId": "mpi_1", "functionViewId": "mpf_1"]) }),
        ("getMarketplaceFunctionTokens", "GET", "/v3/code/marketplace/integrations/mpi_1/functions/mpf_1/tokens", { try await $0.getMarketplaceFunctionTokens(["integrationViewId": "mpi_1", "functionViewId": "mpf_1"]) }),
        ("invokeMarketplaceFunction", "POST", "/v3/code/marketplace/functions/mpf_1/invoke", { try await $0.invokeMarketplaceFunction(["functionViewId": "mpf_1"]) }),
        ("getMarketplaceFunctionRuns", "GET", "/v3/code/marketplace/functions/runs", { try await $0.getMarketplaceFunctionRuns([:]) }),
        ("getCodeFunctions", "GET", "/v3/code/functions", { try await $0.getCodeFunctions([:]) }),
        ("getCodeFunctionQualifiers", "GET", "/v3/code/functions/qualifiers", { try await $0.getCodeFunctionQualifiers([:]) }),
        ("invokeCodeFunction", "POST", "/v3/code/functions/invoke", { try await $0.invokeCodeFunction([:]) }),
        ("getCodeFunctionEventSample", "GET", "/v3/code/functions/event-sample", { try await $0.getCodeFunctionEventSample([:]) }),
        ("getCodeFunctionRuns", "GET", "/v3/code/functions/runs", { try await $0.getCodeFunctionRuns([:]) }),
    ]

    func testEveryRouteVerbAndPath() async throws {
        XCTAssertEqual(routes.count, 44)
        XCTAssertEqual(Set(routes.map { $0.name }).count, 44)

        for route in routes {
            let mock = MockHTTPExecutor()
            let client = try makeClient(mock)

            _ = try await route.call(client.code)

            XCTAssertEqual(mock.lastRequest?.httpMethod, route.method, route.name)
            XCTAssertEqual(mock.lastRequest?.url?.path, route.path, route.name)
            XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token", route.name)
        }
    }

    func testGetCodeFunctions() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.code.getCodeFunctions([
            "integrationId": "int_1",
            "prefix": "orders-",
            "tag": "team=orders",
            "pageSize": 50,
        ])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/code/functions")
        XCTAssertEqual(
            try query(mock),
            ["integrationId": "int_1", "prefix": "orders-", "tag": "team=orders", "pageSize": "50"]
        )
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    func testGetCodeFunctionQualifiers() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.code.getCodeFunctionQualifiers([
            "integrationId": "int_1",
            "functionId": "orders-on-update",
        ])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/code/functions/qualifiers")
        XCTAssertEqual(try query(mock), ["integrationId": "int_1", "functionId": "orders-on-update"])
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    func testInvokeCodeFunction() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.code.invokeCodeFunction([
            "functionRef": [
                "integrationId": "int_1",
                "functionId": "orders-on-update",
                "qualifier": "prod",
            ],
            "payload": ["orderId": "6ac54a59212c29912eaddd81", "dryRun": true],
            "invocationType": "Sync",
            "runAsUserId": "usr_svc",
        ])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/code/functions/invoke")
        XCTAssertEqual(try query(mock), [:])
        let sent = try body(mock)
        let ref = try XCTUnwrap(sent["functionRef"] as? [String: Any])
        XCTAssertEqual(ref["integrationId"] as? String, "int_1")
        XCTAssertEqual(ref["functionId"] as? String, "orders-on-update")
        XCTAssertEqual(ref["qualifier"] as? String, "prod")
        let payload = try XCTUnwrap(sent["payload"] as? [String: Any])
        XCTAssertEqual(payload["orderId"] as? String, "6ac54a59212c29912eaddd81")
        XCTAssertEqual(payload["dryRun"] as? Bool, true)
        XCTAssertEqual(sent["invocationType"] as? String, "Sync")
        XCTAssertEqual(sent["runAsUserId"] as? String, "usr_svc")
    }

    func testGetCodeFunctionEventSample() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.code.getCodeFunctionEventSample([
            "source": "database",
            "event": "database.record.updated",
            "schemaId": "sch_1",
        ])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/code/functions/event-sample")
        XCTAssertEqual(
            try query(mock),
            ["source": "database", "event": "database.record.updated", "schemaId": "sch_1"]
        )
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    func testGetCodeFunctionRuns() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.code.getCodeFunctionRuns(["triggerId": "trg_1", "limit": 5])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/code/functions/runs")
        XCTAssertEqual(try query(mock), ["triggerId": "trg_1", "limit": "5"])
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    func testGetMarketplaceFunctionRuns() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.code.getMarketplaceFunctionRuns(["taskId": "tsk_9", "limit": 5])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/code/marketplace/functions/runs")
        XCTAssertEqual(try query(mock), ["taskId": "tsk_9", "limit": "5"])
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    /// Exactly one of functionId / triggerId / taskId (gateway item gw-runs): a function's own runs.
    func testMarketplaceFunctionRunsByFunctionIdGoInTheQuery() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.code.getMarketplaceFunctionRuns(["functionId": "func_1p4R3gTobGZpD6fXvHT4rd", "limit": 50])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/code/marketplace/functions/runs")
        XCTAssertEqual(try query(mock), ["functionId": "func_1p4R3gTobGZpD6fXvHT4rd", "limit": "50"])
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    /// The stored MCP tool catalog of a connection (gateway item mcp-step1, route 24):
    /// the id goes into the path, nothing on the query, no body.
    func testMarketplaceIntegrationToolsPutTheIdInThePath() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.code.getMarketplaceIntegrationTools(["integrationViewId": "int_7Hq2mcpServer"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/code/marketplace/integrations/int_7Hq2mcpServer/tools")
        XCTAssertEqual(try query(mock), [:])
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    /// The access matrix of a connection (gateway item access, route 25):
    /// the id goes into the path, nothing on the query, no body.
    func testMarketplaceIntegrationAccessPutsTheIdInThePath() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.code.getMarketplaceIntegrationAccess(["integrationViewId": "int_6Qp1dW2kRm8NsT4vYc0Hb"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/code/marketplace/integrations/int_6Qp1dW2kRm8NsT4vYc0Hb/access")
        XCTAssertEqual(try query(mock), [:])
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    /// A role package (route 26): the id in the path, the role, package and Manage flag in the JSON body.
    func testSetMarketplaceIntegrationRoleAccessSendsTheRoleInTheBody() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.code.setMarketplaceIntegrationRoleAccess([
            "integrationViewId": "int_6Qp1dW2kRm8NsT4vYc0Hb",
            "roleId": "acc_6Qp1dW2kRm8NsT4vYc0Hb_nr_3kLm9QwErTyU",
            "package": "ReadOnly",
            "manage": false,
        ])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "PUT")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/code/marketplace/integrations/int_6Qp1dW2kRm8NsT4vYc0Hb/access/roles")
        XCTAssertEqual(try query(mock), [:])
        let sent = try body(mock)
        XCTAssertNil(sent["integrationViewId"])
        XCTAssertEqual(sent["roleId"] as? String, "acc_6Qp1dW2kRm8NsT4vYc0Hb_nr_3kLm9QwErTyU")
        XCTAssertEqual(sent["package"] as? String, "ReadOnly")
        XCTAssertEqual(sent["manage"] as? Bool, false)
    }

    /// A custom access policy (route 27): the id in the path, the ticks in the JSON body.
    func testSaveMarketplaceIntegrationCustomAccessSendsTheTicksInTheBody() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.code.saveMarketplaceIntegrationCustomAccess([
            "integrationViewId": "int_6Qp1dW2kRm8NsT4vYc0Hb",
            "roleId": "acc_6Qp1dW2kRm8NsT4vYc0Hb_nr_3kLm9QwErTyU",
            "basePackage": "ReadOnly",
            "tools": ["create_issue"],
            "functions": ["func_4hT2b9QkLm3XcT1yRfGh7a"],
            "manage": false,
            "newPolicyForThisRoleOnly": true,
        ])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/code/marketplace/integrations/int_6Qp1dW2kRm8NsT4vYc0Hb/access/roles/custom")
        XCTAssertEqual(try query(mock), [:])
        let sent = try body(mock)
        XCTAssertNil(sent["integrationViewId"])
        XCTAssertEqual(sent["roleId"] as? String, "acc_6Qp1dW2kRm8NsT4vYc0Hb_nr_3kLm9QwErTyU")
        XCTAssertEqual(sent["basePackage"] as? String, "ReadOnly")
        XCTAssertEqual(sent["tools"] as? [String], ["create_issue"])
        XCTAssertEqual(sent["functions"] as? [String], ["func_4hT2b9QkLm3XcT1yRfGh7a"])
        XCTAssertEqual(sent["manage"] as? Bool, false)
        XCTAssertEqual(sent["newPolicyForThisRoleOnly"] as? Bool, true)
    }

    /// The OAuth sign-in start of an MCP connection (gateway item oauth, route 28):
    /// a POST with the id in the path, nothing on the query and no body.
    func testStartMarketplaceIntegrationSignInPutsTheIdInThePath() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.code.startMarketplaceIntegrationSignIn(["integrationViewId": "int_6Qp1dW2kRm8NsT4vYc0Hb"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/code/marketplace/integrations/int_6Qp1dW2kRm8NsT4vYc0Hb/oauth/start")
        XCTAssertEqual(try query(mock), [:])
        XCTAssertNil(mock.lastRequest?.httpBody)
    }

    /// The OAuth sign-out of an MCP connection (gateway item access-2b, route 30):
    /// a POST with the id in the path, nothing on the query and no body.
    func testSignOutMarketplaceIntegrationPutsTheIdInThePath() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.code.signOutMarketplaceIntegration(["integrationViewId": "int_6Qp1dW2kRm8NsT4vYc0Hb"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/code/marketplace/integrations/int_6Qp1dW2kRm8NsT4vYc0Hb/oauth/sign-out")
        XCTAssertEqual(try query(mock), [:])
        XCTAssertNil(mock.lastRequest?.httpBody)
    }
}
