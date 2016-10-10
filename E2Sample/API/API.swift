//
//  API.swift
//  E2Sample
//
//  Created by keygx on 2016/09/29.
//  Copyright © 2016年 keygx. All rights reserved.
//

import Foundation
import E2

public class API {
    
    public static func get() {
        print("---------- Get")
        
        let session = URLSession.shared
        let url = URL(string: "https://httpbin.org/get")
        let task = session.dataTask(with: url!) { (data, res, err) in
            if err != nil {
                
                // callback failure
                E2.callback(E2.Response(result: .failure, data: err as AnyObject?), name: EventName.API)
                                
            } else {
                if let data = data {
                    do {
                        let parsedData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String : Any]
                        
                        // callback success
                        E2.callback(E2.Response(result: .success, data: parsedData), name: EventName.API)
                        
                    } catch let error as NSError {
                        print(error)
                    }
                }
            }
        }
        task.resume()
    }
}

