////  w6d5_ui_performance_testingTests.swift
// Created: 2019-07-05
//


import XCTest
@testable import w6d5_ui_performance_testing


class w6d5_ui_performance_testingTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            PerformanceDataModel.doSomething()
        }
    }

}
