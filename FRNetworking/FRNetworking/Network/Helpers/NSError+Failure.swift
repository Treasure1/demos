//
//  NSError+Failure.swift
//  FRNetworking
//
//  Created by Fu Rao on 2018/4/17.
//  Copyright © 2018年 星翼. All rights reserved.
//

import Foundation

extension NSError {
    class func cannotParseResponse() -> NSError {
        let info = [NSLocalizedDescriptionKey : "Can't parse response. Please report a bug."]
        return NSError(domain: String(describing: self), code: 0, userInfo: info)
    }
}
