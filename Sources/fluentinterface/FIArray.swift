//
//  FIArray.swift
//  
//
//  Created by 游宗諭 on 2020/3/12.
//

postfix operator ++

public postfix func ++ <T>(lhs: [T]) -> FIArray<T> {
	return FIArray(subjectList: lhs)
}

import Foundation

@dynamicMemberLookup public struct FIArray<Subject> {
	let subjectList: [Subject]
	public typealias FISetter<Value> = ((Value) -> FIArray<Subject>)
	
	public subscript<Value>(dynamicMember keyPath:WritableKeyPath<Subject,Value>) -> FISetter<Value> {
		var subjectList = self.subjectList
		
		return { value in
			for index in subjectList.indices {
				subjectList[index][keyPath: keyPath] = value
			}
			return FIArray(subjectList: subjectList)
		}
	}
	public func unwrappingSubject() -> [Subject] {
		subjectList
	}
}

