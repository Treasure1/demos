//
//  BackendConfiguration.swift
//  FRNetworking
//
//  Created by Fu Rao on 2018/4/17.
//  Copyright © 2018年 星翼. All rights reserved.
//

import Foundation

/// 配置后台服务器地址，可以在网络层任何地方调用单利
/// let backendURL = NSURL(string: "https://szulctomasz.com")!
/// BackendConfiguration.shared = BackendConfiguration(baseURL: backendURL)
public final class BackendConfiguration {
    let baseURL: NSURL
    
    public init(baseURL: NSURL) {
        self.baseURL = baseURL
    }
    
    public static var shared: BackendConfiguration!
}
