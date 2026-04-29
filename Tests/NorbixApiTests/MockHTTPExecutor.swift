import Foundation
import NorbixCore

/// Test mock. Has mutable state, so we opt out of Sendable checks for this
/// test-only type.
final class MockHTTPExecutor: HTTPExecuting, @unchecked Sendable {
    var lastRequest: URLRequest?
    var capturedRequests: [URLRequest] = []
    var responseStatus: Int = 200
    var responseBody: Data = Data("{}".utf8)
    /// If set, each call shifts the next response off the front. When the
    /// queue is empty the mock falls back to `responseStatus` / `responseBody`.
    var responseQueue: [(status: Int, body: Data, headers: [String: String])] = []

    func execute(_ request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        lastRequest = request
        capturedRequests.append(request)

        if !responseQueue.isEmpty {
            let next = responseQueue.removeFirst()
            let response = HTTPURLResponse(
                url: request.url ?? URL(string: "https://api.norbix.ai")!,
                statusCode: next.status,
                httpVersion: nil,
                headerFields: next.headers
            )!
            return (next.body, response)
        }

        let response = HTTPURLResponse(
            url: request.url ?? URL(string: "https://api.norbix.ai")!,
            statusCode: responseStatus,
            httpVersion: nil,
            headerFields: nil
        )!
        return (responseBody, response)
    }
}
