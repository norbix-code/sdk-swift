import XCTest
@testable import NorbixHub
import NorbixCore

/// The gateway takes the account from the signed-in session on every account route below
/// (`UserSession.UserAuth.AccountId`), or from the project id in the path, or needs no account
/// at all. So each method works with a token only — a client with no `accountId` — like the
/// TypeScript, .NET, Go and Python SDKs. One test per method, on the mock executor (verb,
/// resolved path, auth header, no account header). Never a real gateway.
/// The four anonymous routes (sign-up, invitation, regions, verify) are in
/// `HubAccountNoTokenScopeTests` below.
final class HubAccountTokenOnlyScopeTests: XCTestCase {
    private let p: [String: Any] = ["projectId": "proj_1"]

    private func check(
        _ verb: String,
        _ path: String,
        file: StaticString = #filePath,
        line: UInt = #line,
        _ call: (NorbixHubClient) async throws -> Any?
    ) async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"responseStatus":{}}"#.utf8)
        let client = try NorbixHubClient(projectId: "proj", bearerToken: "token", executor: mock)
        client.setScope(projectId: "proj", accountId: nil) // also ignore a NORBIX_ACCOUNT_ID in the environment

        _ = try await call(client)

        XCTAssertEqual(mock.lastRequest?.httpMethod, verb, file: file, line: line)
        XCTAssertEqual(mock.lastRequest?.url?.path, path, file: file, line: line)
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "Authorization"), "Bearer token", file: file, line: line)
        XCTAssertNil(mock.lastRequest?.value(forHTTPHeaderField: "X-CM-AccountId"), file: file, line: line)
    }

    func testGetAccountProfileWorksWithATokenAndNoAccountId() async throws {
        try await check("GET", "/v3/account/profile") { try await $0.account.getAccountProfile() }
    }

    func testUpdateAccountProfileWorksWithATokenAndNoAccountId() async throws {
        try await check("PUT", "/v3/account/profile") { try await $0.account.updateAccountProfile() }
    }

    func testGetMyAccountUserProfileWorksWithATokenAndNoAccountId() async throws {
        try await check("GET", "/v3/account/me") { try await $0.account.getMyAccountUserProfile() }
    }

    func testUpdateMyAccountUserPhoneWorksWithATokenAndNoAccountId() async throws {
        try await check("PUT", "/v3/account/me/phone") { try await $0.account.updateMyAccountUserPhone(["phone": "+37060000000"]) }
    }

    func testResendAccountVerificationTokenWorksWithATokenAndNoAccountId() async throws {
        try await check("GET", "/v3/account/verify/resend") { try await $0.account.resendAccountVerificationToken() }
    }

    func testGetAccountStatusWorksWithATokenAndNoAccountId() async throws {
        try await check("GET", "/v3/account/status") { try await $0.account.getAccountStatus() }
    }

    func testCreateStripeCheckoutSessionWorksWithATokenAndNoAccountId() async throws {
        try await check("POST", "/v3/account/stripe/create-checkout-session") { try await $0.account.createStripeCheckoutSession() }
    }

    func testGetStripeBillingPortalUrlWorksWithATokenAndNoAccountId() async throws {
        try await check("POST", "/v3/account/stripe/get-portal-url") { try await $0.account.getStripeBillingPortalUrl() }
    }

    func testDeleteNotificationsGroupWorksWithATokenAndNoAccountId() async throws {
        try await check("DELETE", "/v3/account/projects/proj_1/notifications/settings/group") { try await $0.account.deleteNotificationsGroup(p) }
    }

    func testDeleteNotificationsTagWorksWithATokenAndNoAccountId() async throws {
        try await check("DELETE", "/v3/account/projects/proj_1/notifications/settings/tag") { try await $0.account.deleteNotificationsTag(p) }
    }

    func testRemoveTagFromNotificationsGroupWorksWithATokenAndNoAccountId() async throws {
        try await check("DELETE", "/v3/account/projects/proj_1/notifications/settings/group/tag") { try await $0.account.removeTagFromNotificationsGroup(p) }
    }

    func testSaveNotificationsGroupWorksWithATokenAndNoAccountId() async throws {
        try await check("POST", "/v3/account/projects/proj_1/notifications/settings/group") { try await $0.account.saveNotificationsGroup(p) }
    }

    func testSaveNotificationsTagWorksWithATokenAndNoAccountId() async throws {
        try await check("POST", "/v3/account/projects/proj_1/notifications/settings/tag") { try await $0.account.saveNotificationsTag(p) }
    }

    func testCreateProjectWorksWithATokenAndNoAccountId() async throws {
        try await check("POST", "/v3/account/projects") { try await $0.account.createProject() }
    }

    func testDeleteProjectWorksWithATokenAndNoAccountId() async throws {
        try await check("DELETE", "/v3/account/projects/proj_1") { try await $0.account.deleteProject(p) }
    }

    func testGetProjectWorksWithATokenAndNoAccountId() async throws {
        try await check("GET", "/v3/account/projects/proj_1") { try await $0.account.getProject(p) }
    }

    func testGetProjectsWorksWithATokenAndNoAccountId() async throws {
        try await check("GET", "/v3/account/projects") { try await $0.account.getProjects() }
    }

    func testGetProjectTokensWorksWithATokenAndNoAccountId() async throws {
        try await check("GET", "/v3/account/projects/proj_1/tokens") { try await $0.account.getProjectTokens(p) }
    }

    func testUpdateProjectAccentColorWorksWithATokenAndNoAccountId() async throws {
        try await check("PATCH", "/v3/account/projects/proj_1/settings/accent-color") { try await $0.account.updateProjectAccentColor(p) }
    }

    func testUpdateProjectIconWorksWithATokenAndNoAccountId() async throws {
        try await check("PATCH", "/v3/account/projects/proj_1/settings/icon") { try await $0.account.updateProjectIcon(p) }
    }

    func testUpdateProjectLogoWorksWithATokenAndNoAccountId() async throws {
        try await check("PATCH", "/v3/account/projects/proj_1/settings/logo") { try await $0.account.updateProjectLogo(p) }
    }

    func testUpdateProjectMainColorWorksWithATokenAndNoAccountId() async throws {
        try await check("PATCH", "/v3/account/projects/proj_1/settings/main-color") { try await $0.account.updateProjectMainColor(p) }
    }

    func testUpdateProjectAllowedOriginsWorksWithATokenAndNoAccountId() async throws {
        try await check("PATCH", "/v3/account/projects/proj_1/settings/origins") { try await $0.account.updateProjectAllowedOrigins(p) }
    }

    func testUpdateProjectDefaultLanguageWorksWithATokenAndNoAccountId() async throws {
        try await check("PATCH", "/v3/account/projects/proj_1/settings/default-language") { try await $0.account.updateProjectDefaultLanguage(p) }
    }

    func testUpdateProjectDescriptionWorksWithATokenAndNoAccountId() async throws {
        try await check("PATCH", "/v3/account/projects/proj_1/settings/description") { try await $0.account.updateProjectDescription(p) }
    }

    func testDisableProjectWorksWithATokenAndNoAccountId() async throws {
        try await check("PATCH", "/v3/account/projects/proj_1/disable") { try await $0.account.disableProject(p) }
    }

    func testEnableProjectWorksWithATokenAndNoAccountId() async throws {
        try await check("PATCH", "/v3/account/projects/proj_1/enable") { try await $0.account.enableProject(p) }
    }

    func testUpdateProjectLanguagesWorksWithATokenAndNoAccountId() async throws {
        try await check("PATCH", "/v3/account/projects/proj_1/settings/languages") { try await $0.account.updateProjectLanguages(p) }
    }

    func testUpdateProjectUrlWorksWithATokenAndNoAccountId() async throws {
        try await check("PATCH", "/v3/account/projects/proj_1/settings/url") { try await $0.account.updateProjectUrl(p) }
    }

    func testUpdateProjectNameWorksWithATokenAndNoAccountId() async throws {
        try await check("PATCH", "/v3/account/projects/proj_1/settings/name") { try await $0.account.updateProjectName(p) }
    }

    func testUpdateProjectRegionsWorksWithATokenAndNoAccountId() async throws {
        try await check("PATCH", "/v3/account/projects/proj_1/settings/regions") { try await $0.account.updateProjectRegions(p) }
    }

    func testGetAccountCollaboratorsWorksWithATokenAndNoAccountId() async throws {
        try await check("GET", "/v3/account/collaborators") { try await $0.account.getAccountCollaborators() }
    }

    func testSendInviteToTeamMemberWorksWithATokenAndNoAccountId() async throws {
        try await check("POST", "/v3/account/team/member/invite") { try await $0.account.sendInviteToTeamMember() }
    }

    func testGetLicensesWorksWithATokenAndNoAccountId() async throws {
        try await check("GET", "/v3/account/licenses") { try await $0.account.getLicenses() }
    }

    func testRegionsUpdateProjectRegionsWorksWithATokenAndNoAccountId() async throws {
        try await check("PATCH", "/v3/account/projects/proj_1/settings/regions") { try await $0.regions.updateProjectRegions(projectId: "proj_1", primaryRegion: "nb-eu-germany") }
    }
}

