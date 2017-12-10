//
//  Route.swift
//  BRURLRouter
//
//  Created by Archy on 2017/12/10.
//  Copyright © 2017年 Archy. All rights reserved.
//

import Foundation

public extension URL {
    public struct Route {
        public let path: Path
        public let query: Query?
        
        public init(path: Path, query: Query? = nil) {
            self.path = path
            self.query = query
        }
        
        public init(at path: RoutePathComponent...) {
            self.init(path: Path(path), query: nil)
        }
        
        public func query(_ query: (name: String, value: QueryItemValue?)...) -> Route {
            return Route(path: path, query: Query(query))
        }
    }
}

extension URL.Route: Equatable {
    public static func == (lhs: URL.Route, rhs: URL.Route) -> Bool {
        return lhs.path == rhs.path && lhs.query == rhs.query
    }
}

