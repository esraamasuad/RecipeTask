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
    
    init(network: NetworkService = NetworkServiceImpl()) {
        self.network = network
    }
    
    func searchList(searchRequest: SearchRequest) -> Promise<BaseResponse<[HitModel]>> {
        return self.network.callModel(BaseResponse<[HitModel]>.self, endpoint: SearchListEndPoint(searchRequest: searchRequest))
    }

}
