import XCTest
@testable import NorbixCore

/// The label of a project's own API host. The first three labels are the
/// server's own values (project DTO `hostLabel`, a project's DNS record, the
/// API host an install reports), not this decoder's — devops
/// docs/tasks/clients-project-host.md.
final class ProjectHostLabelTests: XCTestCase {
    private let vectors: [(String, String)] = [
        ("pr_5XvmrTA6JVggZdmEE5bGdm", "pr-022c4aca9f9e4df787ab0a20c83c44b6"),
        ("pr_3vlTD52e9VK8lXzdv0SmWG", "pr-184336d00e2141c3be5138e8dcf52e81"),
        ("pr_89W9MJvt0StwxsEvyohlJ", "pr-60d101b1938747659947d507192a5204"),
        ("pr_xCeyU0VjHvjVi5MpOYSGY", "pr-6b8b6182960c416098d153d3eb0e601f")
    ]

    func testProjectIdGivesTheHostLabel() {
        for (projectId, label) in vectors {
            XCTAssertEqual(NorbixDefaults.projectHostLabel(projectId), label, projectId)
        }
    }

    func testAnythingElseGivesNoLabel() {
        let notAProjectId = [
            "p1",
            "proj_123",
            "pr_",
            "pr_!!!",
            "pr_zzzzzzzzzzzzzzzzzzzzzzz",   // 23 characters: too long
            "pr_zzzzzzzzzzzzzzzzzzzzzz",    // 22 characters, 2^128 or more
            "acc_oOAAIfAzbauZ6f0NHEHjP",
            "",
            "pr_0",                         // a number, not a version-4 GUID
            "PR_5XvmrTA6JVggZdmEE5bGdm",    // the prefix is lower case
            "pr_5XvmrTA6JVggZdmEE5bGd\u{00E9}",
            "pr_5XvmrTA6JVgg ZdmEE5bGdm"
        ]
        for value in notAProjectId {
            XCTAssertNil(NorbixDefaults.projectHostLabel(value), "\"\(value)\"")
        }
        XCTAssertNil(NorbixDefaults.projectHostLabel(nil))
    }

    func testProjectBaseUrl() {
        XCTAssertEqual(
            NorbixDefaults.projectBaseUrl("pr_5XvmrTA6JVggZdmEE5bGdm"),
            "https://pr-022c4aca9f9e4df787ab0a20c83c44b6.api.norbix.ai"
        )
        XCTAssertNil(NorbixDefaults.projectBaseUrl("p1"))
        XCTAssertNil(NorbixDefaults.projectBaseUrl(nil))
    }

    // MARK: - projectApiBaseUrl (round 2)

    private let virginia = "pr_5XvmrTA6JVggZdmEE5bGdm"
    private let virginiaLabel = "pr-022c4aca9f9e4df787ab0a20c83c44b6"
    private let germany = "pr_3vlTD52e9VK8lXzdv0SmWG"
    private let germanyLabel = "pr-184336d00e2141c3be5138e8dcf52e81"

    private func assertBase(
        _ baseUrl: String, _ projectId: String?,
        project: String, shared: String,
        file: StaticString = #filePath, line: UInt = #line
    ) {
        let result = NorbixDefaults.projectApiBaseUrl(baseUrl, projectId: projectId)
        XCTAssertEqual(result.project, project, "project of \(baseUrl)", file: file, line: line)
        XCTAssertEqual(result.shared, shared, "shared of \(baseUrl)", file: file, line: line)
    }

    func testTheNorbixAiAddressGoesToTheProjectHost() {
        assertBase("https://api.norbix.ai", virginia,
                   project: "https://\(virginiaLabel).api.norbix.ai", shared: "https://api.norbix.ai")
        assertBase("https://nb-eu-germany.api.norbix.ai", germany,
                   project: "https://\(germanyLabel).api.norbix.ai",
                   shared: "https://nb-eu-germany.api.norbix.ai")
        assertBase("https://api.norbix.ai/v3", virginia,
                   project: "https://\(virginiaLabel).api.norbix.ai/v3", shared: "https://api.norbix.ai/v3")
        assertBase("https://api.norbix.ai/", virginia,
                   project: "https://\(virginiaLabel).api.norbix.ai/", shared: "https://api.norbix.ai/")
        assertBase("HTTPS://API.Norbix.AI", virginia,
                   project: "HTTPS://\(virginiaLabel).api.norbix.ai", shared: "HTTPS://API.Norbix.AI")
        // No label: the address as given.
        assertBase("https://nb-eu-germany.api.norbix.ai", "p1",
                   project: "https://nb-eu-germany.api.norbix.ai",
                   shared: "https://nb-eu-germany.api.norbix.ai")
    }

    func testATemplateIsFilledWithTheLabel() {
        assertBase("https://{projectHostLabel}.api.customer.com", virginia,
                   project: "https://\(virginiaLabel).api.customer.com", shared: "https://api.customer.com")
        assertBase("http://{projectHostLabel}.api.local.norbix.test:8443/v3", virginia,
                   project: "http://\(virginiaLabel).api.local.norbix.test:8443/v3",
                   shared: "http://api.local.norbix.test:8443/v3")
        assertBase("https://{projectHostLabel}.api.customer.com", "p1",
                   project: "https://api.customer.com", shared: "https://api.customer.com")
        assertBase("https://{projectHostLabel}.api.customer.com", nil,
                   project: "https://api.customer.com", shared: "https://api.customer.com")
        XCTAssertEqual(NorbixDefaults.projectHostLabelPlaceholder, "{projectHostLabel}")
    }

    func testAPastedProjectHostGetsTheCurrentProjectsLabel() {
        assertBase("https://\(virginiaLabel).api.customer.com", germany,
                   project: "https://\(germanyLabel).api.customer.com", shared: "https://api.customer.com")
        assertBase("https://PR-022C4ACA9F9E4DF787AB0A20C83C44B6.api.norbix.ai:444/v3/", germany,
                   project: "https://\(germanyLabel).api.norbix.ai:444/v3/",
                   shared: "https://api.norbix.ai:444/v3/")
        assertBase("https://\(virginiaLabel).api.customer.com", "p1",
                   project: "https://api.customer.com", shared: "https://api.customer.com")
    }

    func testAnyOtherAddressIsUsedAsGiven() {
        for address in [
            "https://api.customer.com",
            "https://api.norbix.io",
            "http://localhost:5002",
            "http://api.norbix.ai",
            "https://a.b.api.norbix.ai",
            "https://myapi.norbix.ai",
            "https://pr-022c4aca9f9e4df787ab0a20c83c44b.api.customer.com",
            "not a url",
            ""
        ] {
            assertBase(address, virginia, project: address, shared: address)
        }
    }
}
