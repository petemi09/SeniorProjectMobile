import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(tester2Tests.allTests),
    ]
}
#endif