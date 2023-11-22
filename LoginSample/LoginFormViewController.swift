//
//  ViewController.swift
//  LoginSample
//
//  Created by Pierce Gallego on 11/21/23.
//

import UIKit

class LoginFormViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var loginFormViewModel = LoginFormViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonPush(_ sender: UIButton) {
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""
        let user = User(username: username, password: password)
        self.loginFormViewModel.login(user: user)
    }
}

