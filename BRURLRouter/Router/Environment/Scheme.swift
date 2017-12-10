//
//  Scheme.swift
//  BRURLRouter
//
//  Created by Archy on 2017/12/10.
//  Copyright © 2017年 Archy. All rights reserved.
//

import Foundation

public struct Scheme: RawRepresentable {
    public let rawValue: String
    
    public init(_ rawValue: String) {
        self.init(rawValue: rawValue)
    }
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public extension Scheme {
    public static let http = Scheme("http")
    public static let https = Scheme("https")
}

extension Scheme: Hashable {
    public var hashValue: Int {
        return rawValue.hashValue
    }
    
    public static func == (lhs: Scheme, rhs: Scheme) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}

