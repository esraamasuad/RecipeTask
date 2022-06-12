//
//  SearchModel.swift
//  RecipeSearch
//
//  Created by Esraa on 11/06/2022.
//  Copyright © 2022 MahmoudOrganization. All rights reserved.
//

import Foundation

struct HitModel: Codable {
    var recipe: RecipeDetailsModel?
}

struct RecipeDetailsModel: Codable {
    var uri: String?
    var label: String?
    var image: String?
    var source: String?
    var url: String?
    var shareAs: String?
    var dietLabels: [String]?
    var healthLabels: [String]?
    var ingredientLines: [String]?
   // var ingredients: [String]?
}
