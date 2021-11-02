//
//  TipsyUITests.swift
//  TipsyUITests
//
//  Created by Yanuar Heru on 02/11/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import XCTest

class when_pct_tip_is_pressed: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    

    func test_should_deselect_other_pct_buttons() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
//        access the buttons
        let zeroPct = app.buttons["zeroPctButton"]
        let tenPct = app.buttons["tenPctButton"]
        let twentyPct = app.buttons["twentyPctButton"]

//        when click the other pct tip buttons should isSelected = false
        zeroPct.tap()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(false, tenPct.isSelected)
        XCTAssertEqual(false, twentyPct.isSelected)
    }

    
}
