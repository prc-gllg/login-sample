//
//  LoginSampleTests.swift
//  LoginSampleTests
//
//  Created by Pierce Gallego on 11/21/23.
//

import XCTest
@testable import LoginSample

//final class LoginSampleTests: XCTestCase {
//
//    var user1: User!
//    override func setUpWithError() throws {
//        super.setUp()
//        user1 = User(username: "aqwer", password: "1234")
//    }
//
//    override func tearDownWithError() throws {
//        super.tearDown()
//        user1 = nil
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
//    
//    func testProcessValidation() {
//        let viewModel = LoginFormViewModel()
//        
//        viewModel.login(user: user1)
//        
//        XCTAssert(<#T##expression: Bool##Bool#>)
//    }
//
//}


class LoginFormViewModelTests: XCTestCase {
    func testVerifyCredentials_Success() {
        let viewModel = LoginFormViewModel()
        let user = User(username: "testuser", password: "testpassword")
        
        let expectation = self.expectation(description: "Verify description")
        
        viewModel.verifyCredentials(user: user) { result in
            switch result {
            case .success(_):
                XCTFail("Expected failure, but got success")
            case .failure(let error):
                print("error: \(error)")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}

