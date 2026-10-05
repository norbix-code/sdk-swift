import XCTest
@testable import NorbixHub
import NorbixCore

/// The gateway takes the account from the signed-in session on every account route below
/// (`UserSession.UserAuth.AccountId`), or from the project id in the path, or needs no account
/// at all. So each method works with a token only — a client with no `accountId` — like the
/// TypeScript, .NET, Go and Python SDKs. One test per method, on the mock executor (verb,
/// resolved path, auth header, no account header). Never a real gateway.
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
        try await check("GET", "/v2/account/profile") { try await $0.account.getAccountProfile() }
    }

    func testUpdateAccountProfileWorksWithATokenAndNoAccountId() async throws {
        try await check("PUT", "/v2/account/profile") { try await $0.account.updateAccountProfile() }
    }

    func testGetMyAccountUserProfileWorksWithATokenAndNoAccountId() async throws {
        try await check("GET", "/v2/account/me") { try await $0.account.getMyAccountUserProfile() }
    }

    func testUpdateMyAccountUserPhoneWorksWithATokenAndNoAccountId() async throws {
        try await check("PUT", "/v2/account/me/phone") { try await $0.account.updateMyAccountUserPhone(["phone": "+37060000000"]) }
    }

    func testResendAccountVerificationTokenWorksWithATokenAndNoAccountId() async throws {
        try await check("GET", "/v2/account/verify/resend") { try await $0.account.resendAccountVerificationToken() }
    }

    func testGetAccountStatusWorksWithATokenAndNoAccountId() async throws {
        try await check("GET", "/v2/account/status") { try await $0.account.getAccountStatus() }
    }

    func testCreateStripeCheckoutSessionWorksWithATokenAndNoAccountId() async throws {
        try await check("POST", "/v2/account/stripe/create-checkout-session") { try await $0.account.createStripeCheckoutSession() }
    }

    func testGetStripeBillingPortalUrlWorksWithATokenAndNoAccountId() async throws {
        try await check("POST", "/v2/account/stripe/get-portal-url") { try await $0.account.getStripeBillingPortalUrl() }
    }

    func testCreateTeamMemberFromInvitationWorksWithATokenAndNoAccountId() async throws {
        try await check("POST", "/v2/account/team/member") { try await $0.account.createTeamMemberFromInvitation() }
    }

    func testDeleteNotificationsGroupWorksWithATokenAndNoAccountId() async throws {
        try await check("DELETE", "/v2/account/projects/proj_1/notifications/settings/group") { try await $0.account.deleteNotificationsGroup(p) }
    }

    func testDeleteNotificationsTagWorksWithATokenAndNoAccountId() async throws {
        try await check("DELETE", "/v2/account/projects/proj_1/notifications/settings/tag") { try await $0.account.deleteNotificationsTag(p) }
    }

    func testRemoveTagFromNotificationsGroupWorksWithATokenAndNoAccountId() async throws {
        try await check("DELETE", "/v2/account/projects/proj_1/notifications/settings/group/tag") { try await $0.account.removeTagFromNotificationsGroup(p) }
    }

    func testSaveNotificationsGroupWorksWithATokenAndNoAccountId() async throws {
        try await check("POST", "/v2/account/projects/proj_1/notifications/settings/group") { try await $0.account.saveNotificationsGroup(p) }
    }

    func testSaveNotificationsTagWorksWithATokenAndNoAccountId() async throws {
        try await check("POST", "/v2/account/projects/proj_1/notifications/settings/tag") { try await $0.account.saveNotificationsTag(p) }
    }

    func testCreateProjectWorksWithATokenAndNoAccountId() async throws {
        try await check("POST", "/v2/account/projects") { try await $0.account.createProject() }
    }

    func testDeleteProjectWorksWithATokenAndNoAccountId() async throws {
        try await check("DELETE", "/v2/account/projects/proj_1") { try await $0.account.deleteProject(p) }
    }

    func testGetProjectWorksWithATokenAndNoAccountId() async throws {
        try await check("GET", "/v2/account/projects/proj_1") { try await $0.account.getProject(p) }
    }

    func testGetProjectsWorksWithATokenAndNoAccountId() async throws {
        try await check("GET", "/v2/account/projects") { try await $0.account.getProjects() }
    }

    func testGetAccountRegionsWorksWithATokenAndNoAccountId() async throws {
        try await check("GET", "/v2/account/regions") { try await $0.account.getAccountRegions() }
    }

    func testGetProjectTokensWorksWithATokenAndNoAccountId() async throws {
        try await check("GET", "/v2/account/projects/proj_1/tokens") { try await $0.account.getProjectTokens(p) }
    }

    func testUpdateProjectAccentColorWorksWithATokenAndNoAccountId() async throws {
        try await check("PATCH", "/v2/account/projects/proj_1/settings/accent-color") { try await $0.account.updateProjectAccentColor(p) }
    }

    func testUpdateProjectIconWorksWithATokenAndNoAccountId() async throws {
        try await check("PATCH", "/v2/account/projects/proj_1/settings/icon") { try await $0.account.updateProjectIcon(p) }
    }

    func testUpdateProjectLogoWorksWithATokenAndNoAccountId() async throws {
        try await check("PATCH", "/v2/account/projects/proj_1/settings/logo") { try await $0.account.updateProjectLogo(p) }
    }

    func testUpdateProjectMainColorWorksWithATokenAndNoAccountId() async throws {
        try await check("PATCH", "/v2/account/projects/proj_1/settings/main-color") { try await $0.account.updateProjectMainColor(p) }
    }

    func testUpdateProjectAllowedOriginsWorksWithATokenAndNoAccountId() async throws {
        try await check("PATCH", "/v2/account/projects/proj_1/settings/origins") { try await $0.account.updateProjectAllowedOrigins(p) }
    }

    func testUpdateProjectDefaultLanguageWorksWithATokenAndNoAccountId() async throws {
        try await check("PATCH", "/v2/account/projects/proj_1/settings/default-language") { try await $0.account.updateProjectDefaultLanguage(p) }
    }

    func testUpdateProjectDescriptionWorksWithATokenAndNoAccountId() async throws {
        try await check("PATCH", "/v2/account/projects/proj_1/settings/description") { try await $0.account.updateProjectDescription(p) }
    }

    func testDisableProjectWorksWithATokenAndNoAccountId() async throws {
        try await check("PATCH", "/v2/account/projects/proj_1/disable") { try await $0.account.disableProject(p) }
    }

    func testEnableProjectWorksWithATokenAndNoAccountId() async throws {
        try await check("PATCH", "/v2/account/projects/proj_1/enable") { try await $0.account.enableProject(p) }
    }

    func testUpdateProjectLanguagesWorksWithATokenAndNoAccountId() async throws {
        try await check("PATCH", "/v2/account/projects/proj_1/settings/languages") { try await $0.account.updateProjectLanguages(p) }
    }

    func testUpdateProjectUrlWorksWithATokenAndNoAccountId() async throws {
        try await check("PATCH", "/v2/account/projects/proj_1/settings/url") { try await $0.account.updateProjectUrl(p) }
    }

    func testUpdateProjectNameWorksWithATokenAndNoAccountId() async throws {
        try await check("PATCH", "/v2/account/projects/proj_1/settings/name") { try await $0.account.updateProjectName(p) }
    }

    func testUpdateProjectRegionsWorksWithATokenAndNoAccountId() async throws {
        try await check("PATCH", "/v2/account/projects/proj_1/settings/regions") { try await $0.account.updateProjectRegions(p) }
    }

    func testCreateAccountWorksWithATokenAndNoAccountId() async throws {
        try await check("POST", "/v2/account") { try await $0.account.createAccount() }
    }

    func testGetAccountCollaboratorsWorksWithATokenAndNoAccountId() async throws {
        try await check("GET", "/v2/account/collaborators") { try await $0.account.getAccountCollaborators() }
    }

    func testSendInviteToTeamMemberWorksWithATokenAndNoAccountId() async throws {
        try await check("POST", "/v2/account/team/member/invite") { try await $0.account.sendInviteToTeamMember() }
    }

    func testGetLicensesWorksWithATokenAndNoAccountId() async throws {
        try await check("GET", "/v2/account/licenses") { try await $0.account.getLicenses() }
    }

    func testRegionsGetAccountRegionsWorksWithATokenAndNoAccountId() async throws {
        try await check("GET", "/v2/account/regions") { try await $0.regions.getAccountRegions([:]) }
    }

    func testRegionsUpdateProjectRegionsWorksWithATokenAndNoAccountId() async throws {
        try await check("PATCH", "/v2/account/projects/proj_1/settings/regions") { try await $0.regions.updateProjectRegions(projectId: "proj_1", primaryRegion: "nb-eu-germany") }
    }

    func testVerifyAccountStillNeedsTheAccountIdBecauseTheGatewayReadsItFromTheRequest() async throws {
        let client = try NorbixHubClient(projectId: "proj", bearerToken: "token", executor: MockHTTPExecutor())
        client.setScope(projectId: "proj", accountId: nil)
        do {
            _ = try await client.account.verifyAccount(["accountId": "acc", "token": "t"])
            XCTFail("expected NORBIX_ACCOUNT_SCOPE_REQUIRED")
        } catch let error as NorbixError {
            XCTAssertEqual(error.code, "NORBIX_ACCOUNT_SCOPE_REQUIRED")
        }
    }
}
