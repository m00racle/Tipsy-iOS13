//
//  TipsyUITestsLaunchTests.swift
//  TipsyUITests
//
//  Created by Yanuar Heru on 02/11/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import XCTest

class TipsyUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
        
        let startNumDiv = XCUIApplication().staticTexts["2"]
        
//        asserts
//        XCTAssertEqual(true, app.buttons["tenPctButton"].isSelected)
        XCTAssertTrue(app.buttons["tenPctButton"].isSelected)
        XCTAssertTrue(startNumDiv.exists)
    }
}
