import XCTest
@testable import HTTPFormEncoder

final class HTTPFormEncoderTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(HTTPFormEncoder().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
