import Foundation

/// Pluggable HTTP layer. Default implementation is `URLSessionHTTPExecutor`;
/// tests can substitute a mock that records requests. Conforming types must be
/// `Sendable` because the SDK is safe to call from multiple threads.
public protocol HTTPExecuting: Sendable {
    func execute(_ request: URLRequest) async throws -> (Data, HTTPURLResponse)
}

public final class URLSessionHTTPExecutor: HTTPExecuting {
    private let session: URLSession

    public init(session: URLSession = .shared) {
        self.session = session
    }

    public func execute(_ request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        let (data, response) = try await session.data(for: request)
        guard let http = response as? HTTPURLResponse else {
            throw NorbixError(message: "Invalid HTTP response", code: "NORBIX_NETWORK_ERROR")
        }
        return (data, http)
    }
}

public struct LoginCredentials: Sendable {
    public let userName: String
    public let password: String
    public let provider: String

    public init(userName: String, password: String, provider: String = "credentials") {
        self.userName = userName
        self.password = password
        self.provider = provider
    }
}

/// Internal HTTP transport used by every module.
///
/// Each Norbix client (API or Hub) owns one `Transport` configured with a single
/// `baseUrl`. Modules call `send(...)` to dispatch a request — they don't pick
/// a target.
///
/// `Transport` is thread-safe: all access to its mutable `config` goes through
/// an internal lock. The public API stays synchronous (we deliberately did not
/// convert `Transport` into an `actor`, because that would force every client
/// setter — `setApiKey`, `setBearerToken`, etc. — to become `async`. The
/// lock-based approach matches what URLSession, Stripe-iOS, and Firebase do
/// internally.) The `@unchecked Sendable` conformance is correct because
/// access to `_config` is fully synchronized.
public final class Transport: @unchecked Sendable {
    /// Header the gateway reads the project id from on every request.
    public static let projectIdHeader = "nb-project-id"
    /// Header the gateway reads the account id from (calls without a session).
    public static let accountIdHeader = "nb-account-id"
    /// Header the gateway reads on `/auth` to log in a project user.
    public static let loginProjectIdHeader = "norbix-project-id"

    private let lock = NSLock()
    private var _config: NorbixConfig
    private let executor: HTTPExecuting
    private let logger: NorbixLogger

    /// Thread-safe snapshot/replacement of the active config.
    public var config: NorbixConfig {
        get {
            lock.lock(); defer { lock.unlock() }
            return _config
        }
        set {
            lock.lock(); defer { lock.unlock() }
            _config = newValue
        }
    }

    /// Atomically read-modify-write the config. Use this when you need to
    /// change one field without racing against another writer.
    public func updateConfig(_ mutate: (inout NorbixConfig) -> Void) {
        lock.lock(); defer { lock.unlock() }
        mutate(&_config)
    }

    public init(
        config: NorbixConfig,
        executor: HTTPExecuting = URLSessionHTTPExecutor(),
        logger: NorbixLogger = OSLogger()
    ) {
        self._config = config
        self.executor = executor
        self.logger = logger
        // Always-on init line, even when verbose is off. Auth is never logged.
        logger.log(NorbixLogEvent(
            level: .info,
            message: "Norbix client initialized",
            metadata: [
                "baseUrl": config.baseUrl,
                "projectId": config.projectId,
                "accountId": config.accountId ?? "",
                "version": config.version,
                "verbose": String(config.verbose)
            ]
        ))
    }

    /// Untyped variant — returns the parsed JSON value (`[String: Any]`,
    /// `[Any]`, `Int`, etc.) or `nil` when the server returned an empty body.
    /// Useful as a fallback when the response shape is not known up front.
    public func send(
        path: String,
        method: String,
        request: [String: Any] = [:],
        scope: NorbixScope = .project,
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil,
        env: String? = nil,
        region: String? = nil
    ) async throws -> Any? {
        let data = try await performRequest(
            path: path, method: method, request: request,
            scope: scope, timeout: timeout, bearerToken: bearerToken, env: env,
            region: region
        )
        if data.isEmpty { return nil }
        // A 2xx does not mean the call worked: the gateway answers a business
        // refusal with HTTP 200 and responseStatus.isSuccess = false, and that
        // is a failure the caller must see (10b-files, issue #67). File
        // content goes through downloadData, which never reaches this line.
        if NorbixError.saysItFailed(data: data) {
            throw NorbixError.fromHTTPResponse(status: 200, data: data)
        }
        return try? JSONSerialization.jsonObject(with: data)
    }

