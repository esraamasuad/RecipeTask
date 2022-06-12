//
//  SearchListEndPoint.swift
//  RecipeSearch
//
//  Created by Esraa on 11/06/2022.
//  Copyright © 2022 MahmoudOrganization. All rights reserved.
//

import Foundation

struct SearchListEndPoint: Endpoint {
    var urlPrefix: String = ""
    var service: EndpointService = .searchList
    var method: EndpointMethod = .get
    var encoding: EndpointEncoding = .query
//    var auth: AuthorizationHandler = NoneAuthorizationHandler()
    var parameters: [String: Any] = [:]
    var headers: [String: String] = [:]

    init(searchRequest: SearchRequest) {
      //  urlPrefix = urlPrefix + "?q=\(searchRequest.search)&app_id=\(AppConstatnts.appID)&app_key=\(AppConstatnts.appKEY)"
        parameters["q"] = searchRequest.search
        parameters["from"] = searchRequest.from
        parameters["health"] = searchRequest.filter
        parameters["app_id"] = AppConstatnts.appID
        parameters["app_key"] = AppConstatnts.appKEY
    }
}

// MARK: - UserRequest
struct SearchRequest: Codable {
    let search,filter: String
    let from:Int
}
