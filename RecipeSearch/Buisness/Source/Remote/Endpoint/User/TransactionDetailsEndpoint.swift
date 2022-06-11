//
//  TransactionDetails.swift
//  chappme
//
//  Created by Ahmed on 9/20/20.
//  Copyright © 2020 MahmoudOrganization. All rights reserved.
//

import Foundation


struct TransactionDetailsEndpoint: Endpoint {

   
    var urlPrefix: String = ""
    var service: EndpointService = .transaction
    var method: EndpointMethod = .get
    var encoding: EndpointEncoding = .query
    var auth: AuthorizationHandler = UserAuthoriationHandler()
    var parameters: [String: Any] = [:]
    var headers: [String: String] = [:]

    init(transactionId: Int) {
        urlPrefix += "/\(transactionId)"
         }
      
}