    /// Typed variant — decodes the response body into the supplied `Decodable`
    /// type. Use this for a typed UX:
    ///
    /// ```swift
    /// struct Order: Codable { let id: String; let total: Decimal }
    /// let page: Page<Order> = try await transport.send(
    ///     path: "/{version}/database/collections/{collectionName}",
    ///     method: "GET",
    ///     request: ["collectionName": "orders"],
    ///     as: Page<Order>.self
    /// )
    /// ```
    public func send<T: Decodable>(
        path: String,
        method: String,
        request: [String: Any] = [:],
        scope: NorbixScope = .project,
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil,
        env: String? = nil,
        region: String? = nil,
        headers: [String: String] = [:],
        as type: T.Type,
        decoder: JSONDecoder = .norbixDefault
    ) async throws -> T {
        let data = try await performRequest(
            path: path, method: method, request: request,
            scope: scope, timeout: timeout, bearerToken: bearerToken, env: env,
            region: region, headers: headers
        )
        // Same rule as the untyped variant: a 200 the gateway marked as failed
        // is a failure, not a value to decode (10b-files, issue #67).
        if NorbixError.saysItFailed(data: data) {
            throw NorbixError.fromHTTPResponse(status: 200, data: data)
        }
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NorbixError(
                message: "Failed to decode \(T.self): \(error.localizedDescription)",
                code: "NORBIX_DECODE_ERROR",
                rawBody: String(data: data, encoding: .utf8)
            )
        }
    }

    /// Binary variant — returns the raw response body without parsing JSON.
    /// Use for file downloads and any other non-JSON payload.
    public func downloadData(
        path: String,
        method: String = "GET",
        request: [String: Any] = [:],
        scope: NorbixScope = .project,
        timeout: TimeInterval? = nil,
        bearerToken: String? = nil,
        env: String? = nil,
        region: String? = nil
    ) async throws -> Data {
        try await performRequest(
            path: path, method: method, request: request,
            scope: scope, timeout: timeout, bearerToken: bearerToken, env: env,
            region: region
        )
    }

    /// Shared request pipeline — builds the URLRequest, runs it, and returns
    /// the raw response body on success or throws `NorbixError` on failure.
    private func performRequest(
        path: String,
        method: String,
        request: [String: Any],
        scope: NorbixScope,
        timeout: TimeInterval?,
        bearerToken: String?,
        env: String? = nil,
        region: String? = nil,
        headers: [String: String] = [:]
    ) async throws -> Data {
        // Take one consistent snapshot of the config for this request — avoids
        // the request seeing a half-mutated state if another thread calls
        // setApiKey/setBearerToken concurrently.
        let snapshot = self.config

        if scope == .project && snapshot.projectId.isEmpty {
            throw NorbixError(
                message: "This endpoint is project-scoped. Choose a project first (setScope(projectId:)).",
                code: "NORBIX_PROJECT_SCOPE_REQUIRED"
            )
        }

        let built = try buildUrlAndBody(
            baseUrl: snapshot.baseUrl,
            path: path,
            method: method,
            version: snapshot.version,
            request: request
        )

        guard let url = URL(string: built.url) else {
            throw NorbixError(message: "Invalid URL", code: "NORBIX_NETWORK_ERROR")
        }

        var httpRequest = URLRequest(url: url)
        httpRequest.httpMethod = method
        httpRequest.timeoutInterval = timeout ?? snapshot.timeout
        httpRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        for (k, v) in snapshot.defaultHeaders {
            httpRequest.setValue(v, forHTTPHeaderField: k)
        }

        if scope != .unauthenticated {
            let token = bearerToken ?? Transport.token(from: snapshot.auth)
            guard let resolvedToken = token else {
                throw NorbixError(
                    message: "Not authenticated. Set apiKey or bearerToken.",
                    code: "NORBIX_NOT_AUTHENTICATED"
                )
            }
            httpRequest.setValue("Bearer \(resolvedToken)", forHTTPHeaderField: "Authorization")
        }

        // The gateway's request filter reads these two names for every call
        // (EventMetadataHeaderNames in the gateway). Do not send the
        // norbix-project-id / norbix-account-id spellings here: on /auth
        // they switch the login to a project user or a collaborator.
        if !snapshot.projectId.isEmpty {
            httpRequest.setValue(snapshot.projectId, forHTTPHeaderField: Transport.projectIdHeader)
        }
        if let accountId = snapshot.accountId, !accountId.isEmpty {
            httpRequest.setValue(accountId, forHTTPHeaderField: Transport.accountIdHeader)
        }
        for (k, v) in headers {
            httpRequest.setValue(v, forHTTPHeaderField: k)
        }

        // Environment selector: per-call override wins over the client default.
        // "PROD" is the backend default, so the header is omitted for it.
        let resolvedEnv = env ?? snapshot.env
        if !resolvedEnv.isEmpty && resolvedEnv != "PROD" {
            httpRequest.setValue(resolvedEnv, forHTTPHeaderField: "norbix-env")
        }

        // Region selector: per-call override wins over the client default.
        // There is no default region, so the header is sent only when
        // resolved. A per-call region only sets the header — it never
        // changes the request URL (the regional base URL is composed once,
        // at the client level).
        let resolvedRegion = region ?? snapshot.region
        if let resolvedRegion, !resolvedRegion.isEmpty {
            httpRequest.setValue(resolvedRegion, forHTTPHeaderField: "nb-region")
        }

        if let body = built.body {
            httpRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            httpRequest.httpBody = try JSONSerialization.data(withJSONObject: body)
        }

        // Auto-attach Idempotency-Key for write methods so a retry can't
        // double-write. Caller may override by passing one in defaultHeaders.
        let writeMethods: Set<String> = ["POST", "PUT", "PATCH", "DELETE"]
        if writeMethods.contains(method.uppercased()),
           httpRequest.value(forHTTPHeaderField: "Idempotency-Key") == nil {
            httpRequest.setValue(UUID().uuidString, forHTTPHeaderField: "Idempotency-Key")
        }

        return try await runWithRetry(
            httpRequest: httpRequest,
            method: method,
            url: built.url,
            policy: snapshot.retryPolicy,
            verbose: snapshot.verbose,
            verboseBody: built.body
        )
    }

    /// The retry loop. Pure function over a built `URLRequest`.
    private func runWithRetry(
        httpRequest: URLRequest,
        method: String,
        url: String,
        policy: RetryPolicy,
        verbose: Bool,
        verboseBody: [String: Any]?
    ) async throws -> Data {
        var attempt = 0
        while true {
            if verbose {
                logger.log(NorbixLogEvent(
                    level: .debug,
                    message: attempt == 0
                        ? "→ \(method) \(url)"
                        : "→ retry #\(attempt) \(method) \(url)",
                    metadata: verboseRequestMetadata(body: verboseBody)
                ))
            }

            let started = Date()
            do {
                let (data, response) = try await executor.execute(httpRequest)
                let durationMs = Int(Date().timeIntervalSince(started) * 1000)

                if response.statusCode >= 400 {
                    let retryable = policy.isRetryable(status: response.statusCode, method: method)
                    if retryable, attempt < policy.maxRetries {
                        let retryAfter = parseRetryAfter(response.value(forHTTPHeaderField: "Retry-After"))
                        attempt += 1
                        let delay = policy.delay(forAttempt: attempt, retryAfter: retryAfter)
                        logger.log(NorbixLogEvent(
                            level: .warning,
                            message: "retrying \(method) \(url)",
                            metadata: [
                                "attempt": String(attempt),
                                "of": String(policy.maxRetries),
                                "afterMs": String(Int(delay * 1000)),
                                "status": String(response.statusCode)
                            ]
                        ))
                        try await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
                        continue
                    }
                    let error = NorbixError.fromHTTPResponse(status: response.statusCode, data: data)
                    logger.log(NorbixLogEvent(
                        level: .error,
                        message: "✗ \(method) \(url) failed",
                        metadata: [
                            "status": String(response.statusCode),
                            "code": error.code,
                            "durationMs": String(durationMs),
                            "attempts": String(attempt + 1)
                        ]
                    ))
                    throw error
                }

                if verbose {
                    logger.log(NorbixLogEvent(
                        level: .debug,
                        message: "← \(method) \(url)",
                        metadata: [
                            "status": String(response.statusCode),
                            "durationMs": String(durationMs),
                            "bytes": String(data.count),
                            "attempts": String(attempt + 1)
                        ]
                    ))
                }
                return data
            } catch let error as NorbixError {
                throw error
            } catch {
                // Network-level failure — retry if the method allows it.
                if attempt < policy.maxRetries,
                   policy.retryableMethods.contains(method.uppercased()) {
                    attempt += 1
                    let delay = policy.delay(forAttempt: attempt)
                    logger.log(NorbixLogEvent(
                        level: .warning,
                        message: "retrying \(method) \(url) after network error",
                        metadata: [
                            "attempt": String(attempt),
                            "afterMs": String(Int(delay * 1000)),
                            "error": error.localizedDescription
                        ]
                    ))
                    try await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
                    continue
                }
                logger.log(NorbixLogEvent(
                    level: .error,
                    message: "✗ \(method) \(url) network error: \(error.localizedDescription)"
                ))
                throw NorbixError(message: error.localizedDescription, code: "NORBIX_NETWORK_ERROR")
            }
        }
    }

    /// Parse a `Retry-After` header value. Spec says it can be a number of
    /// seconds, or an HTTP-date. We only support the number-of-seconds form
    /// here — the HTTP-date form is rare in modern APIs.
    private func parseRetryAfter(_ raw: String?) -> TimeInterval? {
        guard let raw, let secs = Double(raw.trimmingCharacters(in: .whitespaces)) else {
            return nil
        }
        return secs
    }

    private func verboseRequestMetadata(body: [String: Any]?) -> [String: String] {
        var meta: [String: String] = [:]
        if let body {
            let redacted = NorbixLogRedaction.redactedBody(body)
            if let data = try? JSONSerialization.data(withJSONObject: redacted),
               let s = String(data: data, encoding: .utf8) {
                meta["body"] = s
            }
        }
        return meta
    }

    /// Bearer token wins over API key when both are configured.
    private static func token(from auth: NorbixAuth) -> String? {
        switch auth {
        case .bearerToken(let token): return token
        case .apiKey(let key): return key
        case .unauthenticated: return nil
        }
    }

    private func buildUrlAndBody(
        baseUrl: String,
        path: String,
        method: String,
        version: String,
        request: [String: Any]
    ) throws -> (url: String, body: [String: Any]?) {
        var normalizedPath = path.replacingOccurrences(of: "{version}", with: version)
        var consumed = Set<String>()

        let tokenPattern = #"\{([^/\{\}]+)\}"#
        let regex = try NSRegularExpression(pattern: tokenPattern)
        let matches = regex.matches(in: normalizedPath, range: NSRange(normalizedPath.startIndex..., in: normalizedPath))
        for match in matches.reversed() {
            guard let tokenRange = Range(match.range(at: 1), in: normalizedPath) else { continue }
            let token = String(normalizedPath[tokenRange])
            let kv = lookupCaseInsensitive(request, key: token)
            guard let value = kv.value else {
                throw NorbixError(
                    message: "Missing path parameter '\(token)' for path \(path)",
                    code: "NORBIX_MISSING_PATH_PARAM"
                )
            }
            if let key = kv.key { consumed.insert(key) }
            guard let fullRange = Range(match.range(at: 0), in: normalizedPath) else { continue }
            normalizedPath.replaceSubrange(fullRange, with: "\(value)")
        }

        let remaining = request.filter { !consumed.contains($0.key) }
        let root = baseUrl.hasSuffix("/") ? String(baseUrl.dropLast()) : baseUrl
        let finalPath = normalizedPath.hasPrefix("/") ? normalizedPath : "/\(normalizedPath)"
        let url = "\(root)\(finalPath)"

        if method == "GET" || method == "DELETE" {
            // An empty queryItems array still makes URLComponents emit a bare
            // "?", so only build a query when there is something to send.
            guard !remaining.isEmpty else { return (url, nil) }
            var components = URLComponents(string: url)
            components?.queryItems = remaining.flatMap { key, value in
                if let array = value as? [Any] {
                    return array.map { URLQueryItem(name: key, value: "\($0)") }
                }
                return [URLQueryItem(name: key, value: "\(value)")]
            }
            return (components?.url?.absoluteString ?? url, nil)
        }
        return (url, remaining.isEmpty ? nil : remaining)
    }

    private func lookupCaseInsensitive(
        _ values: [String: Any],
        key: String
    ) -> (key: String?, value: Any?) {
        if let direct = values[key] { return (key, direct) }
        let lowered = key.lowercased()
        for (k, v) in values where k.lowercased() == lowered {
            return (k, v)
        }
        return (nil, nil)
    }
}
