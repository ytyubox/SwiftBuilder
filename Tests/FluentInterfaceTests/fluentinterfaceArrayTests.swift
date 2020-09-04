//
//  fluentinterfaceArrayTests.swift
//  
//
//  Created by 游宗諭 on 2020/3/3.
//

import XCTest
import FluentInterface



final class fluentinterfaceArrayTests: XCTestCase {
	
	func testFIArray() {
		let repeatCount = 5
		struct TargetData:Equatable {
			var value = 0
		}
		let value = 2
		let objectOLDWay:[TargetData] = {
			var object = Array(repeating: TargetData(), count: repeatCount)
			
			for index in object.indices {
				object[index].value = value
			}
			return object
		}()
		let objectNewWay = Array(repeating: TargetData(), count: repeatCount)++
			.value(value)
			.unwrappingSubject()
		XCTAssertEqual(objectOLDWay, objectNewWay)
	}
	
	static var allTests = [
		("testFIArray", testFIArray),
	]
}
