//
//  DefaultNetworkService.swift
//  Pods
//
//  Created by cw-james on 2022/02/21.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol {
    func request<T: Decodable>(endPoint: String, headers: [String:String]?, params: [String: Any]?, completion: @escaping (Result<[T], Error>) -> Void)
}

internal class DefaultNetworkService: NetworkServiceProtocol {
    
    private let config: NetworkConfigProtocol
    
    init(config: NetworkConfigProtocol) {
        self.config = config
    }
    
    func request<T>(endPoint: String, headers: [String:String]? = nil, params: [String : Any]? = nil, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        
        let baseURL = config.baseURL + endPoint
        var httpHeaders = HTTPHeaders(config.headers)
        headers?.forEach { httpHeaders.add(HTTPHeader(name: $0, value: $1)) }
        
        let request = APISession.session.request(baseURL, method: .get, parameters: params, encoding: URLEncoding.default, headers: httpHeaders)
        
        request.responseDecodable(of: T.self) { (response) in
            print(response.result)
            switch response.result {
            case .success(let objects):
                completion(.success(objects))

            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
}
