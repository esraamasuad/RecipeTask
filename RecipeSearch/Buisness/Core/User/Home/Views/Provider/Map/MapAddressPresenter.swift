//
//  MapAddressVM.swift
//  ezra3_ios
//
//  Created by Esraa on 29/05/2022.
//  Copyright © 2022 MahmoudOrganization. All rights reserved.
//

import Bond
import Promises
import GoogleMaps

import Foundation

class MapAddressVM: BaseVM {
    private var routingManeger: RouterManager
    
    var locationCoordinate: DynamicObjects<CLLocationCoordinate2D> = DynamicObjects(CLLocationCoordinate2D(latitude: 0, longitude: 0))
    var city:Observable<String?> = Observable("")
    var address:Observable<String?> = Observable("")
    
    var branch: BranchModel?
    
    init(routingManeger: RouterManager, _ branches: [BranchModel]) {
        self.routingManeger = routingManeger
        self.branch = branches.first
    }
    
    override func hydrate() {}
    
    func reloadData() {
        city.value = branch?.city?.name
        address.value = branch?.address
        locationCoordinate.value = CLLocationCoordinate2D(latitude: Double(branch?.lat ?? "") ?? 0,
                                                          longitude: Double(branch?.lng ?? "") ?? 0)
    }
}
