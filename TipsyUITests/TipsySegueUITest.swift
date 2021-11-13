//
//  TipsySegueUITest.swift
//  TipsyUITests
//
//  Created by Yanuar Heru on 13/11/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import XCTest

class TipsySegueUITest: XCTestCase {
    var app : XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSeguesLoadResultTextLabel() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        arrange
        let calculateButton = app.buttons["Calculate"]
        let recalculateButton = app.buttons["Recalculate"]
        
//        action segue to result view
        calculateButton.tap()
//        assert recalculateButton exist
        XCTAssertTrue(recalculateButton.exists)
//        action to back
        recalculateButton.tap()
        XCTAssertTrue(calculateButton.exists)
        
                
    }

}
