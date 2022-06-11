//
//  Auth.swift
//  SwiftMVVMStartupProject
//
//  Created by Mahmoud Ibaraheim on 6/15/20.
//  Copyright © 2020 MahmoudOrganization. All rights reserved.
//

import Foundation
import Promises

class AuthRepoImplement: AuthRepo {

    private var network: NetworkService
    
    init(network: NetworkService = NetworkServiceImpl()) {
        self.network = network
    }

    func signIn(signInRequest: SignInRequest) -> Promise<BaseResponse<User>> {
        return self.network.callModel(BaseResponse<User>.self, endpoint: SignInEndpoint(signInRequest: signInRequest))
    }

}
