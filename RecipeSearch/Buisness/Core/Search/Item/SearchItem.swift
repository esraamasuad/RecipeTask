//
//  SearchItem.swift
//  RecipeSearch
//
//  Created by Esraa on 12/06/2022.
//  Copyright © 2022 MahmoudOrganization. All rights reserved.
//

import Foundation

class SearchItem: BaseItem {
    var recipe: RecipeDetailsModel?
    init(_ recipe: RecipeDetailsModel?) {
        self.recipe = recipe
    }
}
