//
//  Environment.swift
//  BRURLRouter
//
//  Created by Archy on 2017/12/10.
//  Copyright © 2017年 Archy. All rights reserved.
//

import Foundation

public extension URL {
    public struct Env {
        public let scheme: Scheme
        public let host: HostType
        public var defaultPath: Path = []

        public init(_ scheme: Scheme, _ host: HostType) {
            self.scheme = scheme
            self.host = host
        }
        
        public init(_ host: HostType) {
            self.init(.https, host)
        }
        
        public func at(_ defaultPath: RoutePathComponent...) -> Env {
            var env = self
            env.defaultPath = Path(defaultPath)
            return env
        }
    }
}

extension URL.Env: Equatable {
    public static func == (lhs: URL.Env, rhs: URL.Env) -> Bool {
        return lhs.scheme == rhs.scheme
            && lhs.host.hostString == rhs.host.hostString
    }
}

extension URL.Env: EnvironmentType {
    public var value: URL.Env {
        return self
    }
}
