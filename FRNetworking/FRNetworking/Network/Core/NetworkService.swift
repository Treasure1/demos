//
//  NetworkService.swift
//  FRNetworking
//
//  Created by Fu Rao on 2018/4/17.
//  Copyright © 2018年 星翼. All rights reserved.
//

import Foundation

class NetworkService {
    private var task: URLSessionDataTask?
    private var successCodes: CountableRange<Int> = 200..<299
    private var failureCodes: CountableRange<Int> = 400..<499
    
    /// 网络请求方法
    enum Method: String {
        case get, post, put, delete
    }
    
    enum QueryType {
        case json, path
    }
    
    /// 请求方法
    func makeRequest(for url: URL, methond: Method, query type: QueryType,
                 params: [String: Any]? = nil,
                 headers: [String: String]? = nil,
                 success: ((Data?) -> Void)? = nil,
                 failure: ((_ data: Data?, _ error: NSError?, _ responseCode: Int) -> Void)? = nil ) {
        
        // 创建request
        var muttableRequest = makeQuery(for: url, params: params, type: type)
        // 设置headder
        muttableRequest.allHTTPHeaderFields = headers
        // 设置请求方法
        muttableRequest.httpMethod = methond.rawValue
        
        // 创建Session
        let session = URLSession.shared
        task = session.dataTask(with: muttableRequest as URLRequest, completionHandler: { (data, response, error) in

            guard let httpResponse = response as? HTTPURLResponse else {
                failure?(data, error as NSError?, 0)
                return
            }
            
            if let error = error {
                // 请求错误，也许是网络连接问题
                failure?(data, error as NSError, httpResponse.statusCode)
                return
            }
            
            if self.successCodes.contains(httpResponse.statusCode) {
                print("请求成功")
                success?(data)
            } else if self.failureCodes.contains(httpResponse.statusCode) {
                print("请求失败")
                failure?(data, error as NSError?, httpResponse.statusCode)
            } else {
                print("请求失败，是服务器的原因")
                let info = [
                    NSLocalizedDescriptionKey: "Request failed with code \(httpResponse.statusCode)",
                    NSLocalizedFailureReasonErrorKey: "Wrong handling logic, wrong endpoing mapping or backend bug."
                ]
                let error = NSError(domain: "NetworkService", code: 0, userInfo: info)
                failure?(data, error, httpResponse.statusCode)
            }
        })
        task?.response
    }
    
    func cancel() {
        task?.cancel()
    }
    
    
    //MARK: Private
    private func makeQuery(for url: URL, params: [String: Any]?, type: QueryType) -> URLRequest {
        switch type {
        // JSON 数据请求
        case .json:
            var mutableRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)
            if let params = params {
                mutableRequest.httpBody = try! JSONSerialization.data(withJSONObject: params, options: [])
            }
            return mutableRequest
            
        // PATH 请求
        case .path:
            var query = ""
            params?.forEach({ (key, value) in
                query = query + "\(key)=\(value)&"
            })
            
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
            components?.query = query
            return URLRequest(url: components!.url!, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)
        }
    }
}
