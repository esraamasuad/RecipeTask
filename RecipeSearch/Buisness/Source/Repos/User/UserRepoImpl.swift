//
//  UserRepoImpl.swift
//  SwiftMVVMStartupProject
//
//  Created by Mahmoud Ibaraheim on 6/15/20.
//  Copyright © 2020 MahmoudOrganization. All rights reserved.
//

import Foundation
import Promises

class UserRepoImpl: UserRepo {
   
    private var network: NetworkService
    private var localData: LocalData
    
    init(network: NetworkService = NetworkServiceImpl(), localData: LocalData = LocalDataImpl()) {
        self.network = network
        self.localData = localData
    }
    
    var userModel: User? {
        set { localData.set(object: newValue, key: .userModel) }
        get { return  localData.get(object: User.self, key: .userModel) ?? User()}
    }
    
    var userLoggedIn: Bool {
        set { localData.set(newValue, key: .userLoggedIn) }
        get { return (localData.get(key: .userLoggedIn) as? Bool) ?? false}
    }
    
    var userType: String {
        set { localData.set(newValue, key: .userType) }
        get { return (localData.get(key: .userType) as? String) ?? "client"}
    }
    
    var userId: Int64 {
        set { localData.set(newValue, key: .userId) }
        get { return (localData.get(key: .userId) as? Int64) ?? 0}
    }
    var isWatchedIntro: Bool? {
        set { localData.set(newValue, key: .watchedIntro) }
        get { return (localData.objectFor(key: .watchedIntro) as? Bool) ?? false }
    }
    
    var deviceToken: String? {
        set { localData.setDeviceToken(key: .deviceToken) }
        get { return (localData.objectFor(key: .deviceToken) as? String) ?? "" }
    }
    
    func localLogOut() {
        userModel = nil
        userLoggedIn = false
        localData.removeObject(key: .userId)
        localData.removeObject(key: .userModel)
        localData.removeObject(key: .userLoggedIn)
    }
    
   
}
