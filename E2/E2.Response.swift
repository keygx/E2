//
//  E2.Response.swift
//  E2
//
//  Created by keygx on 2016/09/29.
//  Copyright © 2016年 keygx. All rights reserved.
//

import Foundation

extension E2 {
    public struct Response {
        public enum Result {
            case success
            case failure
        }
        
        public var result: Result
        public var data: Any?
        
        public init(result: Result, data: Any?) {
            self.result = result
            self.data = data
        }
    }
}
