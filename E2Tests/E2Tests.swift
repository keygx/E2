//
//  E2Tests.swift
//  E2Tests
//
//  Created by keygx on 2016/09/29.
//  Copyright © 2016年 keygx. All rights reserved.
//

import XCTest
@testable import E2

class E2Tests: XCTestCase {
    
    let eventName = E2.Name("test")
    
    override func setUp() {
        super.setUp()
        
        let e2Expectation = expectation(description: "e2Expectation")
        
        E2.add(queue: .main, name: eventName) { (response: E2.Response) in
            print(response.data)
            
            XCTAssertEqual(response.data as! String , "TEST")
            e2Expectation.fulfill()
        }
    }
    
    override func tearDown() {
        super.tearDown()
        
        E2.removeAllEvents()
    }
    
    func testE2() {
        
        E2.callback(E2.Response(result: .success, data: "TEST"), name: eventName)
        
        waitForExpectations(timeout: 1, handler: nil)
    }
}
