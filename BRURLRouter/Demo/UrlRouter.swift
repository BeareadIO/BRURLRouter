//
//  UrlRouter.swift
//  BRURLRouter
//
//  Created by Archy on 2017/12/10.
//  Copyright © 2017年 Archy. All rights reserved.
//

import Foundation

extension Scheme {
    static let baidu = Scheme("baidu")
}

struct UrlRoute: EndpointType {
    enum Environment: EnvironmentType {
        case bearead
        
        var value: URL.Env {
            switch self {
            case .bearead: return .init( .baidu, "www.bearead.com")
            }
        }
    }
    
    enum Route: RouteType {
        case bookdetail(bid: String)
        case web(url: String)
        case review(rwid: String)
        
        var route: URL.Route {
            switch self {
            case let .bookdetail(bid: bid): return URL.Route(at: "bookdetail").query(("bid",bid))
            case let .web(url: url): return URL.Route(at: "web").query(("url",url))
            case let .review(rwid: rwid): return URL.Route(at: "review").query(("rwid",rwid))
            }
        }
    }
    
    static var current: Environment = .bearead
}
