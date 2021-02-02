import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SOPDFReaderTests.allTests),
    ]
}
#endif
