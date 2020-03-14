//
//  PerformanceTests.swift
//  
//
//  Created by 游宗諭 on 2020/3/14.
//

import XCTest
import FluentInterface

final class PerformanceTests: XCTestCase {
	struct TargetData:Equatable {
		var value01 = 0
		var value02 = 0
		var value03 = 0
		var value04 = 0
		var value05 = 0
		var value06 = 0
		var value07 = 0
		var value08 = 0
		var value09 = 0
		var value10 = 0
		var value11 = 0
		var value12 = 0
		var value13 = 0
		var value14 = 0
		var value15 = 0
		var value16 = 0
		var value17 = 0
		var value18 = 0
		var value19 = 0
		var value20 = 0
		var value21 = 0
		var value22 = 0
		var value23 = 0
		var value24 = 0
		var value25 = 0
		var value26 = 0
		var value27 = 0
		var value28 = 0
		var value29 = 0
		var value30 = 0
		var value31 = 0
		var value32 = 0
		var value33 = 0
		var value34 = 0
		var value35 = 0
		var value36 = 0
		var value37 = 0
		var value38 = 0
		var value39 = 0
		var value40 = 0
		var value41 = 0
		var value42 = 0
		var value43 = 0
		var value44 = 0
		var value45 = 0
		var value46 = 0
		var value47 = 0
		var value48 = 0
		var value49 = 0
		var value50 = 0
		var value51 = 0
		var value52 = 0
		var value53 = 0
		var value54 = 0
		var value55 = 0
		var value56 = 0
		var value57 = 0
		var value58 = 0
		var value59 = 0
		var value60 = 0
		
		
	}
	let value = 2
	let range = 0...1_000_000
	func testPerformanceForAnonymousFunction() {
		self.measure {
			for _ in range {
			let _:TargetData = {
				// run your work
				var object = TargetData()
				object.value01 = value
				object.value02 = value
				object.value03 = value
				object.value04 = value
				object.value05 = value
				object.value06 = value
				object.value07 = value
				object.value08 = value
				object.value09 = value
				object.value10 = value
				object.value11 = value
				object.value12 = value
				object.value13 = value
				object.value14 = value
				object.value15 = value
				object.value16 = value
				object.value17 = value
				object.value18 = value
				object.value19 = value
				object.value20 = value
				object.value21 = value
				object.value22 = value
				object.value23 = value
				object.value24 = value
				object.value25 = value
				object.value26 = value
				object.value27 = value
				object.value28 = value
				object.value29 = value
				object.value30 = value
				object.value31 = value
				object.value32 = value
				object.value33 = value
				object.value34 = value
				object.value35 = value
				object.value36 = value
				object.value37 = value
				object.value38 = value
				object.value39 = value
				object.value40 = value
				object.value41 = value
				object.value42 = value
				object.value43 = value
				object.value44 = value
				object.value45 = value
				object.value46 = value
				object.value47 = value
				object.value48 = value
				object.value49 = value
				object.value50 = value
				object.value51 = value
				object.value52 = value
				object.value53 = value
				object.value54 = value
				object.value55 = value
				object.value56 = value
				object.value57 = value
				object.value58 = value
				object.value59 = value
				object.value60 = value
				return object
			}()
			}
		}
	}
	
	func testPerformanceForFluentInterface() {
		self.measure {
			for _ in range {
				let target = TargetData()+
					.value01(value)
					.value02(value)
					.value03(value)
					.value04(value)
					.value05(value)
					.value06(value)
					.value07(value)
					.value08(value)
					.value09(value)
					.value10(value)
					.value11(value)
					.value12(value)
					.value13(value)
					.value14(value)
					.value15(value)
					.value16(value)
					.value17(value)
					.value18(value)
					.value19(value)
					.value20(value)
					.value21(value)
					.value22(value)
					.value23(value)
					.value24(value)
					.value25(value)
					.value26(value)
					.value27(value)
					.value28(value)
					.value29(value)
					.value30(value)
					.value31(value)
					.value32(value)
					.value33(value)
					.value34(value)
					.value35(value)
					.value36(value)
					.value37(value)
					.value38(value)
					.value39(value)
					.value40(value)
					.value41(value)
					.value42(value)
					.value43(value)
					.value44(value)
					.value45(value)
					.value46(value)
					.value47(value)
					.value48(value)
					.value49(value)
					.value50(value)
					.value51(value)
					.value52(value)
					.value53(value)
					.value54(value)
					.value55(value)
					.value56(value)
					.value57(value)
					.value58(value)
					.value59(value)
					.value60(value)
					.unwrappingSubject()
			}
		}
	}
	func testPerformanceForFluentInterfaceWithoutOperator() {
		self.measure {
			for _ in 0..<1_0000 {
				let target = FluentInterface(subject: TargetData())
					.value01(value)
					.value02(value)
					.value03(value)
					.value04(value)
					.value05(value)
					.value06(value)
					.value07(value)
					.value08(value)
					.value09(value)
					.value10(value)
					.value11(value)
					.value12(value)
					.value13(value)
					.value14(value)
					.value15(value)
					.value16(value)
					.value17(value)
					.value18(value)
					.value19(value)
					.value20(value)
					.value21(value)
					.value22(value)
					.value23(value)
					.value24(value)
					.value25(value)
					.value26(value)
					.value27(value)
					.value28(value)
					.value29(value)
					.value30(value)
					.value31(value)
					.value32(value)
					.value33(value)
					.value34(value)
					.value35(value)
					.value36(value)
					.value37(value)
					.value38(value)
					.value39(value)
					.value40(value)
					.value41(value)
					.value42(value)
					.value43(value)
					.value44(value)
					.value45(value)
					.value46(value)
					.value47(value)
					.value48(value)
					.value49(value)
					.value50(value)
					.value51(value)
					.value52(value)
					.value53(value)
					.value54(value)
					.value55(value)
					.value56(value)
					.value57(value)
					.value58(value)
					.value59(value)
					.value60(value)
					.unwrappingSubject()
			}
		}
	}
}
