//
//  UIViewControllerExtention.swift
//  PantherAppIOS
//
//  Created by Mahmoud Ibaraheim on 6/8/19.
//  Copyright © 2019 MahmoudOrganization. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setTransparentNavagtionBar( _ title: String, _ isTranslucent:Bool = true,_ barColor:UIColor = .white) {
                if #available(iOS 15, *) {
                    let appearance = UINavigationBarAppearance()
                    isTranslucent == true ? appearance.configureWithTransparentBackground() : appearance.configureWithDefaultBackground()
                    appearance.backgroundColor = isTranslucent == true ?.clear : barColor
                    appearance.titleTextAttributes = [.foregroundColor: UIColor.black,.font : UIFont(name: "AppRegularFont".localize(), size: 16)!]
                    appearance.shadowColor = .clear
                    self.navigationItem.title = title
                    self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
                    self.navigationController?.navigationBar.standardAppearance = appearance;
                    self.navigationController?.navigationBar.scrollEdgeAppearance = appearance;
                    }
        else{
            self.navigationController?.navigationBar.isTranslucent = isTranslucent
                    self.navigationController?.navigationBar.barTintColor = isTranslucent == true ?.clear : barColor
                    self.navigationController?.navigationBar.tintColor = UIColor.black
                    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                    self.navigationController?.navigationBar.shadowImage = UIImage()
//                    self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "back_arrow")!
                    self.navigationItem.title = title
                    self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
                    self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "AppRegularFont".localize(), size: 14)!,
                                                                                    NSAttributedString.Key.foregroundColor: UIColor.black]
        }

        
        hideNavigationBar(hide: false)
    }
    
    func setNavigationBarTitle( _ title: String) {
        self.navigationItem.title = title
    }
    
    func largeTitle() {
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
    }
    
    func setNavgationWithSearch(_ title: String) {
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationItem.title = title
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
         self.navigationController?.navigationBar.shadowImage = UIImage()
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        
        searchController.searchBar.placeholder = "Search transaction"
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = true
        hideNavigationBar(hide: false)
    }
    
    func hideNavigationBar(hide: Bool) {
        self.navigationController?.setNavigationBarHidden(hide, animated: true)
    }

}


