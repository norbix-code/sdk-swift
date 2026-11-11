import XCTest
@testable import NorbixHub
import NorbixCore

/// Managed Service bundles and the account's Flex clusters with a token only (no `accountId`),
/// checked on the mock executor (verb, resolved path, query, auth header, body). Never a real
/// gateway.
final class HubAccountBundlesFlexClustersRoutesTests: XCTestCase {
    private func makeClient(_ mock: MockHTTPExecutor) throws -> NorbixHubClient {
        mock.responseBody = Data(#"{"responseStatus":{}}"#.utf8)
        return try NorbixHubClient(projectId: "proj", bearerToken: "token", executor: mock)
    }

    private func body(_ mock: MockHTTPExecutor) throws -> [String: Any] {
        let data = try XCTUnwrap(mock.lastRequest?.httpBody)
        return try XCTUnwrap(JSONSerialization.jsonObject(with: data) as? [String: Any])
    }

    func testGetManagedServiceBundles() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.account.getManagedServiceBundles()

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/account/stripe/bundles")
        XCTAssertNil(mock.lastRequest?.url?.query)
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testChangeManagedServiceBundleSendsBundleAndBillingPeriodInTheBody() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.account.changeManagedServiceBundle(["bundle": "Growth", "billingPeriod": "Annual"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/account/stripe/change-bundle")
        XCTAssertNil(mock.lastRequest?.url?.query)
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
        let sent = try body(mock)
        XCTAssertEqual(sent.count, 2)
        XCTAssertEqual(sent["bundle"] as? String, "Growth")
        XCTAssertEqual(sent["billingPeriod"] as? String, "Annual")
    }

    func testGetFlexClusters() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.account.getFlexClusters()

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/account/flex-clusters")
        XCTAssertNil(mock.lastRequest?.url?.query)
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testUpgradeFlexClusterPutsTheIdInThePathAndTierCodeInTheBody() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.account.upgradeFlexCluster(["flexClusterId": "fc_1", "tierCode": "M10"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/account/flex-clusters/fc_1/upgrade")
        XCTAssertNil(mock.lastRequest?.url?.query)
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
        let sent = try body(mock)
        XCTAssertEqual(sent.count, 1)
        XCTAssertEqual(sent["tierCode"] as? String, "M10")
    }

    func testCreateStripeCheckoutSessionSendsBundleAndBillingPeriodInTheBody() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.account.createStripeCheckoutSession([
            "subscriptionType": "ManagedService", "bundle": "Starter", "billingPeriod": "Monthly",
        ])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/account/stripe/create-checkout-session")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
        let sent = try body(mock)
        XCTAssertEqual(sent.count, 3)
        XCTAssertEqual(sent["subscriptionType"] as? String, "ManagedService")
        XCTAssertEqual(sent["bundle"] as? String, "Starter")
        XCTAssertEqual(sent["billingPeriod"] as? String, "Monthly")
    }
}
