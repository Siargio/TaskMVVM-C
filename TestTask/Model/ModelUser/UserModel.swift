//
//  UserModel.swift
//  TestTask
//
//  Created by Sergio on 19.03.23.
//

import Foundation

struct RegisterUserModel: Codable {
    let name: String
    let password: String
    let email: String
}
