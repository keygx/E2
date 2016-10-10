//
//  E2.Name.swift
//  E2
//
//  Created by keygx on 2016/09/29.
//  Copyright © 2016年 keygx. All rights reserved.
//

import Foundation

extension E2 {
    public struct Name {
        public var value: String {
            return name
        }
        
        private var name: String
        
        public init(_ name: String) {
            self.name = name
        }
    }
}
