import XCTest
@testable import NorbixHub
import NorbixCore

/// Bundle discount codes with a token only (no `accountId`), checked on the mock executor
/// (verb, resolved path, query, auth header, body), plus a refused code reaching the caller with
/// its code and reason. Never a real gateway.
final class HubAccountBundleDiscountsRoutesTests: XCTestCase {
    private func makeClient(_ mock: MockHTTPExecutor) throws -> NorbixHubClient {
        mock.responseBody = Data(#"{"responseStatus":{}}"#.utf8)
        return try NorbixHubClient(projectId: "proj", bearerToken: "token", executor: mock)
    }

    private func body(_ mock: MockHTTPExecutor) throws -> [String: Any] {
        let data = try XCTUnwrap(mock.lastRequest?.httpBody)
        return try XCTUnwrap(JSONSerialization.jsonObject(with: data) as? [String: Any])
    }

    func testCheckBundleDiscountSendsCodeBundleAndBillingPeriodInTheBody() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.account.checkBundleDiscount([
            "code": "LAUNCH30", "bundle": "Growth", "billingPeriod": "Monthly",
        ])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/account/stripe/discount/check")
        XCTAssertNil(mock.lastRequest?.url?.query)
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
        let sent = try body(mock)
        XCTAssertEqual(sent.count, 3)
        XCTAssertEqual(sent["code"] as? String, "LAUNCH30")
        XCTAssertEqual(sent["bundle"] as? String, "Growth")
        XCTAssertEqual(sent["billingPeriod"] as? String, "Monthly")
    }

    func testCheckBundleDiscountHandsBackTheDiscount() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)
        mock.responseBody = Data(#"{"discount":{"code":"LAUNCH30","percentOff":30,"months":3},"responseStatus":{}}"#.utf8)

        let answer = try await client.account.checkBundleDiscount(["code": "LAUNCH30"])

        let map = try XCTUnwrap(answer as? [String: Any])
        let discount = try XCTUnwrap(map["discount"] as? [String: Any])
        XCTAssertEqual(discount["code"] as? String, "LAUNCH30")
        XCTAssertEqual((discount["percentOff"] as? NSNumber)?.intValue, 30)
        XCTAssertEqual((discount["months"] as? NSNumber)?.intValue, 3)
    }

    func testApplyBundleDiscountSendsOnlyTheCodeInTheBody() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.account.applyBundleDiscount(["code": "LAUNCH30"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/account/stripe/discount")
        XCTAssertNil(mock.lastRequest?.url?.query)
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
        let sent = try body(mock)
        XCTAssertEqual(sent.count, 1)
        XCTAssertEqual(sent["code"] as? String, "LAUNCH30")
    }

    func testCreateStripeCheckoutSessionSendsTheDiscountCodeInTheBody() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.account.createStripeCheckoutSession([
            "subscriptionType": "ManagedService", "bundle": "Growth", "billingPeriod": "Monthly",
            "discountCode": "LAUNCH30",
        ])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/account/stripe/create-checkout-session")
        let sent = try body(mock)
        XCTAssertEqual(sent.count, 4)
        XCTAssertEqual(sent["discountCode"] as? String, "LAUNCH30")
    }

    func testARefusedCodeReachesTheCallerWithItsCodeAndReason() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)
        mock.responseStatus = 400
        mock.responseBody = Data(#"""
        {"responseStatus":{"errorCode":"CM-ERRORS-ACCOUNT-027","message":"This discount code cannot be used.","errors":[{"errorCode":"CM-ERRORS-ACCOUNT-027","message":"This discount code cannot be used.","context":{"reason":"already_used"}}]}}
        """#.utf8)

        do {
            _ = try await client.account.applyBundleDiscount(["code": "LAUNCH30"])
            XCTFail("expected a refused code to throw")
        } catch let error as NorbixError {
            XCTAssertEqual(error.status, 400)
            XCTAssertEqual(error.code, "CM-ERRORS-ACCOUNT-027")
            XCTAssertEqual(error.errors.first?.errorCode, "CM-ERRORS-ACCOUNT-027")
            XCTAssertEqual(error.errors.first?.context["reason"], "already_used")
        }
        XCTAssertEqual(mock.capturedRequests.count, 1)
    }
}