/// The gateway has no `[Authenticate]` on these routes (gateway `refactoringV2` ff3c94a04,
/// `src/Isidos.CodeMash.Gateway.Hub.Account/`: `Account/Create.cs:25-49`,
/// `Account/Team/Verify.cs:23-50`, `Project/GetRegions.cs:18-29`, `Account/Verify.cs:17-36`).
/// So each call works on a client with NO token and NO `accountId`: scope `.unauthenticated`,
/// no `Authorization` header. `verifyAccount` takes the account id once, in the request (query).
/// The client is built from a `NorbixConfig`, so no `NORBIX_*` environment variable is read.
final class HubAccountNoTokenScopeTests: XCTestCase {
    private func send(
        file: StaticString = #filePath,
        line: UInt = #line,
        _ call: (NorbixHubClient) async throws -> Any?
    ) async throws -> URLRequest {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"responseStatus":{}}"#.utf8)
        let config = try NorbixConfig(
            projectId: "proj",
            accountId: nil,
            auth: .unauthenticated,
            baseUrl: NorbixDefaults.hubBaseUrl,
            version: NorbixDefaults.hubVersion
        )
        let client = NorbixHubClient(config: config, executor: mock)

        _ = try await call(client)

        let request = try XCTUnwrap(mock.lastRequest, file: file, line: line)
        XCTAssertNil(request.value(forHTTPHeaderField: "Authorization"), file: file, line: line)
        XCTAssertNil(request.value(forHTTPHeaderField: "X-Api-Key"), file: file, line: line)
        XCTAssertNil(request.value(forHTTPHeaderField: "X-CM-AccountId"), file: file, line: line)
        return request
    }

    private func check(
        _ verb: String,
        _ path: String,
        file: StaticString = #filePath,
        line: UInt = #line,
        _ call: (NorbixHubClient) async throws -> Any?
    ) async throws {
        let request = try await send(file: file, line: line, call)
        XCTAssertEqual(request.httpMethod, verb, file: file, line: line)
        XCTAssertEqual(request.url?.path, path, file: file, line: line)
    }

    func testCreateAccountWorksWithNoTokenAndNoAccountId() async throws {
        try await check("POST", "/v3/account") { try await $0.account.createAccount(["email": "a@b.io"]) }
    }

    func testCreateTeamMemberFromInvitationWorksWithNoTokenAndNoAccountId() async throws {
        try await check("POST", "/v3/account/team/member") { try await $0.account.createTeamMemberFromInvitation(["token": "inv"]) }
    }

    func testGetAccountRegionsWorksWithNoTokenAndNoAccountId() async throws {
        try await check("GET", "/v3/account/regions") { try await $0.account.getAccountRegions() }
    }

    func testRegionsGetAccountRegionsWorksWithNoTokenAndNoAccountId() async throws {
        try await check("GET", "/v3/account/regions") { try await $0.regions.getAccountRegions([:]) }
    }

    func testVerifyAccountWorksWithNoTokenAndSendsTheAccountIdInTheQuery() async throws {
        let request = try await send { try await $0.account.verifyAccount(["accountId": "acc_1", "token": "t1"]) }
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertEqual(request.url?.path, "/v3/account/verify")
        let query = URLComponents(url: try XCTUnwrap(request.url), resolvingAgainstBaseURL: false)?.queryItems ?? []
        XCTAssertEqual(query.first { $0.name == "accountId" }?.value, "acc_1")
        XCTAssertEqual(query.first { $0.name == "token" }?.value, "t1")
    }
}
