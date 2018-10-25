//
//  ServiceOperation.swift
//  FRNetworking
//
//  Created by Fu Rao on 2018/4/17.
//  Copyright © 2018年 星翼. All rights reserved.
//

import Foundation

public class ServiceOperation: NetworkOperation {
    let service: BackendService
    
    public override init() {
        self.service = BackendService(BackendConfiguration.shared)
        super.init()
    }
    
    public override func cancel() {
        service.cancel()
        super.cancel()
    }
}
