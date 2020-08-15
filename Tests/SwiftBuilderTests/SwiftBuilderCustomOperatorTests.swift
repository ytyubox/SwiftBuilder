import XCTest
import SwiftBuilder



postfix operator >|
public postfix func >| <T>(lhs: T) -> Builder<T> {
  return Builder(lhs)
}

postfix operator |>

public postfix func |> <T>(lhs: Builder<T>) -> T {
    return lhs.build()
}

class CustomOperatorTests:XCTestCase {
	func testCustomOperator() {
		struct TargetData:Equatable {
			var value = 0
		}
		let value = 2
		let objectOLDWay:TargetData = {
			var object = TargetData()
			object.value = value
			return object
		}()
		let objectNewWay = TargetData()>|
			.value(value)|>
		XCTAssertEqual(objectOLDWay, objectNewWay)
	}
	
	static var allTests = [
		("testCustomOperator", testCustomOperator),
	]
}
