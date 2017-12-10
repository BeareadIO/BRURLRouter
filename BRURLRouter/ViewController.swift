//
//  ViewController.swift
//  BRURLRouter
//
//  Created by Archy on 2017/12/10.
//  Copyright © 2017年 Archy. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let route = Router<Common>(at: .community)
        print(route.components.url!)
        let urlRoute = Router<UrlRoute>.init(at: .bookdetail(bid: "b1234546"))
        print(urlRoute.url.absoluteString)
    }
}


