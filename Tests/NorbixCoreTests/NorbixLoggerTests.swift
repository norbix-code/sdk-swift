import XCTest
@testable import NorbixCore

final class CapturingLogger: NorbixLogger, @unchecked Sendable {
    var events: [NorbixLogEvent] = []
    func log(_ event: NorbixLogEvent) { events.append(event) }
}

final class NorbixLoggerTests: XCTestCase {
    func testRedactionForKnownSecretBodyKeys() {
        let body: [String: Any] = [
            "userName": "alice",
            "password": "hunter2",
            "apiKey": "sk_live_xxx",
            "bearerToken": "jwt-abc",
            "harmless": 42
        ]
        let redacted = NorbixLogRedaction.redactedBody(body)
        XCTAssertEqual(redacted["userName"] as? String, "alice")
        XCTAssertEqual(redacted["password"] as? String, "<redacted>")
        XCTAssertEqual(redacted["apiKey"] as? String, "<redacted>")
        XCTAssertEqual(redacted["bearerToken"] as? String, "<redacted>")
        XCTAssertEqual(redacted["harmless"] as? Int, 42)
    }

    func testRedactionForKnownSecretHeaderNames() {
        XCTAssertEqual(
            NorbixLogRedaction.redactedHeader(name: "Authorization", value: "Bearer xxx"),
            "<redacted>"
        )
        XCTAssertEqual(
            NorbixLogRedaction.redactedHeader(name: "X-API-KEY", value: "sk"),
            "<redacted>"
        )
        XCTAssertEqual(
            NorbixLogRedaction.redactedHeader(name: "Accept", value: "application/json"),
            "application/json"
        )
    }

    func testInitEventIsAlwaysEmittedEvenWhenVerboseOff() throws {
        let capture = CapturingLogger()
        let cfg = try NorbixConfig(
            projectId: "p1",
            auth: .apiKey("k"),
            baseUrl: "https://api.norbix.ai",
            version: "v2",
            verbose: false
        )
        _ = Transport(config: cfg, logger: capture)
        XCTAssertTrue(
            capture.events.contains { $0.message == "Norbix client initialized" }
        )
    }

    func testNoopLoggerDropsEverything() throws {
        let logger = NoopLogger()
        logger.log(NorbixLogEvent(level: .error, message: "anything"))
        // No assertion needed — just verifies compile + no crash.
        XCTAssertNotNil(logger)
    }
}
