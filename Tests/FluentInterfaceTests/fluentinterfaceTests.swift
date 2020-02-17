import XCTest
import FluentInterface

fileprivate func == (lhs: TargetObject, rhs: TargetObject) -> Bool {
	return lhs.value == rhs.value
}
fileprivate class TargetObject:Equatable {
	var value = 0
}

final class fluentinterfaceTests: XCTestCase {
	func testFlentInterfaceWithObject() {
		let value = 2
		let objectOLDWay:TargetObject = {
			let object = TargetObject()
			object.value = value
			return object
		}()
		let objectNewWay = TargetObject()+
			.value(value)-
		XCTAssertEqual(objectOLDWay, objectNewWay)
	}
	
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
			.value(value)-
		XCTAssertEqual(objectOLDWay, objectNewWay)
	}
	
	static var allTests = [
		("testFlentInterfaceWithObject", testFlentInterfaceWithObject),
		("testFlentInterfaceWithData", testFlentInterfaceWithData),
	]
}
