//
//  HalfTunesTests.swift
//  HalfTunesTests
//
//  Created by Fury on 2018/8/28.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

import XCTest
@testable import HalfTunes

class HalfTunesTests: XCTestCase {
    
    var sessionUnderTest: URLSession!
    override func setUp() {
        super.setUp()
        sessionUnderTest = URLSession(configuration: .default)
    }
    
    override func tearDown() {
        sessionUnderTest = nil
        super.tearDown()
    }
    
    func testValidCallToiTunesGetsHTTPStatusCode200() {
        //1. given
        let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=abba")
        // 1
        let promise = expectation(description: "Status code: 200")
        
        //2. when
        let dataTask = sessionUnderTest.dataTask(with: url!) { (data, response, error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            }else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    // 2
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        // 3
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testCallToiTunesCompletes() {
        // given
        let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=abba")
        // 1.
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        let dataTask = sessionUnderTest.dataTask(with: url!) { (data, response, error) in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            // 2
            promise.fulfill()
        }
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNil(responseError, "http error")
        XCTAssertEqual(statusCode, 200)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
