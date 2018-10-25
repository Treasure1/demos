//
//  BullsEyeUITests.swift
//  BullsEyeUITests
//
//  Created by Fury on 2018/8/28.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

import XCTest

class BullsEyeUITests: XCTestCase {
    var app: XCUIApplication!
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        app = nil
        super.tearDown()
    }
    
    func testGameStyleSwitch() {
        // given
        let slideButton = app/*@START_MENU_TOKEN@*/.segmentedControls.buttons["Slide"]/*[[".segmentedControls.buttons[\"Slide\"]",".buttons[\"Slide\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
        let typeButton = app.segmentedControls.buttons["Type"]
        let slideLabel = app.staticTexts["Get as close as you can to: "]
        let typeLabel = app.staticTexts["Guess where the slider is: "]
        // then
        if slideButton.isSelected {
            XCTAssertTrue(slideLabel.exists)
            XCTAssertFalse(typeLabel.exists)
            
            typeButton.tap()
            
            XCTAssertTrue(typeButton.exists)
            XCTAssertFalse(slideLabel.exists)
        }else {
            XCTAssertTrue(typeButton.exists)
            XCTAssertFalse(slideLabel.exists)
            
            slideButton.tap()
            
            XCTAssertTrue(slideLabel.exists)
            XCTAssertFalse(typeLabel.exists)
        }
    }
    
}
