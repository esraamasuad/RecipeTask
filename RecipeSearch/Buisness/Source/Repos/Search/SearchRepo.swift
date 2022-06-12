//
//  SearchRepo.swift
//  RecipeSearch
//
//  Created by Esraa on 11/06/2022.
//  Copyright © 2022 MahmoudOrganization. All rights reserved.
//

import Promises

protocol SearchRepo {
    func searchList(searchRequest: SearchRequest) -> Promise<BaseResponse<[HitModel]>>
}
