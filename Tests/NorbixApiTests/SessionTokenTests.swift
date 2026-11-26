import XCTest
@testable import NorbixApi
import NorbixCore

/// Sessions (D18): `rememberMe` on the password sign-in, and the renewed
/// bearer token in the `norbix-session-token` answer header. The swap is
/// checked by the `Authorization` header of the next request.
final class SessionTokenTests: XCTestCase {
    /// Records the tokens the callback got. Test-only, so the lock is enough.
    final class Seen: @unchecked Sendable {
        private let lock = NSLock()
        private var _tokens: [String] = []
        var tokens: [String] { lock.lock(); defer { lock.unlock() }; return _tokens }
        func add(_ token: String) { lock.lock(); _tokens.append(token); lock.unlock() }
    }

    private func ok(_ headers: [String: String] = [:]) -> (status: Int, body: Data, headers: [String: String]) {
        (200, Data("{}".utf8), headers)
    }

    private func makeClient(
        _ mock: MockHTTPExecutor,
        bearerToken: String? = "jwt-old",
        apiKey: String? = nil,
        seen: Seen
    ) throws -> NorbixApiClient {
        try NorbixApiClient(
            projectId: "pr_1", apiKey: apiKey, bearerToken: bearerToken,
            baseUrl: "https://api.test",
            onSessionToken: { seen.add($0) },
            executor: mock
        )
    }

    private func authorization(_ mock: MockHTTPExecutor, _ index: Int) -> String? {
        mock.capturedRequests[index].value(forHTTPHeaderField: "Authorization")
    }

    func testHeaderPresentSwapsTheStoredTokenAndCallsTheCallback() async throws {
        let mock = MockHTTPExecutor()
        mock.responseQueue = [ok(["norbix-session-token": "jwt-new"]), ok()]
        let seen = Seen()
        let client = try makeClient(mock, seen: seen)

        _ = try await client.membership.getUsers()
        _ = try await client.membership.getUsers()

        XCTAssertEqual(authorization(mock, 0), "Bearer jwt-old")
        XCTAssertEqual(authorization(mock, 1), "Bearer jwt-new")
        XCTAssertEqual(seen.tokens, ["jwt-new"])
    }

    func testHeaderOnAnErrorAnswerStillSwaps() async throws {
        let mock = MockHTTPExecutor()
        mock.responseQueue = [(404, Data("{}".utf8), ["norbix-session-token": "jwt-new"]), ok()]
        let seen = Seen()
        let client = try makeClient(mock, seen: seen)

        do { _ = try await client.membership.getUsers(); XCTFail("expected a 404") } catch {}
        _ = try await client.membership.getUsers()

        XCTAssertEqual(authorization(mock, 1), "Bearer jwt-new")
        XCTAssertEqual(seen.tokens, ["jwt-new"])
    }

    func testHeaderAbsentLeavesTheTokenAlone() async throws {
        let mock = MockHTTPExecutor()
        mock.responseQueue = [ok(), ok()]
        let seen = Seen()
        let client = try makeClient(mock, seen: seen)

        _ = try await client.membership.getUsers()
        _ = try await client.membership.getUsers()

        XCTAssertEqual(authorization(mock, 1), "Bearer jwt-old")
        XCTAssertTrue(seen.tokens.isEmpty)
    }

    func testEmptyHeaderIsIgnored() async throws {
        let mock = MockHTTPExecutor()
        mock.responseQueue = [ok(["norbix-session-token": "  "]), ok()]
        let seen = Seen()
        let client = try makeClient(mock, seen: seen)

        _ = try await client.membership.getUsers()
        _ = try await client.membership.getUsers()

        XCTAssertEqual(authorization(mock, 1), "Bearer jwt-old")
        XCTAssertTrue(seen.tokens.isEmpty)
    }

