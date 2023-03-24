//
//  NetworkConfigurable.swift
//  WorldOfPAYBACK
//
//  Created by Marwen Jamel on 17.03.23.
//

import Foundation

public protocol NetworkConfigurable {
    var baseURL: String { get }
}

public struct ApiDataNetworkConfig: NetworkConfigurable {
    public var baseURL: String
     public init(baseURL: String) {
        self.baseURL = baseURL
    }
}
