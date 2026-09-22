import XCTest
@testable import NorbixApi
import NorbixCore

/// What the caller sees when a call fails (10b-files slice ERRORS, #66, #67).
///
/// Two rules are pinned here. First, the message and the error code are the
/// gateway's own: the gateway puts them inside `responseStatus.errors[]`, so
/// reading the top of that block gave every caller "Request failed" and
/// `HTTP_404` — that was #66. Second, a call fails when the gateway says it
/// failed, even with HTTP 200 and `responseStatus.isSuccess = false` — that
/// was #67.
///
/// Every test builds its own client and its own fake answer, so the order the
/// tests run in does not matter and no real gateway is contacted.
final class GatewayErrorTests: XCTestCase {

    private func makeClient(_ mock: MockHTTPExecutor) throws -> NorbixApiClient {
        try NorbixApiClient(projectId: "p1", apiKey: "k", executor: mock)
    }

    /// Any call does; the transport is the same for all of them.
    private func aCall(_ client: NorbixApiClient) async throws {
        _ = try await client.files.getInfo(integrationId: "nbin_1", path: "a/b.txt")
    }

    private func failure(
        status: Int,
        body: String,
        file: StaticString = #filePath,
        line: UInt = #line
    ) async throws -> NorbixError {
        let mock = MockHTTPExecutor()
        mock.responseStatus = status
        mock.responseBody = Data(body.utf8)
        let client = try makeClient(mock)

        do {
            try await aCall(client)
            XCTFail("expected the call to fail", file: file, line: line)
            return NorbixError(message: "no error")
        } catch let error as NorbixError {
            return error
        }
    }

    // MARK: - (a) HTTP 400 with two errors inside responseStatus.errors

    func testA400TakesMessageAndCodeFromTheFirstErrorAndKeepsThemAll() async throws {
        let error = try await failure(status: 400, body: #"""
        {"responseStatus":{"isSuccess":false,"errors":[
          {"message":"File name is required","errorCode":"CM-ERRORS-FILES-002","fieldName":"fileName"},
          {"message":"Folder does not exist","errorCode":"CM-ERRORS-FILES-016","context":{"Provider":"Local"}}
        ]}}
        """#)

        XCTAssertEqual(error.message, "File name is required")
        XCTAssertEqual(error.errorCode, "CM-ERRORS-FILES-002")
        XCTAssertEqual(error.httpStatus, 400)
        XCTAssertEqual(error.errors.count, 2)
        XCTAssertEqual(error.errors[0].fieldName, "fileName")
        XCTAssertEqual(error.errors[1].errorCode, "CM-ERRORS-FILES-016")
        XCTAssertEqual(error.errors[1].context["Provider"], "Local")
        XCTAssertNotNil(error.body)
    }

    // MARK: - (b) HTTP 200 whose body says the call failed

    func testA200ThatSaysItFailedIsAnError() async throws {
        let error = try await failure(status: 200, body: #"""
        {"responseStatus":{"isSuccess":false,"errors":[
          {"message":"File not found: \"a/b.txt\" does not exist in Local (nbin_1).",
           "errorCode":"CM-ERRORS-FILES-016"}
        ]}}
        """#)

        XCTAssertEqual(error.httpStatus, 200)
        XCTAssertEqual(
            error.message,
            #"File not found: "a/b.txt" does not exist in Local (nbin_1)."#
        )
        XCTAssertEqual(error.errorCode, "CM-ERRORS-FILES-016")
    }

    // MARK: - (c) HTTP 200 that says the call worked — unchanged

    func testA200ThatSaysItWorkedStillComesBackAsAValue() async throws {
        let mock = MockHTTPExecutor()
        // `file` is optional on FileDetails; the point here is only that a
        // successful answer is still decoded and handed back.
        mock.responseBody = Data(#"{"isPublic":false,"responseStatus":{"isSuccess":true}}"#.utf8)
        let client = try makeClient(mock)

        try await aCall(client)
    }

    func testA200WithNoResponseStatusStillComesBackAsAValue() async throws {
        let mock = MockHTTPExecutor()
        mock.responseBody = Data(#"{"isPublic":false}"#.utf8)
        let client = try makeClient(mock)

        try await aCall(client)
    }

    // MARK: - (d) a 500 whose body is not JSON at all

    func testA500WithABodyThatIsNotJSONUsesTheFallbackText() async throws {
        let error = try await failure(status: 500, body: "<html>Bad Gateway</html>")

        XCTAssertEqual(error.message, "Request failed (HTTP 500)")
        XCTAssertEqual(error.errorCode, "HTTP_500")
        XCTAssertEqual(error.body, "<html>Bad Gateway</html>")
        XCTAssertTrue(error.errors.isEmpty)
    }

    func testAnEmptyErrorBodyUsesTheFallbackTextToo() async throws {
        let error = try await failure(status: 404, body: "{}")

        XCTAssertEqual(error.message, "Request failed (HTTP 404)")
    }

    func testReadsTheTopOfTheBodyWhenThereIsNoResponseStatus() async throws {
        let error = try await failure(
            status: 409,
            body: #"{"message":"Already exists","errorCode":"CM-ERRORS-FILES-009"}"#
        )

        XCTAssertEqual(error.message, "Already exists")
        XCTAssertEqual(error.errorCode, "CM-ERRORS-FILES-009")
    }
}
