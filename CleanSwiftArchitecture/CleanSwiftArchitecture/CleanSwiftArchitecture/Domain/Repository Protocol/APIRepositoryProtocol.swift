//
//  APIRepositoryProtocol.swift
//  CleanSwiftArchitecture
//
//  Created by cw-james on 2022/04/01.
//

protocol APIRepositoryProtocol {
    func request(completion: @escaping (Result<[UserDTO], Error>) -> Void)
}
