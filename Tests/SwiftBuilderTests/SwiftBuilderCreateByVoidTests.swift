//
//  File.swift
//  
//
//  Created by 游宗諭 on 2020/9/3.
//

import XCTest
import SwiftBuilder
class SwiftBuilderCreateByVoidTests: XCTestCase {
    struct Target:CreateByVoid {
        var i = 0
    }
    func testBuildByVoid() {
        let target:Target = Builder()
        .build()
        XCTAssertEqual(target.i, 0)
    }
}

