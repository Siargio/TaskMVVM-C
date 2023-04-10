//
//  UserDefaultsManager.swift
//  TestTask
//
//  Created by Sergio on 8.04.23.
//

import Foundation
class DataBase {

    static let shard = DataBase()

    enum SettingKeys: String {
        case users
        case activeUser
    }

    let defaults = UserDefaults.standard
    let userKey = SettingKeys.users.rawValue
    let activeUserKey = SettingKeys.activeUser.rawValue

    var users: [RegisterUserModel] {
        get {
            if let data = defaults.value(forKey: userKey) as? Data { //запрашиваем по ключу дату и проверям
                return try! PropertyListDecoder().decode([RegisterUserModel].self, from: data) // декодируем в модель User
            } else {
                return [RegisterUserModel]()
            }
        }

        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: userKey)
            }
        }
    }

    func saveUser(name: String, password: String, email: String) {
        let user = RegisterUserModel(name: name, password: password, email: email)
        users.insert(user, at: 0)
    }

    var activeUser: RegisterUserModel? {
        get {
            if let data = defaults.value(forKey: activeUserKey) as? Data { 
                return try! PropertyListDecoder().decode(RegisterUserModel.self, from: data)
            } else {
                return nil
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: activeUserKey)
            }
        }
    }
    
    func saveActiveUser(user: RegisterUserModel) {
        activeUser = user
    }
}
