//
//  ChatKitTests.swift
//  ChatKitTests
//
//  Created by Apple on 13/11/21.
//

import XCTest
import UIKit

@testable import ChatKit

class ChatKitTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    public required init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()

    private func commonInit() {
        validSize = frame.size
}
