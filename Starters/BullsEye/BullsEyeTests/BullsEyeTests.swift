//
//  BullsEyeTests.swift
//  BullsEyeTests
//
//  Created by Fury on 2018/8/28.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

import XCTest
@testable import BullsEye

class BullsEyeTests: XCTestCase {
    
    var gameUnderTest: BullsEyeGame!
    
    override func setUp() {
        super.setUp()
        gameUnderTest = BullsEyeGame()
        gameUnderTest.startNewGame()
    }
    
    override func tearDown() {
        gameUnderTest = nil
        super.tearDown()
    }
    
    func testScoreIsComputedWhenGuessGTTarget() {
        //. given
        let guess = gameUnderTest.targetValue + 5
        
        //. when
        _ = gameUnderTest.check(guess: guess)
        
        //. then
        XCTAssertEqual(gameUnderTest.scoreRound, 95, "Score computed from guess is wrong")
    }
    
    func testScoreIsComputedWhenGuessLTTarget() {
        //. given
        let guess = gameUnderTest.targetValue - 5
        
        //. when
        _ = gameUnderTest.check(guess: guess)
        
        //. then
        XCTAssertEqual(gameUnderTest.scoreRound, 95, "Score computed from guess is wrong")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
