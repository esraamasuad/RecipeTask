//
//  Endpoint.swift
//  SwiftMVVMStartupProject
//
//  Created by Mahmoud Ibaraheim on 6/14/20.
//  Copyright © 2020 MahmoudOrganization. All rights reserved.
//

import Foundation

protocol Endpoint {
    var service: EndpointService {get set}
    var urlPrefix: String {get set}
   // var endpointVersion: Versions {get set}
    var method: EndpointMethod {get set}
    var auth: AuthorizationHandler {get set}
    var parameters: [String: Any] {get set}
    var encoding: EndpointEncoding {get set}
    var headers: [String: String] {get set}
    var multipart: [MultiPartModel] {get }
}

enum EndpointEncoding {
    case json
    case query
}

//enum Versions: String {
//    case version1 = "v1"
//    case version2 = "v2"
//}

enum EndpointMethod: String {
    case get
    case post
    case put
    case delete
}

enum EndpointService: String {
  
    //auth
    case signIn = "login"
    case signUp = "register"
    case signOut = "logout"
    
    // order
   
    // user servises
   
    // Home
   
    //user
    
    //Driver
    
    //Settings
   
    //general

    
     var url: String {
        return "https://www.\(self.rawValue)"
    }
}

extension Endpoint {
    var multipart: [MultiPartModel] {
        return []
    }
}
