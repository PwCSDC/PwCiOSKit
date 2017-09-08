//
//  NSDictionary.swift
//  REX
//
//  Created by Aaron Hu on 8/20/15.
//  Copyright (c) 2015 PwC Inc. All rights reserved.
//

extension NSDictionary {
    
    open func toJSONString() -> NSString{
        
        let jsonData: Data! = try? JSONSerialization.data(withJSONObject: self, options: [])
        
        let retString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)
        
        return retString!
    }
    
}
