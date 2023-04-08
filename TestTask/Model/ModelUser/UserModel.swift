//
//  UserModel.swift
//  TestTask
//
//  Created by Sergio on 19.03.23.
//

import Foundation

struct User: Codable {
    let firstName: String
    let secondName: String
    let phone: String
    let email: String
    let password: String
    let age: Date
}
