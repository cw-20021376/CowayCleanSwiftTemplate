//
//  PopupRepositoryProtocol.swift
//  CleanSwiftArchitecture
//
//  Created by cw-james on 2022/04/01.
//

protocol PopupRepositoryProtocol {
    func requestPopupList(completion: @escaping (Result<[PopupDTO], Error>) -> Void)
}
