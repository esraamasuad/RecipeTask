//
//  BaseResponse.swift
//  RecipeSearch
//
//  Created by Esraa on 09/06/2022.
//  Copyright © 2022 MahmoudOrganization. All rights reserved.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
    let message: String?
    var q: String?
    var from: Int?
    var to: Int?
    var more: Bool?
    var count: Int?
    let hits: T?
}
