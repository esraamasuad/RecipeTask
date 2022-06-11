//
//  UserRepo.swift
//  SwiftMVVMStartupProject
//
//  Created by Mahmoud Ibaraheim on 6/15/20.
//  Copyright © 2020 MahmoudOrganization. All rights reserved.
//

import Foundation
import Promises

protocol UserRepo {
    var userModel: User? {get set}
    var userLoggedIn: Bool {get set}
    var userType: String {get set}
    var userId: Int64 {get set}
    var deviceToken: String? {get set}
    var isWatchedIntro: Bool? {get set}
    func localLogOut()
}

