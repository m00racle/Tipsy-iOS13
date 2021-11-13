//
//  StepperUITest.swift
//  TipsyUITests
//
//  Created by Yanuar Heru on 13/11/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import XCTest

class StepperUITest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStepperChanges() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        arrange:
        let app = XCUIApplication()
        let steppersQuery = app.steppers
        let decrementButton = steppersQuery.buttons["Decrement"]
        let incrementButton = steppersQuery.buttons["Increment"]
//        test minimum decrement button never get smaller than its minimum
        decrementButton.tap()
        decrementButton.tap()
        XCTAssertFalse(decrementButton.isEnabled)
        XCTAssertTrue(incrementButton.isEnabled)
        XCTAssertTrue(app.staticTexts["2"].exists)
        
//        test stepper reach max value it should not surpass its max value
//        test stepper reach max value the increment button becomes non enabled
        for _ in 2...26 {
            incrementButton.tap()
        }
        XCTAssertFalse(incrementButton.isEnabled)
        XCTAssertTrue(decrementButton.isEnabled)
        XCTAssertTrue(app.staticTexts["25"].exists)
        
//        test click 12 times will result label 12
        for _ in 1...12 {
            decrementButton.tap()
        }
        decrementButton.tap()
        XCTAssertTrue(incrementButton.isEnabled)
        XCTAssertTrue(decrementButton.isEnabled)
        XCTAssertTrue(app.staticTexts["12"].exists)
    }

}
