//
//  HomeWorkerTest.swift
//  CleanSwiftArchitectureTests
//
//  Created by cw-james on 2022/04/19.
//

import XCTest
@testable import CleanSwiftArchitecture

class HomeWorkerTest: XCTestCase {

    func test_fetch_popup() {
        // given
        let service = NetworkServiceStub()
        let repository: PopupRepositoryProtocol = PopupRepository(service: service)
        let promise = expectation(description: "API DONE")
        
        // when
        repository.requestPopupList { result in
            // then
            promise.fulfill()
            
            switch result {
            case .success(let objects):
                let popups = objects.map { $0.toPopup() }
                XCTAssertEqual(objects.isEmpty, false)
                XCTAssertEqual(popups.isEmpty, false)
                XCTAssertEqual(objects.count, popups.count)
                
            case .failure(_):
                XCTAssert(false)
            }
        }
        
        wait(for: [promise], timeout: 3.0)
    }
}
