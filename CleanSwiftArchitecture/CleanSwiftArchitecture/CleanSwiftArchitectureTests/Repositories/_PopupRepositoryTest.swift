////
////  PopupRepositoryTest.swift
////  CleanSwiftArchitectureTests
////
////  Created by cw-james on 2022/04/15.
////
//
//import XCTest
//@testable import CleanSwiftArchitecture
//
//class PopupRepositoryTest: XCTestCase {
//    func test_request_repository_with_params() {
//        // given
//        let networkServiceStub = NetworkServiceStub()
//        let repository: PopupRepositoryProtocol = PopupRepository(service: networkServiceStub)
//        
//        // when
//        repository.requestPopupList { _ in }
//        
//        // then
//        let expectedURL = "/popup/v1"
//        let actualURL = try? networkServiceStub.requestParameters?.endPoint.asURL().absoluteString
//        XCTAssertEqual(actualURL!, expectedURL)
//        
//        let expectedHeaders:[String: String]? = nil
//        let actualHeaders = networkServiceStub.requestParameters?.headers
//        XCTAssertEqual(actualHeaders, expectedHeaders)
//        
//        let expectedParams: [String:String] = ["placement": "login"]
//        let actualParams = networkServiceStub.requestParameters?.params as? [String:String]
//        XCTAssertEqual(actualParams, expectedParams)
//    }
//}
