import XCTest
import FluentInterface

final class fluentinterfaceDataTests: XCTestCase {
	func testFlentInterfaceWithData() {
		struct TargetData:Equatable {
			var value = 0
		}
		let value = 2
		let objectOLDWay:TargetData = {
			var object = TargetData()
			object.value = value
			return object
		}()
		let objectNewWay = TargetData()+
			.value(value)
			.unwrappingSubject()
		XCTAssertEqual(objectOLDWay, objectNewWay)
	}
	
	static var allTests = [
		("testFlentInterfaceWithData", testFlentInterfaceWithData),
	]
}
