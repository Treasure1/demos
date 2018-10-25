//
//  BackendAPIRequest.swift
//  FRNetworking
//
//  Created by Fu Rao on 2018/4/17.
//  Copyright © 2018年 星翼. All rights reserved.
//

import Foundation

protocol BackendAPIRequest {
    /// 地址
    var endpoint: String { get }
    /// 请求方法
    var method: NetworkService.Method { get }
    ///
    var query: NetworkService.QueryType { get }
    /// 请求参数
    var parameters: [String: Any]? { get }
    /// 请求头
    var headers: [String : String]? { get }
}

extension BackendAPIRequest {
    func defaultJSONHeaders() -> [String : String] {
        return ["Content-Type": "application/json"]
    }
}
