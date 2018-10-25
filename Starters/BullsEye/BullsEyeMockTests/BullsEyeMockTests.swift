//
//  BullsEyeMockTests.swift
//  BullsEyeMockTests
//
//  Created by Fury on 2018/8/28.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

import XCTest
@testable import BullsEye

class MockUserDefaults: UserDefaults {
    var gameStyleChanged = 0
    override func set(_ value: Int, forKey defaultName: String) {
        if  defaultName == "gameStyle" {
            gameStyleChanged += 1
        }
    }
}

class BullsEyeMockTests: XCTestCase {
    
    var controllerUnderTest: ViewController!
    var mockUserDefaults: MockUserDefaults!
    
    override func setUp() {
        super.setUp()
        controllerUnderTest = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! ViewController?
        mockUserDefaults = MockUserDefaults(suiteName: "testing")!
        controllerUnderTest.defaults = mockUserDefaults
    }
    
    override func tearDown() {
        controllerUnderTest = nil
        mockUserDefaults = nil
        super.tearDown()
    }
    
    // 模拟和 UserDefaults 的交互
    func testGameStyleCanBeChanged() {
        // given
        let segmentedControl = UISegmentedControl()
        
        // when
        XCTAssertEqual(mockUserDefaults.gameStyleChanged, 0, "gameStyleChanged should be 0 before sendActions")
        segmentedControl.addTarget(controllerUnderTest,
                                   action: #selector(ViewController.chooseGameStyle(_:)), for: .valueChanged)
        segmentedControl.sendActions(for: .valueChanged)
        
        // then
        XCTAssertEqual(mockUserDefaults.gameStyleChanged, 1, "gameStyle user default wasn't changed")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
