//
//  NetworkService.swift
//  Pods
//
//  Created by cw-james on 2022/02/21.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol {
    func request<T: Decodable>(endPoint: String, headers: [String:String]?, params: [String : Any]?, completion: @escaping (Result<T, Error>) -> Void)
}

internal class NetworkService: NetworkServiceProtocol {
    
    public static let shared = NetworkService()
    
    private var baseURL: String
    private var baseHeaders: [String: String]
    
    private init() {
        #if DEBUG
        self.baseURL = "https://api-gw.coway.dev/cw-sdk"
        #else
        self.baseURL = "https://api-gw.coway.com/cw-sdk"
        #endif
        
        guard let path = Bundle.main.path(forResource: "CowaySDK-info", ofType: "plist") else {
            fatalError("CowaySDK-info.plist can't find")
        }
        
        guard let key = NSDictionary(contentsOfFile: path)?["X_API_Key"] as? String else {
            fatalError("Can't find X_API_KEY in CowaySDK-info.plist")
        }
        
        self.baseHeaders = ["X-ApiKey": key]
    }
    
    func request<T>(endPoint: String, headers: [String : String]?, params: [String : Any]?, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        
        let url = baseURL + endPoint
        var httpHeaders = HTTPHeaders(baseHeaders)
        headers?.forEach { httpHeaders.add(HTTPHeader(name: $0, value: $1)) }

        let request = APISession.session.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: httpHeaders)
        
        request.responseDecodable(of: T.self) { (response) in
            print(response.result)
            
            switch response.result {
            case .success(let objects):
                completion(.success(objects))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

