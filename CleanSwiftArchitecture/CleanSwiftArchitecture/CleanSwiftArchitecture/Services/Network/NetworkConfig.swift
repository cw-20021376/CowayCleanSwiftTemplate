//
//  NetworkConfig.swift
//  Pods
//
//  Created by cw-james on 2022/02/21.
//

import Foundation

internal protocol NetworkConfigProtocol {
    var baseURL: String { get }
    var headers: [String: String] { get }
}

internal struct NetworkConfig: NetworkConfigProtocol {
    let baseURL: String
    let headers: [String: String]
    
    init(baseURL: String, headers: [String: String] = [:]) {
        self.baseURL = baseURL
        self.headers = headers
    }
}
