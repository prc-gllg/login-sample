//
//  LoginFormViewModel.swift
//  LoginSample
//
//  Created by Pierce Gallego on 11/22/23.
//

import Foundation
import UIKit

struct LoginFormViewModel {
    
    func login(user: User) {
        self.verifyCredentials(user: user) { (result) in
            switch result {
            case let .success(verify):
                print(verify)
                self.presentHomeView(with: user)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func verifyCredentials(user: User, completion: @escaping (Result<String, ValidationError>) -> Void) {
        let result = self.processValidation(user: user)
        completion(result)
    }
    
    func processValidation(user: User) -> Result<String, ValidationError> {
        
        guard let username = user.username, let password = user.password else {
            return .failure(.fatalError)
        }
        if password.isEmpty && !username.isEmpty{
            return .failure(.fieldsAreEmpty("Password is required"))
        } else if username.isEmpty && !password.isEmpty {
            return .failure(.fieldsAreEmpty("Username is required"))
        } else if username.isEmpty && password.isEmpty {
            return .failure(.fieldsAreEmpty("Fields should not be empty"))
        }
        return .success("PASSSSSSSSS")
    }
    
    func presentHomeView(with user: User) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homePageViewController = storyboard.instantiateViewController(withIdentifier: "HomePageViewController") as! HomePageViewController
        homePageViewController.user = user
        UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }.flatMap { $0.windows }.first { $0.isKeyWindow }?.rootViewController = homePageViewController
    }
}
