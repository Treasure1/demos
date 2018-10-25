//
//  SignUpRequest.swift
//  FRNetworking
//
//  Created by Fu Rao on 2018/4/17.
//  Copyright © 2018年 星翼. All rights reserved.
//

import Foundation

/// 注册网络请求
final class SignUpRequest: BackendAPIRequest {
    private let firstName: String
    private let lastName: String
    private let password: String
    private let email: String
    
    init(firstName: String, lastName: String, password: String, email: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.password = password
        self.email = email
    }
    
    var endpoint: String {
        return "/user"
    }
    
    var method: NetworkService.Method {
        return .post
    }
    
    var query: NetworkService.QueryType {
        return .json
    }
    
    var parameters: [String : Any]? {
        return [
            "first_name" : firstName,
            "last_name" : lastName,
            "password" : password,
            "email" : email
        ]
    }
    
    var headers: [String : String]? {
        return defaultJSONHeaders()
    }
}
