import XCTest
@testable import NorbixHub
import NorbixCore

final class EnvironmentsModuleTests: XCTestCase {
    func testProdDefaultOmitsEnvHeader() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixHubClient(projectId: "p1", apiKey: "key", executor: mock)
        _ = try await client.environments.getProjectEnvironments([:])
        XCTAssertNil(mock.lastRequest?.value(forHTTPHeaderField: "norbix-env"))
        XCTAssertTrue(
            mock.lastRequest?.url?.absoluteString
                .hasSuffix("/account/projects/environments") == true
        )
    }

    func testConfiguredEnvSetsHeader() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixHubClient(projectId: "p1", apiKey: "key", env: "TEST", executor: mock)
        XCTAssertEqual(client.env, "TEST")
        _ = try await client.environments.getProjectEnvironments([:])
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "norbix-env"), "TEST")
    }

    func testPerCallEnvOverridesDefault() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixHubClient(projectId: "p1", apiKey: "key", env: "TEST", executor: mock)
        _ = try await client.environments.getProjectEnvironments([:], env: "STAGING")
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "norbix-env"), "STAGING")
    }

    func testSetEnvRuntimeAndProdClears() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixHubClient(projectId: "p1", apiKey: "key", executor: mock)
        client.setEnv("TEST")
        XCTAssertEqual(client.env, "TEST")
        _ = try await client.environments.getProjectEnvironments([:])
        XCTAssertEqual(mock.lastRequest?.value(forHTTPHeaderField: "norbix-env"), "TEST")

        client.setEnv("PROD")
        _ = try await client.environments.getProjectEnvironments([:])
        XCTAssertNil(mock.lastRequest?.value(forHTTPHeaderField: "norbix-env"))
    }

    func testCreateAndDeleteRoutes() async throws {
        let mock = MockHTTPExecutor()
        let client = try NorbixHubClient(projectId: "p1", apiKey: "key", executor: mock)

        _ = try await client.environments.createProjectEnvironment([
            "environmentName": "TEST",
            "integration": [:]
        ])
        XCTAssertEqual(mock.lastRequest?.httpMethod, "POST")
        XCTAssertTrue(
            mock.lastRequest?.url?.absoluteString
                .hasSuffix("/account/projects/environments") == true
        )

        _ = try await client.environments.deleteProjectEnvironment(environmentName: "TEST")
        XCTAssertEqual(mock.lastRequest?.httpMethod, "DELETE")
        XCTAssertTrue(
            mock.lastRequest?.url?.absoluteString
                .hasSuffix("/account/projects/environments/TEST") == true
        )
    }
}
