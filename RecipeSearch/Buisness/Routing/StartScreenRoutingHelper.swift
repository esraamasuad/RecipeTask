//
//  StartScreenRouting.swift
//  SwiftMVVMStartupProject
//
//  Created by Mahmoud Ibaraheim on 6/14/20.
//  Copyright © 2020 MahmoudOrganization. All rights reserved.
//

import Foundation
import UIKit

class StartScreenRoute {
    var userRepo: UserRepo
    var window: UIWindow 
    
    init(window: UIWindow = (UIApplication.shared.delegate?.window)!!  ,userRepo: UserRepo = UserRepoImpl()) {
        self.window = window
        self.userRepo = userRepo
    }
    
    private func routeTo<ViewController: UIViewController>(storyBoard: Storyboard, idintifier: String , controller: ViewController.Type){
        let storyboard = UIStoryboard(name: storyBoard.rawValue, bundle:nil)
        window.rootViewController =  UINavigationController.init(rootViewController: storyboard.instantiateViewController(withIdentifier: idintifier) as! ViewController)
    }
    
    private func navigateToHome<ViewController: UIViewController>(storyBoard: Storyboard, idintifier: String , controller: ViewController.Type,from: FromView){
//        let storyboard = UIStoryboard(name: storyBoard.rawValue, bundle:nil)
//        let homeVc = storyboard.instantiateViewController(withIdentifier: idintifier) as! UserHome
//        homeVc.from = from
//       // let homeNav = UINavigationController.init(rootViewController: homeVc)
//        window.rootViewController = homeVc
    }
    
    public func routeToHome(_ from : FromView = .other) {
       // navigateToHome(storyBoard: .main, idintifier: "UserHome", controller: UserHome.self,from: from)
    }
    
    public func routeToLogin() {
       // routeTo(storyBoard: .auth, idintifier: "SignInView", controller: SignInView.self)
    }
    public func routeToUserType() {
       // routeTo(storyBoard: .auth, idintifier: "UserTypeView", controller: UserTypeView.self)
    }
    
    public func routeToSplash() {
        //routeTo(storyBoard: .splash, idintifier: "SplashView", controller: SplashView.self)
    }
   

}

enum FromView{
    case other
    case home
}
