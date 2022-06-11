//
//  previewTransactionEndPoint.swift
//  chappme
//
//  Created by Ahmed Maher on 10/4/20.
//  Copyright © 2020 MahmoudOrganization. All rights reserved.
//

import Foundation
struct previewTransactionEndPoint: Endpoint {

    var urlPrefix: String = "/preview_transaction"
    var service: EndpointService = .transaction
    var method: EndpointMethod = .post
    var encoding: EndpointEncoding = .json
    var auth: AuthorizationHandler = UserAuthoriationHandler()
    var parameters: [String: Any] = [:]
    var headers: [String: String] = [:]

    init(transactionPreviewRequest: TransactionPreviewRequest) {
        parameters["transaction"] = transactionPreviewRequest.asDictionary()

    }
}



// MARK: - User
struct TransactionPreviewRequest: Codable {
    
    let contactId, userAccountId: Int
    let moneySend: String
    let moneySendCurrency, message: String

    enum CodingKeys: String, CodingKey {
      
        case contactId = "contact_id"
        case moneySend = "money_send"
        case moneySendCurrency = "money_send_currency"
        case userAccountId = "user_account_id"
        case message
    }
}
