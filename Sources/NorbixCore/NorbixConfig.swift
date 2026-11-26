import Foundation

/// Default base URLs for Norbix' hosted environment.
public enum NorbixDefaults {
    /// Production API endpoint (`https://api.norbix.ai`).
    public static let apiBaseUrl = "https://api.norbix.ai"
    /// Production Hub endpoint (`https://hub.norbix.ai`).
    public static let hubBaseUrl = "https://hub.norbix.ai"
    public static let apiVersion = "v3"
    public static let hubVersion = "v3"
    public static let timeout: TimeInterval = 30.0

    /// Composes the regional variant of an SDK-default base URL by prefixing
    /// the region code as a subdomain (`https://{region}.api.norbix.ai` /
    /// `https://{region}.hub.norbix.ai`). Only the SDK defaults are composed —
    /// a user-supplied custom base URL never gets a region label and is returned
    /// unchanged. Returns the input unchanged when `region` is unset.
    ///
    /// API calls of a project whose id decodes do not use this address: they
    /// go to the project's own host (`projectApiBaseUrl`), which carries no
    /// region label.
    public static func regionalBaseUrl(_ baseUrl: String, region: String?) -> String {
        guard let region, !region.isEmpty else { return baseUrl }
        guard baseUrl == apiBaseUrl || baseUrl == hubBaseUrl else { return baseUrl }
        return baseUrl.replacingOccurrences(of: "https://", with: "https://\(region).")
    }

    private static let projectIdPrefix = Array("pr_".utf8)

    /// The DNS label of a project: `pr_5XvmrTA6JVggZdmEE5bGdm` →
    /// `pr-022c4aca9f9e4df787ab0a20c83c44b6`.
    ///
    /// Norbix serves every project on `pr-<32 hex>.api.norbix.ai`. The label
    /// is the project id (`pr_` + base62) written as the hex of the same
    /// GUID, so it is built here with no call. Returns `nil` for anything
    /// that is not a Norbix project id (a test id, another prefix, a value
    /// that is not a version-4 GUID) — it never throws.
    public static func projectHostLabel(_ projectId: String?) -> String? {
        guard let projectId else { return nil }
        let utf8 = Array(projectId.utf8)
        guard utf8.starts(with: projectIdPrefix) else { return nil }
        let digits = utf8.dropFirst(projectIdPrefix.count)
        // 62^22 is just above 2^128: a GUID never needs more than 22 digits.
        guard !digits.isEmpty, digits.count <= 22 else { return nil }

        // The number, least significant byte first — .NET's
        // `Guid.ToByteArray()` bytes b0…b15. Swift has no 128-bit integer on
        // every platform this package supports, so: bytes × 62 + digit.
        var bytes = [UInt8](repeating: 0, count: 16)
        for ch in digits {
            let digit: Int
            switch ch {
            case 0x30...0x39: digit = Int(ch) - 0x30          // 0-9
            case 0x41...0x5A: digit = Int(ch) - 0x41 + 10     // A-Z
            case 0x61...0x7A: digit = Int(ch) - 0x61 + 36     // a-z
            default: return nil
            }
            var carry = digit
            for i in 0..<16 {
                let value = Int(bytes[i]) * 62 + carry
                bytes[i] = UInt8(value & 0xFF)
                carry = value >> 8
            }
            // 2^128 or more: not a GUID.
            guard carry == 0 else { return nil }
        }

        // Only a version-4 GUID is a Norbix id (the gateway refuses the rest).
        guard bytes[7] >> 4 == 4, bytes[8] >> 6 == 2 else { return nil }

        // .NET "N" format: the first three groups are stored little-endian.
        let order = [3, 2, 1, 0, 5, 4, 7, 6, 8, 9, 10, 11, 12, 13, 14, 15]
        let hex = Array("0123456789abcdef".utf8)
        var label = Array("pr-".utf8)
        label.reserveCapacity(35)
        for i in order {
            label.append(hex[Int(bytes[i] >> 4)])
            label.append(hex[Int(bytes[i] & 0x0F)])
        }
        return String(decoding: label, as: UTF8.self)
    }

    /// The project's own API base URL (`https://pr-<32 hex>.api.norbix.ai`),
    /// or `nil` when the id is not a Norbix project id. It carries no region
    /// label: the project's DNS record already points at its region.
    public static func projectBaseUrl(_ projectId: String?) -> String? {
        guard let label = projectHostLabel(projectId) else { return nil }
        return apiBaseUrl.replacingOccurrences(of: "https://", with: "https://\(label).")
    }

    /// The placeholder an install on its own domain puts where the project's
    /// label goes (`https://{projectHostLabel}.api.customer.com`, from
    /// `GET /v3/echo` → `apiUrlTemplate`).
    public static let projectHostLabelPlaceholder = "{projectHostLabel}"

    private static let norbixApiDomain = "api.norbix.ai"

