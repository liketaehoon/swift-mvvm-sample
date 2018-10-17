//
//  mvvmsampleTests.swift
//  mvvmsampleTests
//
//  Created by taehoon koo on 16/10/2018.
//  Copyright © 2018 taehoon koo. All rights reserved.
//

import XCTest
import RxBlocking
import RxTest

@testable import mvvmsample

class loginViewModelTests: XCTestCase {
    var loginViewModel = LoginViewModel()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoginButtonEnabled_empty_id_and_password() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
            self.loginViewModel.updateId(id: "")
            self.loginViewModel.updatePassword(password: "")
        }
        do {
            if let loginButtonShouldbeDisabled = try loginViewModel.loginButtonEnabled.skip(1).toBlocking(timeout: 2).first() {
                XCTAssertFalse(loginButtonShouldbeDisabled)
            }
        } catch {
            XCTFail("Failed with \(error.localizedDescription)")
        }
    }

    func testLoginButtonEnabled_with_id_and_password() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
            self.loginViewModel.updateId(id: "a")
            self.loginViewModel.updatePassword(password: "a")
        }
        do {
            if let loginButtonShouldBeEnabled = try loginViewModel.loginButtonEnabled.skip(1).toBlocking(timeout: 2).first() {
                XCTAssertTrue(loginButtonShouldBeEnabled)
            }
        } catch {
            XCTFail("Failed with \(error.localizedDescription)")
        }
    }
    
    func testLoginButtonEnabled_put_normal_and_empty_password() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
            self.loginViewModel.updateId(id: "a")
            self.loginViewModel.updatePassword(password: "a")
            self.loginViewModel.updatePassword(password: "")
        }
        do {
            if let loginButtonShouldbeDisabled = try loginViewModel.loginButtonEnabled.skip(2).toBlocking(timeout: 2).first() {
                XCTAssertFalse(loginButtonShouldbeDisabled)
            }
        } catch {
            XCTFail("Failed with \(error.localizedDescription)")
        }
    }

}
