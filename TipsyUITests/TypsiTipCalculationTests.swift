//
//  TypsiTipCalculationTests.swift
//  TipsyUITests
//
//  Created by Yanuar Heru on 16/11/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import XCTest

class TypsiTipCalculationTests: XCTestCase {

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

    func testCalculateTip() {
//        test the steps UI to calculate tips
        
        let app = XCUIApplication()
        
//        fill teh bill to the text field
        let billText = app.textFields["e.g. 123.56"]
        let billAmount = "125.50"
        billText.tap()
        billText.typeText(billAmount)
//        set the tip to 20%
        app/*@START_MENU_TOKEN@*/.staticTexts["20%"]/*[[".buttons[\"20%\"].staticTexts[\"20%\"]",".buttons[\"twentyPctButton\"].staticTexts[\"20%\"]",".staticTexts[\"20%\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        set the number of people to 5 people
        let incrementButton = app.steppers.buttons["Increment"]
        incrementButton.tap()
        incrementButton.tap()
        incrementButton.tap()
//        press the calculate button
        app/*@START_MENU_TOKEN@*/.staticTexts["Calculate"]/*[[".buttons[\"Calculate\"].staticTexts[\"Calculate\"]",".staticTexts[\"Calculate\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        assert
//        let resultText : String = app.staticTexts["56.32"].label
//        XCTAssertEqual(resultText, "30.12")
        XCTAssertTrue(app.staticTexts["30.12"].exists)
//        app.staticTexts["Split between 2 people, with 10% tip."].tap()
        XCTAssertTrue(app.staticTexts["Split between 5 people, with 20% tip."].exists)
        
    }
    
    func testEmptyBill_ShowWarningResult() {
//        if the bill text field is empty when user tap calculate the result view should put warning.
        let app = XCUIApplication()
//        set the tip to 20%
        app/*@START_MENU_TOKEN@*/.staticTexts["20%"]/*[[".buttons[\"20%\"].staticTexts[\"20%\"]",".buttons[\"twentyPctButton\"].staticTexts[\"20%\"]",".staticTexts[\"20%\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        set the number of people to 5 people
        let incrementButton = app.steppers.buttons["Increment"]
        incrementButton.tap()
        incrementButton.tap()
        incrementButton.tap()
//        press the calculate button
        app/*@START_MENU_TOKEN@*/.staticTexts["Calculate"]/*[[".buttons[\"Calculate\"].staticTexts[\"Calculate\"]",".staticTexts[\"Calculate\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        assert
//        let resultText : String = app.staticTexts["56.32"].label
//        XCTAssertEqual(resultText, "30.12")
        XCTAssertTrue(app.staticTexts["Looks like you have not input any bill amount"].exists)
//        app.staticTexts["Split between 2 people, with 10% tip."].tap()
        XCTAssertTrue(app.staticTexts["Split between 5 people, with 20% tip."].exists)
        
    }

}
