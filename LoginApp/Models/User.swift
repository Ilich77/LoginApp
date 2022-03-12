//
//  User.swift
//  LoginApp
//
//  Created by Iliya Mayasov on 12.03.2022.
//

import Foundation
import UIKit

struct User {
    let userName: String
    let userPassword: String
    var person: Person
    init(_ userName: String, _ userPassword:String, _ name: String, _ surname:String, _ hobby: String) {
        self.userName = userName
        self.userPassword = userPassword
        self.person = Person(name, surname, hobby)
    }
}

struct Person {
    let name: String
    let surname: String
    let hobby: String
    init(_ name: String, _ surname:String, _ hobby: String) {
        self.name = name
        self.surname = surname
        self.hobby = hobby
    }
}
