import Foundation

/// Default base URLs for Norbix' hosted environment.
public enum NorbixDefaults {
    /// Production API endpoint (`https://api.norbix.ai`).
    public static let apiBaseUrl = "https://api.norbix.ai"
    /// Production Hub endpoint (`https://hub.norbix.ai`).
    public static let hubBaseUrl = "https://hub.norbix.ai"
    public static let apiVersion = "v2"
    public static let hubVersion = "v2"
    public static let timeout: TimeInterval = 30.0

    /// Composes the regional variant of an SDK-default base URL by prefixing
    /// the region code as a subdomain (`https://{region}.api.norbix.ai` /
    /// `https://{region}.hub.norbix.ai`). Only the SDK defaults are composed —
    /// a user-supplied custom base URL is never rewritten and is returned
    /// unchanged. Returns the input unchanged when `region` is unset.
    public static func regionalBaseUrl(_ baseUrl: String, region: String?) -> String {
        guard let region, !region.isEmpty else { return baseUrl }
        guard baseUrl == apiBaseUrl || baseUrl == hubBaseUrl else { return baseUrl }
        return baseUrl.replacingOccurrences(of: "https://", with: "https://\(region).")
    }
}

/// Authentication strategy for a Norbix client.
public enum NorbixAuth: Sendable {
    /// Server-side / long-lived API key.
    case apiKey(String)
    /// Short-lived bearer token (e.g. result of `client.login(...)`).
    case bearerToken(String)
    /// No credentials yet — the client must `login(...)` before calling
    /// authenticated endpoints.
    case unauthenticated
}

/// Tells the transport whether a call is project-scoped, account-scoped, or
/// public/unauthenticated. Project-scoped calls require `projectId`; account-scoped
/// calls do not need `accountId` (the gateway reads the account from the session).
public enum NorbixScope: Sendable {
    case project
    case account
    case unauthenticated
}

/// Strongly-typed configuration shared by `NorbixApiClient` and `NorbixHubClient`.
///
/// Build it manually:
///
/// ```swift
/// let cfg = try NorbixConfig(
///     projectId: "proj_123",
///     auth: .apiKey("sk_live_xxx"),
///     baseUrl: "https://api.norbix.ai"
/// )
/// ```
///
/// Or load from environment:
///
/// ```swift
/// let cfg = try NorbixConfig.fromEnvironment(target: .api)
/// ```
public struct NorbixConfig: Sendable {
    public enum Target: Sendable {
        case api
        case hub
    }

    public var projectId: String
    public var accountId: String?
    /// Project environment every request targets, sent as the `norbix-env`
    /// header. `PROD` (the default) sends no header; a non-PROD env (e.g.
    /// `TEST`, `STAGING`) scopes every read and write to that environment's
    /// integrations. There is no cross-env fallback.
    public var env: String
    /// Norbix region every request targets (e.g. `nb-eu-germany`), sent as
    /// the `nb-region` header. Unlike `env` there is **no default region**:
    /// when unset (`nil`, the default) no header is sent and the backend
    /// picks its own default.
    public var region: String?
    public var auth: NorbixAuth
    public var baseUrl: String
    public var version: String
    public var timeout: TimeInterval
    public var defaultHeaders: [String: String]
    /// When `true`, the SDK logs pre-request, post-request, and decode events
    /// through the configured `NorbixLogger`. Secrets in headers and body are
    /// always redacted. Defaults to `false`. Set the `NORBIX_VERBOSE`
    /// environment variable to `1` / `true` to enable from the env.
    public var verbose: Bool
    /// Controls retry behavior for transient failures (5xx + 429).
    public var retryPolicy: RetryPolicy

    public init(
        projectId: String,
        accountId: String? = nil,
        env: String = "PROD",
        region: String? = nil,
        auth: NorbixAuth = .unauthenticated,
        baseUrl: String,
        version: String,
        timeout: TimeInterval = NorbixDefaults.timeout,
        defaultHeaders: [String: String] = [:],
        verbose: Bool = false,
        retryPolicy: RetryPolicy = .standard
    ) throws {
        // An empty projectId is allowed: a Hub client can log in and call
        // account-scoped endpoints before a project is chosen. Project-scoped
        // calls still fail fast in the transport (NORBIX_PROJECT_SCOPE_REQUIRED).
        guard !baseUrl.isEmpty else {
            throw NorbixError(
                message: "baseUrl is required",
                code: "NORBIX_CONFIG_INVALID"
            )
        }
        self.projectId = projectId
        self.accountId = accountId
        self.env = env
        self.region = (region?.isEmpty == false) ? region : nil
        self.auth = auth
        self.baseUrl = baseUrl
        self.version = version
        self.timeout = timeout
        self.defaultHeaders = defaultHeaders
        self.verbose = verbose
        self.retryPolicy = retryPolicy
    }

    /// Builds a config from `ProcessInfo.processInfo.environment`.
    ///
    /// Variables read:
    /// - `NORBIX_PROJECT_ID` (required)
    /// - `NORBIX_ACCOUNT_ID` (optional)
    /// - `NORBIX_BEARER_TOKEN` then `NORBIX_API_KEY` (bearer wins if both set)
    /// - `NORBIX_API_URL` / `NORBIX_HUB_URL` (override base URL)
    /// - `NORBIX_API_VERSION` / `NORBIX_HUB_VERSION` (override version)
    /// - `NORBIX_ENV` (project environment, defaults to `PROD`)
    /// - `NORBIX_REGION` (Norbix region code, e.g. `nb-eu-germany`; unset by default)
    public static func fromEnvironment(
        target: Target,
        environment: [String: String] = ProcessInfo.processInfo.environment
    ) throws -> NorbixConfig {
        guard let projectId = environment["NORBIX_PROJECT_ID"], !projectId.isEmpty else {
            throw NorbixError(
                message: "NORBIX_PROJECT_ID is not set",
                code: "NORBIX_CONFIG_INVALID"
            )
        }

        let auth: NorbixAuth
        if let bearer = environment["NORBIX_BEARER_TOKEN"], !bearer.isEmpty {
            auth = .bearerToken(bearer)
        } else if let key = environment["NORBIX_API_KEY"], !key.isEmpty {
            auth = .apiKey(key)
        } else {
            auth = .unauthenticated
        }

        let baseUrl: String
        let version: String
        switch target {
        case .api:
            baseUrl = environment["NORBIX_API_URL"] ?? NorbixDefaults.apiBaseUrl
            version = environment["NORBIX_API_VERSION"] ?? NorbixDefaults.apiVersion
        case .hub:
            baseUrl = environment["NORBIX_HUB_URL"] ?? NorbixDefaults.hubBaseUrl
            version = environment["NORBIX_HUB_VERSION"] ?? NorbixDefaults.hubVersion
        }

        let verbose: Bool = {
            guard let raw = environment["NORBIX_VERBOSE"]?.lowercased() else {
                return false
            }
            return raw == "1" || raw == "true" || raw == "yes"
        }()

        return try NorbixConfig(
            projectId: projectId,
            accountId: environment["NORBIX_ACCOUNT_ID"],
            env: environment["NORBIX_ENV"] ?? "PROD",
            region: environment["NORBIX_REGION"],
            auth: auth,
            baseUrl: baseUrl,
            version: version,
            verbose: verbose
        )
    }
}
