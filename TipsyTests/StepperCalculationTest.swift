//
//  StepperCalculationTest.swift
//  TipsyTests
//
//  Created by Yanuar Heru on 13/11/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import XCTest
@testable import Tipsy

class StepperCalculationTest: XCTestCase {
    var billView : BillViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        billView = storyboard.instantiateViewController(withIdentifier: "billView") as? BillViewController
        billView.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        billView = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        action call to the stepper changes function up to 12. then the numberOfPeople = 12.0
        let stepperButtons:UIStepper = billView.stepperButtons
        for _ in 3...12 {
            billView.stepperValueChanged(stepperButtons)
        }
//        assert
        XCTAssertEqual(billView.numberOfPeople, 12.0)
    }

}
