import XCTest
import FluentInterface

fileprivate func == (lhs: TargetObject, rhs: TargetObject) -> Bool {
	return lhs.value == rhs.value
}
fileprivate class TargetObject:Equatable {
	var value = 0
}

final class fluentinterfaceObjectTests: XCTestCase {
	func testFlentInterfaceWithObject() {
		let value = 2
		let objectOLDWay:TargetObject = {
			let object = TargetObject()
			object.value = value
			return object
		}()
		let objectNewWay = TargetObject()+
			.value(value)
			.unwrappingSubject()
		XCTAssertEqual(objectOLDWay, objectNewWay)
	}
	
	static var allTests = [
		("testFlentInterfaceWithObject", testFlentInterfaceWithObject)
	]
}
