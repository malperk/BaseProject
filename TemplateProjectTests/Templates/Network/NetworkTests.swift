//
//  NetworkTests.swift
//  TemplateProjectTests
//
//  Created by Alper KARATAŞ on 20/11/2017.
//  Copyright © 2017 Coda. All rights reserved.
//

import XCTest
import Moya
import RxSwift

class NetworkTests: XCTestCase {
    let provider = MoyaProvider<TemplateAPI>()
    let disposeBag = DisposeBag()
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
//    
    func testGet() {
        let promise = expectation(description: "testGet")
//        var data: Single<[BasicResponse]> = {
//            return templateAPIProvider
//                .rx.request(.get(parameters:nil)).filter(statusCode: 200)
//                .mapJSONObject(type: [BasicResponse].self)
//        }()
//
//        data.asObservable().bind { resp in
//             promise.fulfill()
//        }
        
        templateAPIProvider.rx.request(.get(parameters: nil)).subscribe(onSuccess: { resp in
            promise.fulfill()
        }) { err in
            promise.fulfill()
        }
//        provider.rx.request(.get(id: "test")).subscribe { event in
//            switch event{
//            case .success(let response):
//                if response.statusCode == 200{
//                    promise.fulfill()
//                }else{
//                    XCTFail("Status code: \(response.statusCode)")
//                }
//            case.error(let error):
//                XCTFail("Error: \(error.localizedDescription)")
//            }
//        }.disposed(by: disposeBag)
        waitForExpectations(timeout: 5, handler: nil)
    }
}

