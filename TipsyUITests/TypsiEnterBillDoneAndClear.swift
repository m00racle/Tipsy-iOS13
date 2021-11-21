//
//  TypsiEnterBillDoneAndClear.swift
//  TipsyUITests
//
//  Created by Yanuar Heru on 21/11/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import XCTest

class TypsiEnterBillDoneAndClear: XCTestCase {

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
    
    func testClearButtonTextField() {
//        test clear button effect to clear the text field and make it status editing
        
        let app = XCUIApplication()
        let billAmount = "125.50"
        let testTarget = app.textFields["e.g. 123.56"]
        testTarget.tap()
        testTarget.typeText(billAmount)
        XCTAssertTrue(app.textFields["125.50"].exists)
//        clear the text field
        app/*@START_MENU_TOKEN@*/.staticTexts["clear"]/*[[".buttons[\"clear\"].staticTexts[\"clear\"]",".staticTexts[\"clear\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertEqual(testTarget.value as! String, "e.g. 123.56")
//        test keybard still exist due to first responder status
        XCTAssertTrue(app.keys.element(boundBy: 0).exists)
    }
    
    func testDoneButtonTextField() {
//        test done button for text field
        let app = XCUIApplication()
        let billAmount = "125.50"
        let testTarget = app.textFields["e.g. 123.56"]
        testTarget.tap()
        testTarget.typeText(billAmount)
//        push done
        app/*@START_MENU_TOKEN@*/.staticTexts["done"]/*[[".buttons[\"done\"].staticTexts[\"done\"]",".staticTexts[\"done\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        assert
        XCTAssertFalse(testTarget.hasFocus)
//        I need to assert the keyboard is hidden
        XCTAssertFalse(app.keys.element(boundBy: 0).exists)
    }

}
