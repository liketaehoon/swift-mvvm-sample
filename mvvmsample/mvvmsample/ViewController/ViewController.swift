//
//  ViewController.swift
//  mvvmsample
//
//  Created by taehoon koo on 16/10/2018.
//  Copyright © 2018 taehoon koo. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController, UITextFieldDelegate {
    
    let loginViewModel: LoginViewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.bind()
    }
    
    func bind() {
        loginViewModel.loginButtonEnabled
            .subscribe(onNext: { isEnabled in
                print(isEnabled)
                self.loginButton.isEnabled = isEnabled
            })
            .disposed(by: disposeBag)
        
        loginViewModel.alert
            .subscribe(onNext: { message in
                let alertController = UIAlertController.init(title: nil, message: message, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.show(alertController, sender: nil)
                
            })
            .disposed(by: disposeBag)
    }
}

// Mark: implementation of UITextFieldDelegate
extension ViewController {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else {
            return
        }
        if idTextField == textField {
            loginViewModel.updateId(id: text)
        } else if passwordTextField == textField {
            loginViewModel.updatePassword(password: text)
        }
    }
}

// Mark: implementation of IB Actions
extension ViewController {
    @IBAction func touchLoginButton() {
        loginViewModel.login()
    }
}
