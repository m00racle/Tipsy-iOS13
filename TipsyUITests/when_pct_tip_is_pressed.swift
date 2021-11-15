//
//  TipsyUITests.swift
//  TipsyUITests
//
//  Created by Yanuar Heru on 02/11/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import XCTest

class when_pct_tip_is_pressed: XCTestCase {
    var app: XCUIApplication!
    var zeroPct : XCUIElement!
    var tenPct : XCUIElement!
    var twentyPct : XCUIElement!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // UI tests must launch the application that they test.
        app = XCUIApplication()
        app.launch()
//        access the buttons
        zeroPct = app.buttons["zeroPctButton"]
        tenPct = app.buttons["tenPctButton"]
        twentyPct = app.buttons["twentyPctButton"]

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    

    func test_should_deselect_other_pct_buttons() throws {

//        when click the other pct tip buttons should isSelected = false
        zeroPct.tap()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(true, zeroPct.isSelected)
        XCTAssertEqual(false, tenPct.isSelected)
        XCTAssertEqual(false, twentyPct.isSelected)
        //        when click the other pct tip buttons should isSelected = false
        twentyPct.tap()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(false, zeroPct.isSelected)
        XCTAssertEqual(false, tenPct.isSelected)
        XCTAssertEqual(true, twentyPct.isSelected)
    }
    
    

    
}
