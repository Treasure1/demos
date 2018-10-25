//
//  SignInResponseMapper.swift
//  FRNetworking
//
//  Created by Fu Rao on 2018/4/17.
//  Copyright © 2018年 星翼. All rights reserved.
//

import Foundation

final class SignInResponseMapper: ResponseMapper<SignInItem>, ResponseMapperProtocol {
    
    static func process(_ obj: AnyObject?) throws -> SignInItem {
        return try process(obj, parse: { json in
            let token = json["token"] as? String
            let uniqueId = json["unique_id"] as? String
            if let token = token, let uniqueId = uniqueId {
                return SignInItem(token: token, uniqueId: uniqueId)
            }
            return nil
        })
    }
}
