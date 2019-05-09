import XCTest

import tester2Tests

var tests = [XCTestCaseEntry]()
tests += tester2Tests.allTests()
XCTMain(tests)