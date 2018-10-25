//
//  HalfTunesFakeTests.swift
//  HalfTunesFakeTests
//
//  Created by Fury on 2018/8/28.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

import XCTest
@testable import HalfTunes

class HalfTunesFakeTests: XCTestCase {
    
    var controllerUnderTest: SearchViewController!
    override func setUp() {
        super.setUp()
        controllerUnderTest = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! SearchViewController
        // 获取模拟数据
        let testBundle = Bundle(for: type(of: self))
        let path = testBundle.path(forResource: "abbaData", ofType: "json")
        let data = try? Data(contentsOf:URL(fileURLWithPath: path!),  options: .alwaysMapped)
        
        let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=abba")
        let urlResponse = HTTPURLResponse(url: url!, statusCode: 200, httpVersion: nil, headerFields: nil)
        let sessionMock = URLSessionMock(data: data, response: urlResponse, error: nil)
        controllerUnderTest.defaultSession = sessionMock
    }
    
    override func tearDown() {
        controllerUnderTest = nil
        super.tearDown()
    }
    
    // 用 DHURLSession 协议和模拟数据伪造 URLSession
    func test_UpdateSearchResults_ParsesData() {
        // given
        let promise = expectation(description: "Status code: 200")
        
        // when
        XCTAssertEqual(controllerUnderTest?.searchResults.count, 0, "searchResults should be empty before the data task runs")
        let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=abba")
        let dataTask = controllerUnderTest?.defaultSession.dataTask(with: url!) {
            data, response, error in
            // 如果 HTTP 请求成功，调用 updateSearchResults(_:) 方法，它会将数据解析成 Tracks 对象
            if let error = error {
                print(error.localizedDescription)
            } else if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    promise.fulfill()
                    self.controllerUnderTest?.updateSearchResults(data)
                }
            }
        }
        dataTask?.resume()
        waitForExpectations(timeout: 5, handler: nil)
        
        // then
        XCTAssertEqual(controllerUnderTest?.searchResults.count, 3, "Didn't parse 3 items from fake response")
    }
    
    // 性能测试
    func test_StartDownload_Performance() {
        let track = Track(name: "Waterloo", artist: "ABBA",
                          previewUrl: "http://a821.phobos.apple.com/us/r30/Music/d7/ba/ce/mzm.vsyjlsff.aac.p.m4a")
        measure {
            self.controllerUnderTest?.startDownload(track)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
