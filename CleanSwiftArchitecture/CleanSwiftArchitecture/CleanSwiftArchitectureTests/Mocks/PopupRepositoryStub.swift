//
//  PopupRepositoryStub.swift
//  CleanSwiftArchitectureTests
//
//  Created by cw-james on 2022/04/15.
//

@testable import CleanSwiftArchitecture

//final class SessionManagerStub: SessionManagerProtocol {
//  var requestParameters: (url: URLConvertible, method: HTTPMethod, parameters: Parameters?)?
//
//  func request(_ url: URLConvertible, method: HTTPMethod, parameters: Parameters?, encoding: ParameterEncoding, headers: HTTPHeaders?) -> DataRequest {
//    self.requestParameters = (url, method, parameters)
//    return DataRequest(session: URLSession(), requestTask: .data(nil, nil))
//  }
//}

final class PopupRepositoryStub: PopupRepositoryProtocol {
    let service: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol) {
        self.service = service
    }
    
    func requestPopupList(completion: @escaping (Result<[PopupDTO], Error>) -> Void) {
        service.request(endPoint: "/popup/v1", headers: nil, params: ["placement": "login"], completion: completion)
    }
}
