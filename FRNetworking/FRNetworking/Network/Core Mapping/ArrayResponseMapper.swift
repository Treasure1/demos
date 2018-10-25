//
//  ArrayResponseMapper.swift
//  FRNetworking
//
//  Created by Fu Rao on 2018/4/17.
//  Copyright © 2018年 星翼. All rights reserved.
//

import Foundation

class ArrayResponseMapper<A: ParsedItem> {
    static func process(_ obj: AnyObject?, mapper: ((Any?) throws -> A)) throws -> [A] {
        guard let json = obj as? [[String: AnyObject]] else { throw ResponseMapperError.invalid
        }
        
        var items = [A]()
        for jsonNode in json {
            let item = try mapper(jsonNode)
            items.append(item)
        }
        return items
    }
}
