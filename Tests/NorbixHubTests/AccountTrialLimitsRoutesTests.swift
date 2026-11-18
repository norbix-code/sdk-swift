import XCTest
@testable import NorbixHub
import NorbixCore

/// Trial limits with a token only (no `accountId`), checked on the mock executor (verb, resolved
/// path, query, auth header, body), plus a full region failing the trial checkout reaching the
/// caller with its code. Never a real gateway.
final class HubAccountTrialLimitsRoutesTests: XCTestCase {
    private func makeClient(_ mock: MockHTTPExecutor) throws -> NorbixHubClient {
        mock.responseBody = Data(#"{"responseStatus":{}}"#.utf8)
        return try NorbixHubClient(projectId: "proj", bearerToken: "token", executor: mock)
    }

    private func body(_ mock: MockHTTPExecutor) throws -> [String: Any] {
        let data = try XCTUnwrap(mock.lastRequest?.httpBody)
        return try XCTUnwrap(JSONSerialization.jsonObject(with: data) as? [String: Any])
    }

    func testGetTrialAvailabilitySendsTheRegionInTheQuery() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.account.getTrialAvailability(["region": "nb-eu-germany"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/account/trial-availability")
        XCTAssertEqual(mock.lastRequest?.url?.query, "region=nb-eu-germany")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
    }

    func testGetTrialAvailabilityHandsBackTheAnswer() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)
        mock.responseBody = Data(#"{"limitsOn":true,"region":"nb-eu-germany","trialsOpen":false,"waitlistOpen":true,"onWaitlist":false,"refusal":"","responseStatus":{}}"#.utf8)

        let answer = try await client.account.getTrialAvailability(["region": "nb-eu-germany"])

        let map = try XCTUnwrap(answer as? [String: Any])
        XCTAssertEqual(map["limitsOn"] as? Bool, true)
        XCTAssertEqual(map["region"] as? String, "nb-eu-germany")
        XCTAssertEqual(map["trialsOpen"] as? Bool, false)
        XCTAssertEqual(map["waitlistOpen"] as? Bool, true)
        XCTAssertEqual(map["onWaitlist"] as? Bool, false)
    }

    func testJoinTrialWaitlistSendsRegionConsentAndConsentVersionInTheBody() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)
        mock.responseBody = Data(#"{"status":"added","message":"You are on the waiting list.","responseStatus":{}}"#.utf8)

        let answer = try await client.account.joinTrialWaitlist([
            "region": "nb-eu-germany", "consent": true, "consentVersion": "2026-11",
        ])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/account/trial-waitlist")
        XCTAssertNil(mock.lastRequest?.url?.query)
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token")
        let sent = try body(mock)
        XCTAssertEqual(sent.count, 3)
        XCTAssertEqual(sent["region"] as? String, "nb-eu-germany")
        XCTAssertEqual(sent["consent"] as? Bool, true)
        XCTAssertEqual(sent["consentVersion"] as? String, "2026-11")
        let map = try XCTUnwrap(answer as? [String: Any])
        XCTAssertEqual(map["status"] as? String, "added")
        XCTAssertEqual(map["message"] as? String, "You are on the waiting list.")
    }

    func testCreateStripeCheckoutSessionSendsRegionWithoutTrialAndTrialInviteInTheBody() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        _ = try await client.account.createStripeCheckoutSession([
            "subscriptionType": "ManagedService", "bundle": "Growth", "billingPeriod": "Monthly",
            "region": "nb-eu-germany", "withoutTrial": false, "trialInvite": "inv_123",
        ])

        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/account/stripe/create-checkout-session")
        let sent = try body(mock)
        XCTAssertEqual(sent.count, 6)
        XCTAssertEqual(sent["region"] as? String, "nb-eu-germany")
        XCTAssertEqual(sent["withoutTrial"] as? Bool, false)
        XCTAssertEqual(sent["trialInvite"] as? String, "inv_123")
    }

    func testAFullRegionFailsTheTrialCheckoutWithItsCode() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)
        mock.responseStatus = 400
        mock.responseBody = Data(#"""
        {"responseStatus":{"errorCode":"CM-ERRORS-ACCOUNT-040","message":"Free trials in this region are full.","errors":[{"errorCode":"CM-ERRORS-ACCOUNT-040","message":"Free trials in this region are full."}]}}
        """#.utf8)

        do {
            _ = try await client.account.createStripeCheckoutSession([
                "subscriptionType": "ManagedService", "bundle": "Growth", "billingPeriod": "Monthly",
                "region": "nb-eu-germany",
            ])
            XCTFail("expected a full region to throw")
        } catch let error as NorbixError {
            XCTAssertEqual(error.status, 400)
            XCTAssertEqual(error.code, "CM-ERRORS-ACCOUNT-040")
            XCTAssertEqual(error.errors.first?.errorCode, "CM-ERRORS-ACCOUNT-040")
        }
        XCTAssertEqual(mock.capturedRequests.count, 1)
    }
}
