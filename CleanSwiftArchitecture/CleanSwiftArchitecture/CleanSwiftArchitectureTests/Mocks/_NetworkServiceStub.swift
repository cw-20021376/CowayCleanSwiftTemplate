//
//  NetworkServiceStub.swift
//  CleanSwiftArchitectureTests
//
//  Created by cw-james on 2022/04/15.
//

@testable import CleanSwiftArchitecture
@testable import Alamofire
import Foundation

enum MyError: Error {
    case dummy
}

final class NetworkServiceStub: NetworkServiceProtocol {
    var requestParameters: (endPoint: String, headers: [String: String]?, params: [String: Any]?)?
    
    func request<T>(endPoint: String, headers: [String : String]?, params: [String : Any]?, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        self.requestParameters = (endPoint, headers, params)
        
        let dummy:[PopupDTO] = [
            PopupDTO(id: "testID1",
                  hideDurationDays: 7,
                  onlyOnce: true,
                  contentsUrl: "testContentsURL1"),
            PopupDTO(id: "testID2",
                  hideDurationDays: 7,
                  onlyOnce: true,
                  contentsUrl: "testContentsURL2"),
            PopupDTO(id: "testID3",
                  hideDurationDays: 1,
                  onlyOnce: false,
                  contentsUrl: "testContentsURL3")
        ]
        
        if let dummy = dummy as? T {
            completion(.success(dummy))
        } else {
            completion(.failure(MyError.dummy))
        }
//        completion(.success(dummy as! T))
    }
}
