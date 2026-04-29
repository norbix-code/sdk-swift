import Foundation
import os

/// Severity for a log event.
public enum NorbixLogLevel: Int, Sendable, Comparable {
    case debug = 0
    case info = 1
    case warning = 2
    case error = 3

    public static func < (lhs: NorbixLogLevel, rhs: NorbixLogLevel) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

/// Structured log event emitted by the SDK. Concrete loggers map this to the
/// underlying logging system (OSLog, swift-log adapter, your own analytics).
public struct NorbixLogEvent: Sendable {
    public let level: NorbixLogLevel
    public let message: String
    public let metadata: [String: String]
    public let timestamp: Date

    public init(
        level: NorbixLogLevel,
        message: String,
        metadata: [String: String] = [:],
        timestamp: Date = Date()
    ) {
        self.level = level
        self.message = message
        self.metadata = metadata
        self.timestamp = timestamp
    }
}

/// Pluggable logging surface. Provide your own implementation if you want
/// the SDK to feed swift-log, your analytics, or anything else.
///
/// The default is `OSLogger`, which uses Apple's unified logging system
/// (`os.Logger`) with zero external dependencies.
public protocol NorbixLogger: Sendable {
    func log(_ event: NorbixLogEvent)
}

/// Default logger backed by `os.Logger`. Free, no external dependencies,
/// integrates with Console.app and the unified logging system.
public final class OSLogger: NorbixLogger {
    private let logger: os.Logger

    public init(subsystem: String = "ai.norbix.sdk", category: String = "Norbix") {
        self.logger = os.Logger(subsystem: subsystem, category: category)
    }

    public func log(_ event: NorbixLogEvent) {
        let suffix: String
        if event.metadata.isEmpty {
            suffix = ""
        } else {
            let pairs = event.metadata
                .sorted { $0.key < $1.key }
                .map { "\($0.key)=\($0.value)" }
                .joined(separator: " ")
            suffix = " | \(pairs)"
        }
        let line = "\(event.message)\(suffix)"
        switch event.level {
        case .debug:   logger.debug("\(line, privacy: .public)")
        case .info:    logger.info("\(line, privacy: .public)")
        case .warning: logger.warning("\(line, privacy: .public)")
        case .error:   logger.error("\(line, privacy: .public)")
        }
    }
}

/// Logger that drops every event. Default when verbose logging is off — the
/// SDK still emits a minimal "client initialized" / error trail through the
/// chosen logger, but `NoopLogger` lets callers turn off everything.
public final class NoopLogger: NorbixLogger {
    public init() {}
    public func log(_ event: NorbixLogEvent) {}
}

// MARK: - Redaction

/// Header / body field names that are always redacted before being logged.
public enum NorbixLogRedaction {
    public static let secretHeaderNames: Set<String> = [
        "authorization", "x-api-key", "x-cm-apikey", "cookie", "set-cookie"
    ]
    public static let secretBodyKeys: Set<String> = [
        "password", "currentpassword", "newpassword",
        "apikey", "api_key",
        "token", "bearertoken", "bearer_token",
        "secret", "clientsecret", "client_secret",
        "refreshtoken", "refresh_token"
    ]

    public static func redactedHeader(name: String, value: String) -> String {
        if secretHeaderNames.contains(name.lowercased()) {
            return "<redacted>"
        }
        return value
    }

    /// Redact secret keys inside a JSON body dictionary. Walks one level deep
    /// — that's enough for the request shapes the SDK emits, and avoids
    /// accidental cost on large nested payloads.
    public static func redactedBody(_ body: [String: Any]) -> [String: Any] {
        var copy = body
        for (key, _) in body where secretBodyKeys.contains(key.lowercased()) {
            copy[key] = "<redacted>"
        }
        return copy
    }
}
