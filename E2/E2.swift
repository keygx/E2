//
//  E2.swift
//  E2
//
//  Created by keygx on 2016/09/29.
//  Copyright © 2016年 keygx. All rights reserved.
//

import Foundation

public class E2 {
    
    private static let shared = E2()
    
    private static let serialQueue = DispatchQueue(label: "com.keygraphix.ios.E2")
    
    private struct EventInfo {
        let queue: E2.Queue
        let handler: (E2.Response) -> Void
    }
    
    private var events = [String : EventInfo]()
}

extension E2 {
    
    public static func add(queue: E2.Queue, name: E2.Name, handler: @escaping (E2.Response) -> Void) {
        E2.shared.register(thread: .main, name: name.value, handler: handler)
    }
    
    private func register(thread: E2.Queue, name: String, handler: @escaping (E2.Response) -> Void) {
        if events[name] != nil {
            assertionFailure("E2.Name \"\(name)\" is already used.")
        }
        events[name] = EventInfo(queue: thread, handler: handler)
    }
}

extension E2 {
    
    public static func removeAllEvents() {
        E2.shared.events.removeAll()
    }
    
    public static func removeEvent(name: E2.Name) {
        E2.shared.events.removeValue(forKey: name.value)
    }
}

extension E2 {
    
    public static func callback(_ response: E2.Response, name: E2.Name) {
        E2.serialQueue.sync {
            E2.shared.emit(response, name.value)
        }
    }
    
    private func emit(_ response: E2.Response, _ name: String) {
        
        defer {
            E2.removeEvent(name: E2.Name(name))
        }
        
        events.forEach { event in
            if event.key != name {
                return
            }
            
            guard let event = events[name] else {
                return
            }
            
            if event.queue == .main {
                if Thread.isMainThread {
                    event.handler(response)
                } else {
                    DispatchQueue.main.sync {
                        event.handler(response)
                    }
                }
            } else {
                DispatchQueue.global().sync {
                    event.handler(response)
                }
            }
        }
    }
}
