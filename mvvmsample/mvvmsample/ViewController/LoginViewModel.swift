//
//  LoginViewModel.swift
//  mvvmsample
//
//  Created by taehoon koo on 16/10/2018.
//  Copyright © 2018 taehoon koo. All rights reserved.
//

import UIKit
import RxSwift

protocol LoginViewModelInput {
    func updateId(id: String)
    func updatePassword(password: String)
    func login()
}
protocol LoginViewModelOutput {
    var loginButtonEnabled: PublishSubject<Bool> { get }
    var alert: PublishSubject<String> { get }
}

class LoginViewModel: LoginViewModelInput, LoginViewModelOutput {
    let loginButtonEnabled: PublishSubject<Bool> = PublishSubject<Bool>()
    let alert: PublishSubject<String> = PublishSubject<String>()
    var id: String! = ""
    var password: String! = ""
}

// Mark: implementation of LoginViewModelOutput
extension LoginViewModel {
}

// Mark: implementation of LoginViewModelInput
extension LoginViewModel {
    func updateId(id: String) {
        self.id = id
        self.updateLoginButtonEnabled()
    }
    func updatePassword(password: String) {
        self.password = password
        self.updateLoginButtonEnabled()
    }
    func login() {
        self.alert.onNext("login action is not implented yet")
    }
    func updateLoginButtonEnabled() {
        if id.count < 1 || password.count < 1 {
            print("id or password count is less than 1")
            loginButtonEnabled.onNext(false)
            return
        }
        print("id or password count is more than 1")
        loginButtonEnabled.onNext(true)
        
    }
}
