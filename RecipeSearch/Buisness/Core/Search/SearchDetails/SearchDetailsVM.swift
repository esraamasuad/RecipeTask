//
//  SearchDetailsVM.swift
//  RecipeSearch
//
//  Created by Esraa on 11/06/2022.
//  Copyright © 2022 MahmoudOrganization. All rights reserved.
//

import Bond

class SearchDetailsVM: BaseVM {
    private var routingManeger: RouterManager

    var recipeImage: DynamicObjects<String> = DynamicObjects("")
    var title: Observable<String?> = Observable("")
    var ingrediente: Observable<String?> = Observable("")
    var url = ""
    
    var recipeDetails: RecipeDetailsModel?
    
    init(routingManeger: RouterManager, _ recipe: RecipeDetailsModel?) {
        self.routingManeger = routingManeger
        self.recipeDetails = recipe
    }

    func setData() {
        recipeImage.value = recipeDetails?.image ?? ""
        title.value = recipeDetails?.label
        ingrediente.value = recipeDetails?.ingredientLines?.joined(separator: "\n")
        url = recipeDetails?.url ?? ""
    }
    
    func openFilter() {
      //  routingManeger.present(view: .filterView, presenter: FilterVM.self,
                  //             item: FilterItem(selectedCity, delegate: filterByCity(_:)))
    }
    
}
