import XCTest
@testable import fluentinterface

final class fluentinterfaceTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(fluentinterface().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
