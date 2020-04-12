import XCTest
@testable import parser

final class parserTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(parser().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
