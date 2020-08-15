//
//  File.swift
//  
//
//  Created by 游宗諭 on 2020/8/15.
//

import Foundation

public protocol CreateByVoid {
    init()
}
extension Builder: CreateByVoid where Subject: CreateByVoid{
    public init() {
        subject = .init()
    }
}

extension NSObject: CreateByVoid {}
extension String:   CreateByVoid {}
extension Int:      CreateByVoid {}
