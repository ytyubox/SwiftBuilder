//
//  CustomOperatorTests.swift
//  
//
//  Created by 游宗諭 on 2020/2/18.
//

import XCTest
import FluentInterface



postfix operator >|
public postfix func >| <T>(lhs: T) -> FluentInterface<T> {
  return lhs+
}

postfix operator |>

public postfix func |> <T>(lhs: FluentInterface<T>) -> T {
  return lhs-
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
