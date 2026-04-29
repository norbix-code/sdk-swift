import XCTest
@testable import NorbixCore

final class NorbixConfigTests: XCTestCase {
    func testFromEnvironmentApi() throws {
        let env = [
            "NORBIX_PROJECT_ID": "proj_123",
            "NORBIX_API_KEY": "sk_live_xxx",
            "NORBIX_ACCOUNT_ID": "acc_456"
        ]
        let cfg = try NorbixConfig.fromEnvironment(target: .api, environment: env)
        XCTAssertEqual(cfg.projectId, "proj_123")
        XCTAssertEqual(cfg.accountId, "acc_456")
        XCTAssertEqual(cfg.baseUrl, NorbixDefaults.apiBaseUrl)
        if case .apiKey(let key) = cfg.auth {
            XCTAssertEqual(key, "sk_live_xxx")
        } else {
            XCTFail("expected .apiKey, got \(cfg.auth)")
        }
    }

    func testFromEnvironmentHubWithCustomBaseUrl() throws {
        let env = [
            "NORBIX_PROJECT_ID": "proj_123",
            "NORBIX_API_KEY": "sk",
            "NORBIX_HUB_URL": "https://hub.norbix.isidos.lt"
        ]
        let cfg = try NorbixConfig.fromEnvironment(target: .hub, environment: env)
        XCTAssertEqual(cfg.baseUrl, "https://hub.norbix.isidos.lt")
    }

    func testBearerWinsOverApiKey() throws {
        let env = [
            "NORBIX_PROJECT_ID": "proj_123",
            "NORBIX_API_KEY": "sk",
            "NORBIX_BEARER_TOKEN": "jwt"
        ]
        let cfg = try NorbixConfig.fromEnvironment(target: .api, environment: env)
        if case .bearerToken(let token) = cfg.auth {
            XCTAssertEqual(token, "jwt")
        } else {
            XCTFail("expected .bearerToken, got \(cfg.auth)")
        }
    }

    func testThrowsWhenProjectIdMissing() {
        XCTAssertThrowsError(
            try NorbixConfig.fromEnvironment(target: .api, environment: [:])
        ) { error in
            guard let nbx = error as? NorbixError else {
                XCTFail("expected NorbixError")
                return
            }
            XCTAssertEqual(nbx.code, "NORBIX_CONFIG_INVALID")
        }
    }

    func testManualConfigDefaultsToProduction() throws {
        let cfg = try NorbixConfig(
            projectId: "p1",
            auth: .apiKey("k"),
            baseUrl: NorbixDefaults.apiBaseUrl,
            version: NorbixDefaults.apiVersion
        )
        XCTAssertEqual(cfg.baseUrl, "https://api.norbix.ai")
    }
}