    /// Where a project's API calls go, from the API base URL the client has
    /// (devops docs/tasks/clients-project-host.md, round 2):
    ///
    /// - a template with `{projectHostLabel}` (an install on its own domain
    ///   that serves project hosts) is filled with the project's label;
    /// - an address that is already a project's host (`https://pr-<hex>.…`)
    ///   gets the current project's label, so host and `norbix-project-id`
    ///   always name the same project;
    /// - a norbix.ai API address over https — `https://api.norbix.ai` or
    ///   `https://<region>.api.norbix.ai`, built in or written out — becomes
    ///   the project's own host `https://pr-<hex>.api.norbix.ai` (its DNS
    ///   record follows the project's region);
    /// - any other address is used as given.
    ///
    /// `shared` is the same address without a project label (the social
    /// sign-in link is built on it). With a project id that is not a Norbix
    /// id, `project` is `shared`. Scheme, port and path are kept as given.
    /// Never throws.
    public static func projectApiBaseUrl(
        _ baseUrl: String,
        projectId: String?
    ) -> (project: String, shared: String) {
        let label = projectHostLabel(projectId)

        if baseUrl.contains(projectHostLabelPlaceholder) {
            let shared = baseUrl.replacingOccurrences(of: "\(projectHostLabelPlaceholder).", with: "")
            let project = label.map {
                baseUrl.replacingOccurrences(of: projectHostLabelPlaceholder, with: $0)
            } ?? shared
            return (project, shared)
        }

        guard let components = URLComponents(string: baseUrl),
              let host = components.host, !host.isEmpty,
              let hostRange = components.rangeOfHost
        else {
            return (baseUrl, baseUrl)
        }
        let labels = host.lowercased().split(separator: ".", omittingEmptySubsequences: false).map(String.init)

        // Only the host is swapped; everything else stays byte for byte.
        // (`rangeOfHost` indexes `components.string`, which is the input for
        // any URL this rule matches; otherwise the components are rebuilt.)
        func withHost(_ newHost: String) -> String {
            if components.string == baseUrl {
                var copy = baseUrl
                copy.replaceSubrange(hostRange, with: newHost)
                return copy
            }
            var copy = components
            copy.host = newHost
            return copy.string ?? baseUrl
        }

        if labels.count > 1, isProjectLabel(labels[0]) {
            let rest = labels.dropFirst().joined(separator: ".")
            let shared = withHost(rest)
            return (label.map { withHost("\($0).\(rest)") } ?? shared, shared)
        }

        let lowerHost = labels.joined(separator: ".")
        let isNorbixApi = lowerHost == norbixApiDomain
            || (labels.count == 4 && lowerHost.hasSuffix(".\(norbixApiDomain)"))
        if isNorbixApi, components.scheme?.lowercased() == "https" {
            return (label.map { withHost("\($0).\(norbixApiDomain)") } ?? baseUrl, baseUrl)
        }

        return (baseUrl, baseUrl)
    }

    /// `pr-` and 32 hex digits, any case.
    private static func isProjectLabel(_ value: String) -> Bool {
        let utf8 = Array(value.utf8)
        guard utf8.count == 35, utf8.starts(with: Array("pr-".utf8)) else { return false }
        return utf8.dropFirst(3).allSatisfy { ch in
            (0x30...0x39).contains(ch) || (0x61...0x66).contains(ch)
        }
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
/// public/unauthenticated. Account-scoped calls require `accountId` to be set.
public enum NorbixScope: Sendable {
    case project
    case account
    case unauthenticated
    /// Auth is sent when the client has a token, never required — used by the
    /// signed notification preview links.
    case optional
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
    /// Language every request asks for, sent verbatim as the standard
    /// `Accept-Language` header (e.g. `lt` or `lt-LT, en;q=0.8` — q-values
    /// are honoured by the gateway). There is **no default language**: when
    /// unset (`nil`, the default) no header is sent and the gateway answers
    /// in the project's default language. Responses carry `Content-Language`.
    public var language: String?
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
    /// Called when the server renews the stored bearer token. A project
    /// user's token lives a sliding 12 hours (30 days with `rememberMe`),
    /// never more than 90 days from sign-in. While it is in use, an answer
    /// can carry a fresh token in the `norbix-session-token` header. The
    /// client then uses the new token for every later call and calls this so
    /// the app can save it (the old token still works until it expires).
    ///
    /// Only for the stored token (`bearerToken`, `login`, `setBearerToken`):
    /// never for an API key, a per-call `bearerToken`, or a token that was
    /// replaced while the request was in flight. An empty header is ignored.
    /// Called on the thread that ran the request, outside the client's lock.
    public var onSessionToken: (@Sendable (String) -> Void)?

    public init(
        projectId: String,
        accountId: String? = nil,
        env: String = "PROD",
        region: String? = nil,
        language: String? = nil,
        auth: NorbixAuth = .unauthenticated,
        baseUrl: String,
        version: String,
        timeout: TimeInterval = NorbixDefaults.timeout,
        defaultHeaders: [String: String] = [:],
        verbose: Bool = false,
        retryPolicy: RetryPolicy = .standard,
        onSessionToken: (@Sendable (String) -> Void)? = nil
    ) throws {
        guard !projectId.isEmpty else {
            throw NorbixError(
                message: "projectId is required",
                code: "NORBIX_CONFIG_INVALID"
            )
        }
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
        self.language = (language?.isEmpty == false) ? language : nil
        self.auth = auth
        self.baseUrl = baseUrl
        self.version = version
        self.timeout = timeout
        self.defaultHeaders = defaultHeaders
        self.verbose = verbose
        self.retryPolicy = retryPolicy
        self.onSessionToken = onSessionToken
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
    /// - `NORBIX_LANGUAGE` (`Accept-Language` value, e.g. `lt-LT, en;q=0.8`; unset by default)
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
            language: environment["NORBIX_LANGUAGE"],
            auth: auth,
            baseUrl: baseUrl,
            version: version,
            verbose: verbose
        )
    }
}
