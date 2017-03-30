//
//  ViewController.swift
//  E2Sample
//
//  Created by keygx on 2016/09/29.
//  Copyright © 2016年 keygx. All rights reserved.
//

import UIKit
import E2

class ViewController: UIViewController {
    
    // event handler
    let apiHandler = { (response: E2.Response) in
        switch(response.result) {
        case .success:
            print("success:\n \(response.data as Any)")
        case .failure:
            print("error:\n \(response.data as Any)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnSendAction(_ sender: UIButton) {
        // add event
        E2.add(queue: .main, name: EventName.API, handler: apiHandler)
        
        API.get()
    }
}