    func testApiKeyClientIsNeverSwapped() async throws {
        let mock = MockHTTPExecutor()
        mock.responseQueue = [ok(["norbix-session-token": "jwt-new"]), ok()]
        let seen = Seen()
        let client = try makeClient(mock, bearerToken: nil, apiKey: "sk_key", seen: seen)

        _ = try await client.membership.getUsers()
        _ = try await client.membership.getUsers()

        XCTAssertEqual(authorization(mock, 1), "Bearer sk_key")
        XCTAssertTrue(seen.tokens.isEmpty)
    }

    func testPerCallBearerTokenIsNeverSwapped() async throws {
        let mock = MockHTTPExecutor()
        mock.responseQueue = [ok(["norbix-session-token": "jwt-new"]), ok()]
        let seen = Seen()
        let client = try makeClient(mock, seen: seen)

        _ = try await client.membership.getUsers(bearerToken: "jwt-other")
        _ = try await client.membership.getUsers()

        XCTAssertEqual(authorization(mock, 0), "Bearer jwt-other")
        XCTAssertEqual(authorization(mock, 1), "Bearer jwt-old")
        XCTAssertTrue(seen.tokens.isEmpty)
    }

    /// Signs another user in while the first call is on the way.
    final class SwapWhileInFlight: HTTPExecuting, @unchecked Sendable {
        let inner = MockHTTPExecutor()
        var client: NorbixApiClient?
        func execute(_ request: URLRequest) async throws -> (Data, HTTPURLResponse) {
            if inner.capturedRequests.isEmpty { client?.setBearerToken("jwt-user-2") }
            return try await inner.execute(request)
        }
    }

    func testTokenReplacedInFlightIsKept() async throws {
        let executor = SwapWhileInFlight()
        executor.inner.responseQueue = [ok(["norbix-session-token": "jwt-new"]), ok()]
        let seen = Seen()
        let client = try NorbixApiClient(
            projectId: "pr_1", bearerToken: "jwt-old", baseUrl: "https://api.test",
            onSessionToken: { seen.add($0) }, executor: executor
        )
        executor.client = client

        _ = try await client.membership.getUsers()
        _ = try await client.membership.getUsers()

        XCTAssertEqual(executor.inner.capturedRequests[0].value(forHTTPHeaderField: "Authorization"), "Bearer jwt-old")
        XCTAssertEqual(executor.inner.capturedRequests[1].value(forHTTPHeaderField: "Authorization"), "Bearer jwt-user-2")
        XCTAssertTrue(seen.tokens.isEmpty)
        executor.client = nil
    }

    func testLoginSendsRememberMeFalseByDefault() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"bearerToken":"jwt-1"}"#.utf8)
        let client = try makeClient(mock, bearerToken: nil, seen: Seen())

        _ = try await client.login(.init(userName: "a@b.c", password: "pw"))

        let body = try XCTUnwrap(JSONSerialization.jsonObject(with: XCTUnwrap(mock.lastRequest?.httpBody)) as? [String: Any])
        XCTAssertEqual(body["rememberMe"] as? Bool, false)
        XCTAssertEqual(body["userName"] as? String, "a@b.c")
    }

    func testLoginSendsRememberMeTrue() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"bearerToken":"jwt-1"}"#.utf8)
        let client = try makeClient(mock, bearerToken: nil, seen: Seen())

        _ = try await client.login(.init(userName: "a@b.c", password: "pw", rememberMe: true))

        let body = try XCTUnwrap(JSONSerialization.jsonObject(with: XCTUnwrap(mock.lastRequest?.httpBody)) as? [String: Any])
        XCTAssertEqual(body["rememberMe"] as? Bool, true)
    }

    func testGetUserAiPlanReadsOneUsersPlan() async throws {
        let mock = MockHTTPExecutor()
        let client = try makeClient(mock, seen: Seen())

        _ = try await client.membership.getUserAiPlan(["userId": "usr_1"])

        XCTAssertEqual(mock.lastRequest?.httpMethod, "GET")
        XCTAssertEqual(mock.lastRequest?.url?.path, "/v3/membership/users/usr_1/ai-plan")
    }
}
