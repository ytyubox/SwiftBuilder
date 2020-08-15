import XCTest
import SwiftBuilder

fileprivate func == (lhs: TargetObject, rhs: TargetObject) -> Bool {
	return lhs.value == rhs.value
}
fileprivate class TargetObject:Equatable {
	var value = 0
}

final class SwiftBuilderObjectTests: XCTestCase {
	func testSwiftBuilderWithObject() {
		let value = 2
		let objectOLDWay:TargetObject = {
			let object = TargetObject()
			object.value = value
			return object
		}()
		let objectNewWay = Builder(TargetObject())
			.value(value)
			.build()
		XCTAssertEqual(objectOLDWay, objectNewWay)
	}
	
	static var allTests = [
		("testSwiftBuilderWithObject", testSwiftBuilderWithObject)
	]
}
