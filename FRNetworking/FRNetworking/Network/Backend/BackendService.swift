//
//  BackendService.swift
//  FRNetworking
//
//  Created by Fu Rao on 2018/4/17.
//  Copyright © 2018年 星翼. All rights reserved.
//

import Foundation

public let DidPerformUnauthorizedOperation = "DidPerformUnauthorizedOperation"

class BackendService {
    private let conf: BackendConfiguration
    private let service: NetworkService
    
    init(_ conf: BackendConfiguration) {
        self.conf = conf
        self.service = NetworkService()
    }
    
    /// 发起请求
    func request(request: BackendAPIRequest,
                 success: ((AnyObject?) -> Void)? = nil,
                 failure: ((NSError) -> Void)? = nil) {
        // 组装地址
        let url = conf.baseURL.appendingPathComponent(request.endpoint)
        // Set authentication token if available.
        //        headers?["X-Api-Auth-Token"] = BackendAuth.shared.token
        service.makeRequest(for: url!, methond: request.method, query: request.query, params: request.parameters, headers: request.headers, success: { (data) in
            var json: AnyObject? = nil
            if let data = data {
                json = try? JSONSerialization.jsonObject(with: data, options: []) as AnyObject
            }
            success?(json)
            
        }) { (data, error, statusCode) in
            if statusCode == 401 {
                // Operation not authorized
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: DidPerformUnauthorizedOperation), object: nil)
                return
            }
            
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as AnyObject
                let info = [
                    NSLocalizedDescriptionKey: json?["error"] as? String ?? "",
                    NSLocalizedFailureReasonErrorKey: "Probably not allowed action."
                ]
                let error = NSError(domain: "BackendService", code: 0, userInfo: info)
                failure?(error)
            } else {
                failure?(error ?? NSError(domain: "BackendService", code: 0, userInfo: nil))
            }
        }
    }
    
    // 取消请求
    func cancel() {
        service.cancel()
    }
}
