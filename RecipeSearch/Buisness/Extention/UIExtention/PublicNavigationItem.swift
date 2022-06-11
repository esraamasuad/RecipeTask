//
//  WasselMallNavigationItem.swift
//  waselMol
//
//  Created by Saned Apps on 7/24/18.
//  Copyright © 2018 Saned Apps. All rights reserved.
//

import UIKit
import Kingfisher

@objc protocol NavigationBarProtocol {
    @objc func profile()
    @objc func search()
}

class PublicNavigationItem: UINavigationItem {
    
    var delegate: NavigationBarProtocol?
    
    override func awakeFromNib() {
        let profileButton = UIButton(type: .custom)
        profileButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        profileButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        profileButton.imageView?.contentMode = .scaleAspectFit
        profileButton.backgroundColor = .clear
        profileButton.layer.cornerRadius = 15
        profileButton.clipsToBounds = true
        profileButton.layer.borderWidth = 1
        profileButton.layer.borderColor = UIColor.red.cgColor
        profileButton.addTarget(self, action: #selector(self.profile), for: .touchUpInside)
        let leftButton = UIBarButtonItem(customView: profileButton)
        self.leftBarButtonItem = leftButton
        
        let searchBtn = UIButton(type: .custom)
        searchBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        searchBtn.setImage(UIImage(named: "search"), for: .normal)
        searchBtn.addTarget(self, action: #selector(self.search), for: .touchUpInside)
        let rightButton = UIBarButtonItem(customView: searchBtn)
        self.rightBarButtonItem = rightButton
        
    }
    
    @objc func search() {
        self.delegate?.search()
    }
    
    @objc func profile() {
        self.delegate?.profile()
    }
    
}
