import Foundation
import NorbixCore

/// Client for the Norbix **Hub** plane (project / account configuration operations).
///
/// Modules are exposed as flat properties — there is no `client.hub.files`
/// indirection because this whole package *is* the Hub plane:
///
/// ```swift
/// import NorbixHub
///
/// let hub = try NorbixHubClient(
///     projectId: "proj_123",
///     apiKey: "sk_live_xxx",
///     accountId: "acc_456"
/// )
/// let integrations = try await hub.files.getFilesIntegrations()
/// let account = try await hub.account.getAccount()
/// ```
///
/// Self-hosted deployments override `baseUrl`:
///
/// ```swift
/// let hub = try NorbixHubClient(
///     projectId: "proj_123",
///     apiKey: "sk_live_xxx",
///     baseUrl: "http://localhost:5000"
/// )
/// ```
public final class NorbixHubClient: Sendable {
    private let transport: Transport
    /// True when the client owns the base URL (the SDK default) and may
    /// compose a regional variant of it. A user-supplied custom base URL is
    /// never rewritten.
    private let managedBaseUrl: Bool

    // Modules — flat, no nested .hub namespace.
    public let accessToken: AccessTokenModule
    public let account: AccountModule
    public let ai: AiModule
    public let apiKeys: ApiKeysModule
    public let auth: AuthModule
    public let database: DatabaseModule
    public let echo: EchoModule
    public let email: EmailModule
    public let environments: EnvironmentsModule
    public let files: FilesModule
    public let logs: LogsModule
    public let membership: MembershipModule
    public let notifications: NotificationsModule
    public let payments: PaymentsModule
    public let platform: PlatformModule
    public let regions: RegionsModule
    public let scheduler: SchedulerModule
    public let webhooks: WebhooksModule

    public init(
        config: NorbixConfig,
        executor: HTTPExecuting = URLSessionHTTPExecutor(),
        logger: NorbixLogger = OSLogger()
    ) {
        // Regional base URL: composed only when the config still points at
        // the SDK default — a user-supplied custom base URL is never
        // rewritten.
        var config = config
        let managed = config.baseUrl == NorbixDefaults.hubBaseUrl
        self.managedBaseUrl = managed
        if managed {
            config.baseUrl = NorbixDefaults.regionalBaseUrl(config.baseUrl, region: config.region)
        }
        let transport = Transport(config: config, executor: executor, logger: logger)
        self.transport = transport
        self.accessToken = AccessTokenModule(transport: transport)
        self.account = AccountModule(transport: transport)
        self.ai = AiModule(transport: transport)
        self.apiKeys = ApiKeysModule(transport: transport)
        self.auth = AuthModule(transport: transport)
        self.database = DatabaseModule(transport: transport)
        self.echo = EchoModule(transport: transport)
        self.email = EmailModule(transport: transport)
        self.environments = EnvironmentsModule(transport: transport)
        self.files = FilesModule(transport: transport)
        self.logs = LogsModule(transport: transport)
        self.membership = MembershipModule(transport: transport)
        self.notifications = NotificationsModule(transport: transport)
        self.payments = PaymentsModule(transport: transport)
        self.platform = PlatformModule(transport: transport)
        self.regions = RegionsModule(transport: transport)
        self.scheduler = SchedulerModule(transport: transport)
        self.webhooks = WebhooksModule(transport: transport)
    }

    public convenience init(
        projectId: String? = nil,
        apiKey: String? = nil,
        bearerToken: String? = nil,
        accountId: String? = nil,
        env: String? = nil,
        region: String? = nil,
        baseUrl: String? = nil,
        version: String? = nil,
        timeout: TimeInterval = NorbixDefaults.timeout,
        defaultHeaders: [String: String] = [:],
        verbose: Bool = false,
        executor: HTTPExecuting = URLSessionHTTPExecutor(),
        logger: NorbixLogger = OSLogger()
    ) throws {
        let processEnv = ProcessInfo.processInfo.environment

        guard let resolvedProjectId = projectId ?? processEnv["NORBIX_PROJECT_ID"], !resolvedProjectId.isEmpty else {
            throw NorbixError(
                message: "projectId is required (pass it directly or set NORBIX_PROJECT_ID).",
                code: "NORBIX_CONFIG_INVALID"
            )
        }

        let auth: NorbixAuth
        if let token = bearerToken ?? processEnv["NORBIX_BEARER_TOKEN"], !token.isEmpty {
            auth = .bearerToken(token)
        } else if let key = apiKey ?? processEnv["NORBIX_API_KEY"], !key.isEmpty {
            auth = .apiKey(key)
        } else {
            auth = .unauthenticated
        }

        let envVerbose: Bool = {
            guard let raw = processEnv["NORBIX_VERBOSE"]?.lowercased() else { return false }
            return raw == "1" || raw == "true" || raw == "yes"
        }()

        let config = try NorbixConfig(
            projectId: resolvedProjectId,
            accountId: accountId ?? processEnv["NORBIX_ACCOUNT_ID"],
            env: env ?? processEnv["NORBIX_ENV"] ?? "PROD",
            region: region ?? processEnv["NORBIX_REGION"],
            auth: auth,
            baseUrl: baseUrl ?? processEnv["NORBIX_HUB_URL"] ?? NorbixDefaults.hubBaseUrl,
            version: version ?? processEnv["NORBIX_HUB_VERSION"] ?? NorbixDefaults.hubVersion,
            timeout: timeout,
            defaultHeaders: defaultHeaders,
            verbose: verbose || envVerbose
        )

        self.init(config: config, executor: executor, logger: logger)
    }

    // MARK: - Auth helpers

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

    /// Switch the project environment for subsequent requests (`norbix-env`
    /// header). Pass `"PROD"` (or `nil`) to return to production. Per-call
    /// `env` arguments still override this for individual requests.
    public func setEnv(_ env: String?) {
        transport.config.env = (env?.isEmpty == false) ? env! : "PROD"
    }

    /// Current project environment the client targets (defaults to `"PROD"`).
    public var env: String {
        transport.config.env
    }

    /// Switch the Norbix region for subsequent requests (`nb-region` header,
    /// e.g. `"nb-eu-germany"`). Pass `nil` (or an empty string) to unset —
    /// unlike `setEnv` there is no default region, so no header is sent when
    /// unset. When the client still points at the SDK default base URL, the
    /// regional base URL (`https://{region}.hub.norbix.ai`) is (re)composed
    /// under the same rule as construction; a custom base URL is never
    /// rewritten. Per-call `region` arguments still override the header for
    /// individual requests.
    public func setRegion(_ region: String?) {
        let resolved = (region?.isEmpty == false) ? region : nil
        let managed = managedBaseUrl
        transport.updateConfig { config in
            config.region = resolved
            if managed {
                config.baseUrl = NorbixDefaults.regionalBaseUrl(
                    NorbixDefaults.hubBaseUrl,
                    region: resolved
                )
            }
        }
    }

    /// Current Norbix region the client targets, or `nil` when unset.
    public var region: String? {
        transport.config.region
    }

    public var isAuthenticated: Bool {
        switch transport.config.auth {
        case .apiKey, .bearerToken: return true
        case .unauthenticated: return false
        }
    }
}
