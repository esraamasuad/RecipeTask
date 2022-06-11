//
//  EditContactEndPoint.swift
//  chappme
//
//  Created by Ahmed on 9/21/20.
//  Copyright © 2020 MahmoudOrganization. All rights reserved.
//

import Foundation

struct EditContactEndPoint: Endpoint {

    var urlPrefix: String = ""
    var service: EndpointService = .auth
    var method: EndpointMethod = .put
    var encoding: EndpointEncoding = .json
    var auth: AuthorizationHandler = UserAuthoriationHandler()
    var parameters: [String: Any] = [:]
    var headers: [String: String] = [:]

    init(editContactRequest: EditContactRequest ) {
        parameters["first_name"] = editContactRequest.firstName
        parameters["last_name"] = editContactRequest.lastName
        parameters["country"] = editContactRequest.country
        parameters["country_code"] = editContactRequest.countryCode
        parameters["phone"] = editContactRequest.phone
        parameters["birthdate"] = editContactRequest.birthdate
        parameters["profile_img"] = editContactRequest.profileImg
//        parameters["id_national_front_img"] = editContactRequest.idNationalFrontImg
//        parameters["id_national_back_img"] = editContactRequest.idNationalBackImg


    }
}
struct EditContactRequest: Codable {
    
    let firstName, lastName, country, countryCode , phone , birthdate: String
    let profileImg : Data
  //  let  idNationalFrontImg , idNationalBackImg: Data

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case country = "country"
        case countryCode = "country_code"
        case phone = "phone"
        case birthdate = "birthdate"
        case profileImg = "profile_img"
//        case idNationalFrontImg = "id_national_front_img"
//        case idNationalBackImg = "id_national_back_img"
    }
}
