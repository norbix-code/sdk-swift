import XCTest
@testable import NorbixApi
import NorbixCore

/// E-mail verification for e-mail + password users (gateway d7d080c92): the
/// confirm and resend calls are public, and a password sign-in the project
/// refuses until the address is verified answers 401
/// `CM-ERRORS-MEMBERSHIP-USERS-052`. Each call test pins the verb, path,
/// headers and body on the mock executor.
final class EmailAddressVerificationTests: XCTestCase {

    private static let projectId = "proj_verify"

    /// A client with a project id and no credentials, built from a config so
    /// `NORBIX_API_KEY` / `NORBIX_BEARER_TOKEN` in the environment cannot leak in.
    private func makeClient(_ mock: MockHTTPExecutor, auth: NorbixAuth = .unauthenticated) throws -> NorbixApiClient {
        let config = try NorbixConfig(
            projectId: Self.projectId,
            auth: auth,
            baseUrl: "https://gateway.example.test",
            version: "v3"
        )
        return NorbixApiClient(config: config, executor: mock)
    }

    private func body(_ mock: MockHTTPExecutor) throws -> [String: String] {
        let data = try XCTUnwrap(mock.lastRequest?.httpBody)
        return try XCTUnwrap(JSONSerialization.jsonObject(with: data) as? [String: String])
    }

    func testVerifyEmailAddressSendsTheTokenWithNoCredentials() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"""
        {"authId":"auth_1","verifiedAtUtc":"2026-11-22T10:15:30.123Z","responseStatus":{"isSuccess":true}}
        """#.utf8)
        let client = try makeClient(mock)

        let answer = try await client.membership.verifyEmailAddress(token: "tok_abc")

        XCTAssertEqual(mock.capturedRequests.count, 1)
        let sent = try XCTUnwrap(mock.lastRequest)
        XCTAssertEqual(sent.httpMethod, "POST")
        XCTAssertEqual(sent.url?.path, "/v3/membership/userauth/email-verification/confirm")
        XCTAssertNil(sent.value(forHTTPHeaderField: "Authorization"))
        XCTAssertEqual(sent.value(forHTTPHeaderField: "norbix-project-id"), Self.projectId)
        XCTAssertEqual(try body(mock), ["token": "tok_abc"])

        XCTAssertEqual(answer.authId, "auth_1")
        let verifiedAt = try XCTUnwrap(answer.verifiedAtUtc)
        XCTAssertEqual(verifiedAt.timeIntervalSince1970, 1_795_342_530.123, accuracy: 0.001)
    }

    func testVerifyEmailAddressSendsTheDatabaseIntegrationIdWhenGiven() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        let answer = try await client.membership.verifyEmailAddress(token: "tok_abc", databaseIntegrationId: "int_db")

        XCTAssertEqual(try body(mock), ["token": "tok_abc", "databaseIntegrationId": "int_db"])
        XCTAssertEqual(answer, EmailAddressVerifiedResponse())
    }

    func testVerifyEmailAddressCarriesTheTokenWhenTheClientHasOne() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock, auth: .apiKey("key_123"))

        _ = try await client.membership.verifyEmailAddress(token: "tok_abc")

        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer key_123")
    }

    func testVerifyEmailAddressSurfacesAnExpiredLink() async throws {
        let mock = MockHTTPExecutor()
        mock.responseStatus = 400
        mock.responseBody = Data(#"""
        {"responseStatus":{"errorCode":"CM-ERRORS-MEMBERSHIP-USERS-051","message":"The link is no longer valid.",
         "errors":[{"errorCode":"CM-ERRORS-MEMBERSHIP-USERS-051","message":"The link is no longer valid."}]}}
        """#.utf8)
        let client = try makeClient(mock)

        do {
            _ = try await client.membership.verifyEmailAddress(token: "tok_old")
            XCTFail("expected CM-ERRORS-MEMBERSHIP-USERS-051")
        } catch let error as NorbixError {
            XCTAssertEqual(error.status, 400)
            XCTAssertEqual(error.errorCode, "CM-ERRORS-MEMBERSHIP-USERS-051")
            XCTAssertFalse(error.isEmailNotVerified)
        }
    }

    func testResendEmailAddressVerificationSendsTheEmailWithNoCredentials() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"responseStatus":{"isSuccess":true}}"#.utf8)
        let client = try makeClient(mock)

        try await client.membership.resendEmailAddressVerification(email: "new@example.test")

        XCTAssertEqual(mock.capturedRequests.count, 1)
        let sent = try XCTUnwrap(mock.lastRequest)
        XCTAssertEqual(sent.httpMethod, "POST")
        XCTAssertEqual(sent.url?.path, "/v3/membership/userauth/email-verification/resend")
        XCTAssertNil(sent.value(forHTTPHeaderField: "Authorization"))
        XCTAssertEqual(sent.value(forHTTPHeaderField: "norbix-project-id"), Self.projectId)
        XCTAssertEqual(try body(mock), ["email": "new@example.test"])
    }

    func testResendEmailAddressVerificationSendsTheDatabaseIntegrationIdWhenGiven() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock)

        try await client.membership.resendEmailAddressVerification(email: "new@example.test", databaseIntegrationId: "int_db")

        XCTAssertEqual(try body(mock), ["email": "new@example.test", "databaseIntegrationId": "int_db"])
    }

    func testSignInRefusedForAnUnverifiedEmailIsRecognised() async throws {
        let mock = MockHTTPExecutor()
        mock.responseStatus = 401
        mock.responseBody = Data(#"""
        {"responseStatus":{"errorCode":"CM-ERRORS-MEMBERSHIP-USERS-052","message":"Verify your e-mail address first.",
         "errors":[{"errorCode":"CM-ERRORS-MEMBERSHIP-USERS-052","message":"Verify your e-mail address first."}]}}
        """#.utf8)
        let client = try makeClient(mock)

        do {
            _ = try await client.login(LoginCredentials(userName: "new@example.test", password: "secret1"))
            XCTFail("expected CM-ERRORS-MEMBERSHIP-USERS-052")
        } catch {
            XCTAssertTrue(NorbixError.isEmailNotVerifiedError(error))
            let norbix = try XCTUnwrap(error as? NorbixError)
            XCTAssertEqual(norbix.status, 401)
            XCTAssertEqual(norbix.errorCode, NorbixError.emailNotVerifiedErrorCode)
            XCTAssertTrue(norbix.isEmailNotVerified)
        }
    }

    func testEmailNotVerifiedHelper() {
        XCTAssertEqual(NorbixError.emailNotVerifiedErrorCode, "CM-ERRORS-MEMBERSHIP-USERS-052")

        XCTAssertTrue(NorbixError(message: "x", status: 401, code: "CM-ERRORS-MEMBERSHIP-USERS-052").isEmailNotVerified)
        // Found in the errors list even when another code came first.
        let listed = NorbixError(
            message: "x", status: 401, code: "CM-ERRORS-MEMBERSHIP-USERS-001",
            errors: [
                NorbixErrorItem(errorCode: "CM-ERRORS-MEMBERSHIP-USERS-001"),
                NorbixErrorItem(errorCode: "CM-ERRORS-MEMBERSHIP-USERS-052"),
            ]
        )
        XCTAssertTrue(listed.isEmailNotVerified)
        XCTAssertTrue(NorbixError.isEmailNotVerifiedError(listed))

        XCTAssertFalse(NorbixError(message: "x", status: 401, code: "CM-ERRORS-MEMBERSHIP-USERS-050").isEmailNotVerified)
        XCTAssertFalse(NorbixError.isEmailNotVerifiedError(URLError(.notConnectedToInternet)))
    }
}
