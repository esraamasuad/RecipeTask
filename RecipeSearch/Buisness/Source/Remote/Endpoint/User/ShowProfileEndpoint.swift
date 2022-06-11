//
//  ShowProfileEndpoint.swift
//  chappme
//
//  Created by Ahmed on 9/22/20.
//  Copyright © 2020 MahmoudOrganization. All rights reserved.
//

import Foundation


struct ShowProfileEndpoint: Endpoint {
    
    
    var urlPrefix: String = ""
    var service: EndpointService = .profile
    var method: EndpointMethod = .get
    var encoding: EndpointEncoding = .query
    var auth: AuthorizationHandler = UserAuthoriationHandler()
    var parameters: [String: Any] = [:]
    var headers: [String: String] = [:]
    

}
