import Foundation
import NorbixCore

final class MockHTTPExecutor: HTTPExecuting, @unchecked Sendable {
    var lastRequest: URLRequest?
    var capturedRequests: [URLRequest] = []
    var responseStatus: Int = 200
    var responseBody: Data = Data("{}".utf8)
    var responseQueue: [(status: Int, body: Data, headers: [String: String])] = []

    func execute(_ request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        lastRequest = request
        capturedRequests.append(request)

        if !responseQueue.isEmpty {
            let next = responseQueue.removeFirst()
            let response = HTTPURLResponse(
                url: request.url ?? URL(string: "https://hub.norbix.ai")!,
                statusCode: next.status,
                httpVersion: nil,
                headerFields: next.headers
            )!
            return (next.body, response)
        }

        let response = HTTPURLResponse(
            url: request.url ?? URL(string: "https://hub.norbix.ai")!,
            statusCode: responseStatus,
            httpVersion: nil,
            headerFields: nil
        )!
        return (responseBody, response)
    }
}
