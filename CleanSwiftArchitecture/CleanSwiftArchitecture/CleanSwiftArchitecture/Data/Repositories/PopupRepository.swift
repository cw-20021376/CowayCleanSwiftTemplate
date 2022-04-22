//
//  PopupRepository.swift
//  CleanSwiftArchitecture
//
//  Created by cw-james on 2022/04/01.
//

import Foundation

class PopupRepository: PopupRepositoryProtocol {
    func requestPopupList(completion: @escaping (Result<[PopupDTO], Error>) -> Void) {
        let service = NetworkService.shared
        service.request(endPoint: "/popup/v1",
                        headers: nil,
                        params: ["placement": "login"],
                        completion: completion)
    }
}
