//
//  Router.swift
//  BRURLRouter
//
//  Created by Archy on 2017/12/10.
//  Copyright © 2017年 Archy. All rights reserved.
//

import Foundation
import UIKit

public struct Router<T: EndpointType>: URLRepresentable {
    public let environment: T.Environment
    public let route: T.Route
    
    public init(_ environment: T.Environment = T.current, at route: T.Route) {
        self.environment = environment
        self.route = route
    }
    
    public var components: URLComponents {
        var components = environment.components
        let route = self.route.route
        
        components.path = environment.value.defaultPath.with(route.path).pathValue
        components.queryItems = route.query?.queryItems
        
        return components
    }
}

public protocol URLRepresentable {
    var components: URLComponents { get }
    var url: URL { get }
}

public extension URLRepresentable {
    public var url: URL {
        guard let url = components.url else {
            fatalError("URL components are not valid")
        }
        return url
    }
}

public protocol EndpointType {
    associatedtype Environment: EnvironmentType
    associatedtype Route: RouteType
    
    static var current: Environment { get }
}

public protocol RouteType {
    var route: URL.Route { get }
}

public protocol EnvironmentType: URLRepresentable {
    var value: URL.Env { get }
}

public extension EnvironmentType {
    public var components: URLComponents {
        var components = URLComponents()
        let environment = value
        
        components.scheme = environment.scheme.rawValue
        components.host = environment.host.hostString
    
        return components
    }
}
