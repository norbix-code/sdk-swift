import Foundation
import NorbixCore

/// The project-user side of the Code module (`/{version}/code/*`): the workflow
/// runs a signed-in user can see and resume, and the signed resume links.
/// Workflows are in beta; bugs may occur.
public final class CodeModule: Sendable {
    let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

    /// Beta: runs across workflows. Query: `status?`, `waitingKind?`, `assignee?` (`me` or `usr_…`), `workflowId?`, `key?`, paging.
    public func getCodeWorkflowWaitingRuns(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/code/workflows/runs",
            method: "GET",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Beta: resumes a waiting run. Path: `runId`; body: `stepId?`, `decision?` (`approved` / `rejected`), `payload?`.
    public func resumeCodeWorkflowRun(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/code/workflows/runs/{RunId}/resume",
            method: "POST",
            request: request,
            scope: .project,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Beta: checks and shows a signed resume link; nothing changes. Path: `token`.
    /// The token is the key: auth is sent only when the client has one (`.optional` scope).
    public func openCodeWorkflowResumeLink(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/code/workflows/resume/{Token}",
            method: "GET",
            request: request,
            scope: .optional,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }

    /// Beta: answers a signed resume link (the decision is in the token). Path: `token`.
    /// The token is the key: auth is sent only when the client has one (`.optional` scope).
    public func useCodeWorkflowResumeLink(_ request: [String: Any] = [:], timeout: TimeInterval? = nil, bearerToken: String? = nil) async throws -> Any? {
        try await transport.send(
            path: "/{version}/code/workflows/resume/{Token}",
            method: "POST",
            request: request,
            scope: .optional,
            timeout: timeout,
            bearerToken: bearerToken
        )
    }
}
