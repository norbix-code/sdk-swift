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
}
