//
//  APIRepository.swift
//  CleanSwiftArchitecture
//
//  Created by cw-james on 2022/04/01.
//

import Foundation

class APIRepository: APIRepositoryProtocol {
    func request(completion: @escaping (Result<[UserDTO], Error>) -> Void) {
        let config = NetworkConfig(baseURL: "")
        let network = DefaultNetworkService(config: config)

        network.request(endPoint: "", headers: nil, params: nil, completion: completion)
    }
}
