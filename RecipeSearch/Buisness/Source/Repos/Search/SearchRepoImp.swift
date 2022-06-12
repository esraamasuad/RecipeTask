//
//  SearchRepoImp.swift
//  RecipeSearch
//
//  Created by Esraa on 11/06/2022.
//  Copyright © 2022 MahmoudOrganization. All rights reserved.
//

import Promises

class SearchRepoImp: SearchRepo {
    
    private var network: NetworkService
    private var localData: LocalData
    
    init(network: NetworkService = NetworkServiceImpl(), localData: LocalData = LocalDataImpl()) {
        self.network = network
        self.localData = localData
    }
    
    func searchList(searchRequest: SearchRequest) -> Promise<BaseResponse<[HitModel]>> {
        return self.network.callModel(BaseResponse<[HitModel]>.self, endpoint: SearchListEndPoint(searchRequest: searchRequest))
    }

}
