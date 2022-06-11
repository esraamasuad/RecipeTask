//
//  AddContactEndpoint.swift
//  chappme
//
//  Created by Ahmed on 9/21/20.
//  Copyright © 2020 MahmoudOrganization. All rights reserved.
//

import Foundation

struct AddContactEndpoint: Endpoint {

    var urlPrefix: String = ""
    var service: EndpointService = .contacts
    var method: EndpointMethod = .post
    var encoding: EndpointEncoding = .json
    var auth: AuthorizationHandler = UserAuthoriationHandler()
    var parameters: [String: Any] = [:]
    var headers: [String: String] = [:]

    init(addContactRequest: AddContactRequest) {
        parameters["first_name"] = addContactRequest.firstName
        parameters["last_name"] = addContactRequest.lastName
        parameters["country"] = addContactRequest.country
        parameters["country_code"] = addContactRequest.countryCode
        parameters["phone"] = addContactRequest.phone
        parameters["birthdate"] = addContactRequest.birthdate
        parameters["profile_img"] = addContactRequest.profileImg
        parameters["id_national_front_img"] = addContactRequest.idNationalFrontImg
        parameters["id_national_back_img"] = addContactRequest.idNationalBackImg

    }
}
struct AddContactRequest: Codable {
           
    let firstName, lastName, country, countryCode , phone , birthdate: String
    let profileImg, idNationalFrontImg , idNationalBackImg: Data

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case country = "country"
        case countryCode = "country_code"
        case phone = "phone"
        case birthdate = "birthdate"
        case profileImg = "profile_img"
        case idNationalFrontImg = "id_national_front_img"
        case idNationalBackImg = "id_national_back_img"
    }
}
