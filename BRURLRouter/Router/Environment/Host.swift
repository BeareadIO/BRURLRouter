//
//  Host.swift
//  BRURLRouter
//
//  Created by Archy on 2017/12/10.
//  Copyright © 2017年 Archy. All rights reserved.
//

import Foundation

public protocol HostType {
    var hostString: String { get }
}

extension String: HostType {
    public var hostString: String {
        return self
    }
}
