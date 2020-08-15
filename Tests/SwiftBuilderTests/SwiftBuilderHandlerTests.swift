import XCTest
import SwiftBuilder

class FluentinterfaceHandlerTests: XCTestCase {
	
	func testHandlingSubject() {
		class TestTarget {
			var int:Int = 1
			func doubleIt() {
				int *= 2
			}
		}
		let target = Builder(TestTarget())
			.handlingSubject{$0.doubleIt()}
		.build()
		
		XCTAssertEqual(target.int, 2)
	}
	func testManipulateSubjct() {
		struct TestTarget {
			var int:Int = 1
			mutating func doubleIt() {
				int *= 2
			}
		}
		let target = Builder(TestTarget())
			.manipulateSubjct{$0.doubleIt()}
		.build()
		
		XCTAssertEqual(target.int, 2)
	}
	static var allTests = [
		("testHandlingSubject", testHandlingSubject),
		("testManipulateSubjct",testManipulateSubjct),
	]
}
