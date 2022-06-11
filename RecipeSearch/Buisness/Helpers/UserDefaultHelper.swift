//
//  UserDefaultHelper.swift
//  SwiftMVVMStartupProject
//
//  Created by Mahmoud Ibaraheim on 6/14/20.
//  Copyright © 2020 MahmoudOrganization. All rights reserved.
//

import Foundation

enum UserDefaultsKeys: String {
    case language = "language"
}

class UserDefaultsHelpers {
    static func set(value: Any, key: String) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    static func set<T>(object: T, key: String) where T: Encodable {
        let defaults = UserDefaults.standard
        if let encoded = try? JSONEncoder().encode(object) {
            defaults.set(encoded, forKey: key)
            defaults.synchronize()
        }
    }
    
    static func get(key: String) -> Any? {
        if validate(key: key) {
            return UserDefaults.standard.value(forKey: key)!
        }
        return nil
    }
    
    static func get<T>(object: T.Type, key: String) -> T? where T: Decodable {
        if validate(key: key) {
            if let objectData = UserDefaults.standard.data(forKey: key),
                let value = try? JSONDecoder().decode(object.self, from: objectData) {
                return value
            }
        }
        return nil
    }
    
    static func remove(key: String) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: key)
        defaults.synchronize()
    }
    
    static func validate(key: String) -> Bool {
        if UserDefaults.standard.value(forKey: key) != nil {
            return true
        }
        return false
    }
}
