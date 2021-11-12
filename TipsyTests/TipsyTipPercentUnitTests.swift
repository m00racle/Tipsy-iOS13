//
//  TipsyTests.swift
//  TipsyTests
//
//  Created by Yanuar Heru on 11/11/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import XCTest
@testable import Tipsy

class TipPercentButtonTest: XCTestCase {
    
    var billV : BillViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        billV = storyboard.instantiateViewController(withIdentifier: "billView") as? BillViewController
        billV.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        billV = nil
    }

    func testPressingTwentyPercentChangesTipFactor() {
//        preps:
        let twentyPctButton : UIButton = billV.twentyPctButton
//        action:
        billV.tipChanged(twentyPctButton)
//        assert:
        XCTAssertEqual(billV.tipFactor, 0.2)
    }
    
    func testPressingZeroPercentChangesTipFactorToZero() {
//        arrange:
        let zeroPctButton : UIButton = billV.zeroPctButton
//        action:
        billV.tipChanged(zeroPctButton)
//        assert:
        XCTAssertEqual(billV.tipFactor, 0.0)
    }
    
    func testPressingTenPercentChangesTipFactor() {
//        arrange:
        let tenPctButton : UIButton = billV.tenPctButton
//        action:
        billV.tipChanged(tenPctButton)
//        assert:
        XCTAssertEqual(billV.tipFactor, 0.1)
    }

}
