import XCTest
import NorbixCore

// The gateway sends "description" (lower case). The upstream Swift DTO
// generator writes the property as `Description` so it does not clash with
// `CustomStringConvertible.description`, and a class without CodingKeys
// then looks for the JSON key "Description". Models must name the property
// `description` (or map it in CodingKeys); the SDK decoder must keep the
// default key strategy so that works.
final class DescriptionDecodingTests: XCTestCase {
    private let body = Data(#"{"name":"Admins","description":"Full access"}"#.utf8)

    private struct Role: Decodable {
        let name: String
        let description: String?
    }

    private final class UpstreamStyleRole: Decodable {
        var name: String?
        var Description: String?
    }

    func testNorbixDecoderReadsLowerCaseDescription() throws {
        let role = try JSONDecoder.norbixDefault.decode(Role.self, from: body)
        XCTAssertEqual(role.description, "Full access")
    }

    func testCapitalDescriptionWithoutCodingKeysDecodesEmpty() throws {
        let role = try JSONDecoder.norbixDefault.decode(UpstreamStyleRole.self, from: body)
        XCTAssertEqual(role.name, "Admins")
        XCTAssertNil(role.Description)
    }
}
