import Foundation
import NorbixCore

/// Client for the Norbix **API** plane (project-scoped data operations).
///
/// Modules are exposed as flat properties — there is no `client.api.database`
/// indirection because this whole package *is* the API plane:
///
/// ```swift
/// import NorbixApi
///
/// let client = try NorbixApiClient(projectId: "proj_123", apiKey: "sk_live_xxx")
/// let orders = try await client.database.find(["collectionName": "orders"])
/// let me = try await client.membership.getCurrentUser()
/// ```
///
/// Self-hosted deployments override `baseUrl`:
///
/// ```swift
/// let client = try NorbixApiClient(
///     projectId: "proj_123",
///     apiKey: "sk_live_xxx",
///     baseUrl: "https://api.norbix.isidos.lt"
/// )
/// ```
public final class NorbixApiClient: Sendable {
    private let transport: Transport

    // Modules — flat, no nested .api namespace.
    public let accessToken: AccessTokenModule
    public let apiKeys: ApiKeysModule
    public let auth: AuthModule
    public let chat: ChatModule
    public let database: DatabaseModule
    public let echo: EchoModule
    public let files: FilesModule
    public let membership: MembershipModule

    /// Build a client from an existing `NorbixConfig`.
    public init(
        config: NorbixConfig,
        executor: HTTPExecuting = URLSessionHTTPExecutor(),
        logger: NorbixLogger = OSLogger()
    ) {
        let transport = Transport(config: config, executor: executor, logger: logger)
        self.transport = transport
        self.accessToken = AccessTokenModule(transport: transport)
        self.apiKeys = ApiKeysModule(transport: transport)
        self.auth = AuthModule(transport: transport)
        self.chat = ChatModule(transport: transport)
        self.database = DatabaseModule(transport: transport)
        self.echo = EchoModule(transport: transport)
        self.files = FilesModule(transport: transport)
        self.membership = MembershipModule(transport: transport)
    }

    /// Convenience initializer that mirrors the most common shape.
    /// Reads any unset value from the environment (see `NorbixConfig.fromEnvironment`).
    public convenience init(
        projectId: String? = nil,
        apiKey: String? = nil,
        bearerToken: String? = nil,
        accountId: String? = nil,
        baseUrl: String? = nil,
        version: String? = nil,
        timeout: TimeInterval = NorbixDefaults.timeout,
        defaultHeaders: [String: String] = [:],
        verbose: Bool = false,
        executor: HTTPExecuting = URLSessionHTTPExecutor(),
        logger: NorbixLogger = OSLogger()
    ) throws {
        let env = ProcessInfo.processInfo.environment

        guard let resolvedProjectId = projectId ?? env["NORBIX_PROJECT_ID"], !resolvedProjectId.isEmpty else {
            throw NorbixError(
                message: "projectId is required (pass it directly or set NORBIX_PROJECT_ID).",
                code: "NORBIX_CONFIG_INVALID"
            )
        }

        let auth: NorbixAuth
        if let token = bearerToken ?? env["NORBIX_BEARER_TOKEN"], !token.isEmpty {
            auth = .bearerToken(token)
        } else if let key = apiKey ?? env["NORBIX_API_KEY"], !key.isEmpty {
            auth = .apiKey(key)
        } else {
            auth = .unauthenticated
        }

        let envVerbose: Bool = {
            guard let raw = env["NORBIX_VERBOSE"]?.lowercased() else { return false }
            return raw == "1" || raw == "true" || raw == "yes"
        }()

        let config = try NorbixConfig(
            projectId: resolvedProjectId,
            accountId: accountId ?? env["NORBIX_ACCOUNT_ID"],
            auth: auth,
            baseUrl: baseUrl ?? env["NORBIX_API_URL"] ?? NorbixDefaults.apiBaseUrl,
            version: version ?? env["NORBIX_API_VERSION"] ?? NorbixDefaults.apiVersion,
            timeout: timeout,
            defaultHeaders: defaultHeaders,
            verbose: verbose || envVerbose
        )

        self.init(config: config, executor: executor, logger: logger)
    }

    // MARK: - Auth helpers

    /// Logs in with credentials and stores the returned bearer token on the client.
    /// Returns a typed `AuthResponse`.
    @discardableResult
    public func login(_ credentials: LoginCredentials) async throws -> AuthResponse {
        let auth: AuthResponse = try await transport.send(
            path: "/auth",
            method: "POST",
            request: [
                "userName": credentials.userName,
                "password": credentials.password,
                "provider": credentials.provider
            ],
            scope: .unauthenticated,
            as: AuthResponse.self
        )
        transport.config.auth = .bearerToken(auth.bearerToken)
        return auth
    }

    public func logout() {
        transport.config.auth = .unauthenticated
    }

    public func setBearerToken(_ token: String?) {
        if let token, !token.isEmpty {
            transport.config.auth = .bearerToken(token)
        } else {
            transport.config.auth = .unauthenticated
        }
    }

    public func setApiKey(_ apiKey: String?) {
        if let apiKey, !apiKey.isEmpty {
            transport.config.auth = .apiKey(apiKey)
        } else {
            transport.config.auth = .unauthenticated
        }
    }

    public func setScope(projectId: String, accountId: String? = nil) {
        transport.config.projectId = projectId
        transport.config.accountId = accountId
    }

    public var isAuthenticated: Bool {
        switch transport.config.auth {
        case .apiKey, .bearerToken: return true
        case .unauthenticated: return false
        }
    }
}
