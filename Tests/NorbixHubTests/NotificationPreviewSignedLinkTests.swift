import XCTest
@testable import NorbixHub
import NorbixCore

/// The three notification preview routes open with a signed link (`hash`)
/// alone. A client with no credentials must still send the call — with no
/// Authorization header — and a client with a key must still send it.
final class NotificationPreviewSignedLinkTests: XCTestCase {
    private typealias Preview = (NotificationsModule, [String: Any]) async throws -> Any?

    private let previews: [(kind: String, call: Preview)] = [
        ("push", { try await $0.previewPushNotification($1) }),
        ("email", { try await $0.previewEmailNotification($1) }),
        ("sms", { try await $0.previewSmsNotification($1) }),
    ]

    func testPreviewWithSignedLinkAndNoCredentialsSendsNoAuthorization() async throws {
        for preview in previews {
            let mock = MockHTTPExecutor()
            let config = try NorbixConfig(projectId: "proj", baseUrl: "https://hub.example.test", version: "v2")
            let client = NorbixHubClient(config: config, executor: mock)

            _ = try await preview.call(client.notifications, ["hash": "signed-link-abc"])

            let request = try XCTUnwrap(mock.lastRequest, preview.kind)
            XCTAssertEqual(request.url?.path, "/v2/notifications/\(preview.kind)/preview", preview.kind)
            XCTAssertEqual(request.url?.query, "hash=signed-link-abc", preview.kind)
            XCTAssertNil(
                request.value(forHTTPHeaderField: "Authorization"),
                "\(preview.kind): a signed preview link must work without signing in"
            )
        }
    }

    func testPreviewWithApiKeySendsAuthorization() async throws {
        for preview in previews {
            let mock = MockHTTPExecutor()
            let config = try NorbixConfig(
                projectId: "proj",
                auth: .apiKey("sk_test"),
                baseUrl: "https://hub.example.test",
                version: "v2"
            )
            let client = NorbixHubClient(config: config, executor: mock)

            _ = try await preview.call(client.notifications, ["hash": "signed-link-abc"])

            XCTAssertEqual(
                mock.lastRequest?.value(forHTTPHeaderField: "Authorization"),
                "Bearer sk_test",
                preview.kind
            )
        }
    }
}
