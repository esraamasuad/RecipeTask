//
//  SearchVM.swift
//  RecipeSearch
//
//  Created by Esraa on 11/06/2022.
//  Copyright © 2022 MahmoudOrganization. All rights reserved.
//

import Bond

class SearchVM: BaseVM {
    private var routingManeger: RouterManager
    private var homeRepo: SearchRepo =  SearchRepoImp()

    var filterList: DynamicObjects<[(Int, String)]> = DynamicObjects([])
    var recipesList: DynamicObjects<[HitModel]> = DynamicObjects([])
    var pullToRefresh: DynamicObjects<Bool> = DynamicObjects(false)
    var searchText: Observable<String?> = Observable("")
    
    var filterKey = "" // filter key => [All, Low Sugar, Keto & Vegan]
    var from = 0 // pagination => [from + to]
    
    init(routingManeger: RouterManager) {
        self.routingManeger = routingManeger
    }

    func setData() {
        filterKey = filterList.value.first?.1 ?? ""
        filterList.value = [(0, "All"), (1, "Low Sugar"), (2,"Keto"), (3,"Vegan")]
    }
    
    func reloadData() {
        filterKey = filterList.value.first?.1 ?? ""
        from = 0
        searchEndPoint()
    }
    
    func routeToRecipeDetails(_ index:Int){
        let recipe = recipesList.value[index]
        
    }
    
    func openFilter() {
      //  routingManeger.present(view: .filterView, presenter: FilterVM.self,
                  //             item: FilterItem(selectedCity, delegate: filterByCity(_:)))
    }
    
    func selectNewFilter(_ index: Int){
        filterKey = filterList.value[index].1
        from = 0
        searchEndPoint()
    }
    
    func searchEndPoint() {
        guard  let search = searchText.value, search != "" else {return}
        showHudLoading()
        homeRepo.searchList(searchRequest: SearchRequest(search: search, filter: filterKey, from: from)).then { (searchResult) in
            let d = searchResult.hits ?? []
            self.recipesList.value = d
            print("====> \(d.first?.recipe?.label ?? "")")
        }.catch { (error) in
            self.showSystemError(error: error)
        }.always {
            self.hideLoading()
        }
    }
    
}
