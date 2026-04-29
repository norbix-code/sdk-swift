import Foundation
import NorbixCore

/// Protocol that `NorbixApiClient` conforms to. Lets app developers depend on
/// this protocol in their own code and substitute a fake implementation in
/// tests without `@testable import NorbixApi`.
///
/// ```swift
/// final class MyOrdersService {
///     private let norbix: NorbixApiClientType
///     init(norbix: NorbixApiClientType) { self.norbix = norbix }
/// }
/// ```
public protocol NorbixApiClientType: Sendable {
    var accessToken: AccessTokenModule { get }
    var apiKeys: ApiKeysModule { get }
    var auth: AuthModule { get }
    var chat: ChatModule { get }
    var database: DatabaseModule { get }
    var echo: EchoModule { get }
    var files: FilesModule { get }
    var membership: MembershipModule { get }

    var isAuthenticated: Bool { get }

    @discardableResult
    func login(_ credentials: LoginCredentials) async throws -> AuthResponse
    func logout()
    func setBearerToken(_ token: String?)
    func setApiKey(_ apiKey: String?)
    func setScope(projectId: String, accountId: String?)
}

extension NorbixApiClient: NorbixApiClientType {}
