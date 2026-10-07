import XCTest
@testable import NorbixCore

/// `ExpandedReference` — the typed `{ id, display }` pair a record read
/// returns with `expandReferences: true` (gateway campaign schema-content).
/// Decoding from the gateway's JSON, reading out of an untyped answer, and
/// the text helper. No transport involved.
final class ExpandedReferenceTests: XCTestCase {

    private func decode(_ json: String) throws -> ExpandedReference {
        try JSONDecoder().decode(ExpandedReference.self, from: Data(json.utf8))
    }

    // MARK: - Codable

    func testDecodesAPairWithATextDisplay() throws {
        let ref = try decode(#"{"id":"usr_1","display":"Jane Doe"}"#)
        XCTAssertEqual(ref, ExpandedReference(id: "usr_1", display: .text("Jane Doe")))
        XCTAssertTrue(ref.isResolved)
        XCTAssertEqual(ref.displayText(), "Jane Doe")
    }

    func testDecodesATranslatedDisplay() throws {
        let ref = try decode(#"{"id":"6650","display":{"en":"News","lt":"Naujienos"}}"#)
        XCTAssertEqual(ref.display, .translated(["en": "News", "lt": "Naujienos"]))
        XCTAssertEqual(ref.displayText(language: "lt"), "Naujienos")
        XCTAssertEqual(ref.displayText(language: "fr"), "News", "unknown language falls back to en")
        XCTAssertEqual(ref.displayText(), "News")
    }

    func testANullDisplayIsAnUnresolvedTarget() throws {
        let ref = try decode(#"{"id":"6651","display":null}"#)
        XCTAssertEqual(ref.id, "6651")
        XCTAssertNil(ref.display)
        XCTAssertFalse(ref.isResolved)
        XCTAssertNil(ref.displayText())
    }

    func testABareIdDecodesAsUnresolved() throws {
        // A read made without the flag: the stored id alone.
        let ref = try decode(#""usr_1""#)
        XCTAssertEqual(ref, ExpandedReference(id: "usr_1", display: nil))
        XCTAssertFalse(ref.isResolved)
    }

    func testANumericDisplayBecomesText() throws {
        // displayField may name an integer / decimal field of the target.
        XCTAssertEqual(try decode(#"{"id":"rec_1","display":42}"#).displayText(), "42")
        XCTAssertEqual(try decode(#"{"id":"rec_1","display":true}"#).displayText(), "true")
    }

    func testEncodesBackToThePair() throws {
        let data = try JSONEncoder().encode(ExpandedReference(id: "usr_1", display: .text("Jane")))
        let json = try XCTUnwrap(JSONSerialization.jsonObject(with: data) as? [String: Any])
        XCTAssertEqual(json["id"] as? String, "usr_1")
        XCTAssertEqual(json["display"] as? String, "Jane")

        let translated = try JSONEncoder().encode(ExpandedReference(id: "t", display: .translated(["en": "News"])))
        let roundTrip = try JSONDecoder().decode(ExpandedReference.self, from: translated)
        XCTAssertEqual(roundTrip.display, .translated(["en": "News"]))

        let gone = try JSONEncoder().encode(ExpandedReference(id: "t", display: nil))
        let goneJson = try XCTUnwrap(JSONSerialization.jsonObject(with: gone) as? [String: Any])
        XCTAssertTrue(goneJson["display"] is NSNull)
    }

    func testDecodesInsideARecordAtDepth() throws {
        struct Line: Codable, Equatable { let sku: ExpandedReference; let qty: Int }
        struct Order: Codable, Equatable {
            let customer: ExpandedReference
            let tags: [ExpandedReference]
            let lines: [Line]
        }
        let json = #"""
        {"customer":{"id":"usr_1","display":"Jane Doe"},
         "tags":[{"id":"6650","display":{"en":"News"}},{"id":"6651","display":null}],
         "lines":[{"sku":{"id":"rec_9","display":"A-1"},"qty":2}]}
        """#
        let order = try JSONDecoder().decode(Order.self, from: Data(json.utf8))
        XCTAssertEqual(order.customer.displayText(), "Jane Doe")
        XCTAssertEqual(order.tags.map { $0.displayText() }, ["News", nil])
        XCTAssertEqual(order.tags[1].isResolved, false)
        XCTAssertEqual(order.lines[0].sku, ExpandedReference(id: "rec_9", display: .text("A-1")))
    }

    // MARK: - Untyped answers

    func testFromReadsAPairOutOfAnUntypedRecord() throws {
        let record = try XCTUnwrap(JSONSerialization.jsonObject(with: Data(#"""
        {"author":{"id":"usr_1","display":"Jane Doe"},"owner":"usr_2","price":{"id":"p","display":9.5},"gone":null}
        """#.utf8)) as? [String: Any])

        XCTAssertEqual(ExpandedReference.from(record["author"]), ExpandedReference(id: "usr_1", display: .text("Jane Doe")))
        XCTAssertEqual(ExpandedReference.from(record["owner"]), ExpandedReference(id: "usr_2", display: nil))
        XCTAssertEqual(ExpandedReference.from(record["price"])?.displayText(), "9.5")
        XCTAssertNil(ExpandedReference.from(record["gone"]))
        XCTAssertNil(ExpandedReference.from(record["missing"]))
        XCTAssertNil(ExpandedReference.from(42))
    }

    func testListFromReadsAMultipleReference() throws {
        let record = try XCTUnwrap(JSONSerialization.jsonObject(with: Data(#"""
        {"tags":[{"id":"6650","display":{"en":"News","lt":"Naujienos"}},{"id":"6651","display":null},"6652"]}
        """#.utf8)) as? [String: Any])

        let tags = ExpandedReference.listFrom(record["tags"])
        XCTAssertEqual(tags.map { $0.id }, ["6650", "6651", "6652"])
        XCTAssertEqual(tags.map { $0.displayText(language: "lt") }, ["Naujienos", nil, nil])
        XCTAssertEqual(tags.map { $0.isResolved }, [true, false, false])

        XCTAssertEqual(ExpandedReference.listFrom(nil), [])
        XCTAssertEqual(ExpandedReference.listFrom("one"), [ExpandedReference(id: "one", display: nil)])
    }
}
