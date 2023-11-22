//
//  User.swift
//  LoginSample
//
//  Created by Pierce Gallego on 11/21/23.
//

import Foundation


struct User {
    var username: String?
    var password: String?
}


enum ValidationError: Error {
    case fatalError
    case fieldsAreEmpty (String)
}

