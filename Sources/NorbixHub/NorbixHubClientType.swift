import Foundation
import NorbixCore

/// Protocol that `NorbixHubClient` conforms to. Lets app developers depend on
/// this protocol in their own code and substitute a fake implementation in
/// tests without `@testable import NorbixHub`.
public protocol NorbixHubClientType: Sendable {
    var accessToken: AccessTokenModule { get }
    var account: AccountModule { get }
    var ai: AiModule { get }
    var apiKeys: ApiKeysModule { get }
    var auth: AuthModule { get }
    var database: DatabaseModule { get }
    var echo: EchoModule { get }
    var email: EmailModule { get }
    var files: FilesModule { get }
    var logs: LogsModule { get }
    var membership: MembershipModule { get }
    var notifications: NotificationsModule { get }
    var payments: PaymentsModule { get }
    var platform: PlatformModule { get }
    var scheduler: SchedulerModule { get }
    var webhooks: WebhooksModule { get }

    var isAuthenticated: Bool { get }

    @discardableResult
    func login(_ credentials: LoginCredentials) async throws -> AuthResponse
    func logout()
    func setBearerToken(_ token: String?)
    func setApiKey(_ apiKey: String?)
    func setScope(projectId: String, accountId: String?)
}

extension NorbixHubClient: NorbixHubClientType {}
