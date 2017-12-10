//
//  CommonRouter.swift
//  BRURLRouter
//
//  Created by Archy on 2017/12/10.
//  Copyright © 2017年 Archy. All rights reserved.
//

import Foundation

struct Common: EndpointType {
    enum Environment: EnvironmentType {
        case bearead
        case beareadV2
        
        var value: URL.Env {
            switch self {
            case .bearead: return .init(.https, "www.bearead.com")
            case .beareadV2: return .init(.https, "v2.bearead.com")
            }
        }
    }
    
    enum Route: RouteType {
        case community
        case book(id: String)
        case booklist(id: String)
        case review(id: String)
        case activity(id: String)
        
        var route: URL.Route {
            switch self {
            case .community: return URL.Route(at: "mobile", "communityrules.html")
            case let .book(id: bid): return URL.Route(at: "share.html").query(("bid",bid))
            case let .booklist(id: blid): return URL.Route(at: "booklist", "detail").query(("blid",blid))
            case let .review(id: rwid): return URL.Route(at: "list", "review.html").query(("rwid",rwid))
            case let .activity(id: atid): return URL.Route(at: "list","activityDetail.html").query(("atid",atid))
            }
        }
    }
    
    static let current: Environment = .beareadV2
}
