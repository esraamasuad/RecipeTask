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
    
    var filterList: DynamicObjects<[(Int, String, String)]> = DynamicObjects([])
    var recipesList: DynamicObjects<[HitModel]> = DynamicObjects([])
    var pullToRefresh: DynamicObjects<Bool> = DynamicObjects(false)
    var searchText: Observable<String?> = Observable("")
    
    var filterKey = "" // filter key => [All, Low Sugar, Keto & Vegan]
    var from = 0 // pagination => [from + to]
    var hasMorePagination = false
    var isLoadigPagination = false
    
    init(routingManeger: RouterManager) {
        self.routingManeger = routingManeger
    }
    
    func setData() {
        filterKey = filterList.value.first?.2 ?? ""
        filterList.value = [(0, "All", ""),
                            (1, "Low Sugar", "low-sugar"),
                            (2,"Keto", "keto-friendly"),
                            (3,"Vegan", "vegan")]
    }
    
    func reloadData(_ index: Int = 0) {
        filterKey = filterList.value[index].2
        reSearchData()
    }
    
    func reSearchData() {
        from = 0
        searchEndPoint()
    }
    
    func cancel(){
        recipesList.value.removeAll()
    }
    
    func routeToRecipeDetails(_ index:Int){
        let recipe = recipesList.value[index].recipe
        routingManeger.push(view: .searchDetailsView, presenter: SearchDetailsVM.self, item: SearchItem(recipe))
    }
    
    func searchEndPoint() {
        guard  let search = searchText.value, search != "" else {return}
        isLoadigPagination = true
        if from == 0 {showHudLoading()}
        homeRepo.searchList(searchRequest: SearchRequest(search: search, filter: filterKey, from: from)).then { (searchResult) in
            let newRecipeList = searchResult.hits ?? []
            self.hasMorePagination = searchResult.more ?? false

            if self.from == 0 {
                self.recipesList.value = newRecipeList
            }else {
                self.recipesList.value.append(contentsOf: newRecipeList)
            }
            self.from = searchResult.to ?? 0
        }.catch { (error) in
            self.showSystemError(error: error)
        }.always {
            self.isLoadigPagination = false
            self.hideLoading()
        }
    }
    
}
