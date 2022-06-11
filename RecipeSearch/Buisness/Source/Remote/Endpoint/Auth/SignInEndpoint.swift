//
//  SignInEndpoint.swift
//  it_graduate_new
//
//  Created by Mahmoud Ibaraheim on 7/11/20.
//  Copyright © 2020 MahmoudOrganization. All rights reserved.
//

import Foundation

struct SignInEndpoint: Endpoint {
    var urlPrefix: String = ""
    var service: EndpointService = .signIn
    var method: EndpointMethod = .post
    var encoding: EndpointEncoding = .json
    var auth: AuthorizationHandler = NoneAuthorizationHandler()
    var parameters: [String: Any] = [:]
    var headers: [String: String] = [:]

    init(signInRequest: SignInRequest) {
        parameters["country_code"] = signInRequest.countryCode
        parameters["phone"] = signInRequest.phone
        parameters["firebase_token"] = signInRequest.fcmToken
        parameters["device_identifier"] = signInRequest.deviceId
        parameters["password"] = signInRequest.password
    }
}

// MARK: - UserRequest
struct SignInRequest: Codable {
    let phone, password, userType, countryCode: String
    let fcmToken,deviceId: String
}
