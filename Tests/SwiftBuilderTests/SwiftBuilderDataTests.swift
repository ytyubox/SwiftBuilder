import XCTest
import SwiftBuilder

final class SwiftBuilderDataTests: XCTestCase {
	func testSwiftBuilderWithData() {
		struct TargetData:Equatable {
			var value = 0
		}
		let value = 2
		let objectOLDWay:TargetData = {
			var object = TargetData()
			object.value = value
			return object
		}()
		let objectNewWay = Builder(TargetData())
			.value(value)
			.build()
		XCTAssertEqual(objectOLDWay, objectNewWay)
	}
	
	static var allTests = [
		("testSwiftBuilderWithData", testSwiftBuilderWithData),
	]
}
