import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(fluentinterfaceDataTests.allTests),
		testCase(fluentinterfaceObjectTests.allTests),
		  
    ]
}
#endif
