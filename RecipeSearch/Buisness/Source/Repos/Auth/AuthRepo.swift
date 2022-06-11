//
//  AuthRepo.swift
//  SwiftMVVMStartupProject
//
//  Created by Mahmoud Ibaraheim on 6/15/20.
//  Copyright © 2020 MahmoudOrganization. All rights reserved.
//

import Foundation
import Promises

protocol AuthRepo {
    func signIn(signInRequest: SignInRequest) -> Promise<BaseResponse<User>>
}
