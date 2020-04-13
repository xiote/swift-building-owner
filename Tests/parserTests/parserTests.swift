@testable import Parser
import XCTest

final class ParserTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Parser().text, "Hello, World!")
    }

    func testParse() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.

        var input = """
        {"sigungu_cd":41410}
        """
        var want = OwnerInfo(sigunguCd: 41410)

        XCTAssertEqual(Parser().parse(input), want)
    }

    func testParseXml() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.

        var input = """
        <item>
            <sigungu_cd>41410</sigungu_cd>
        </item>
        """
        var want = OwnerInfo(sigunguCd: 41410)

        XCTAssertEqual(Parser().parseXml(input), want)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
