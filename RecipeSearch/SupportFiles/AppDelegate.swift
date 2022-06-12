//
//  AppDelegate.swift
//  it_graduate_new
//
//  Created by Mahmoud Ibaraheim on 6/29/20.
//  Copyright © 2020 MahmoudOrganization. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        setupKeyboardStyle()
//        setLanguage()
//        setNavStyle()
        
//        self.window = UIWindow(frame:UIScreen.main.bounds)
//        StartScreenRoute(window: window!).routeToSplash()
        return true
    }
    
    func setLanguage(){
        UILabel.appearance().substituteFontName = "AppRegularFont".localize()
        UILabel.appearance().substituteFontNameBold = "AppBoldFont".localize()
    }
    
    func setNavStyle(){
        UINavigationBar.appearance().tintColor = UIColor.assetColor
        UINavigationBar.appearance().barTintColor = UIColor.navColor
    }
    
    func setupKeyboardStyle() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.overrideKeyboardAppearance = true
        IQKeyboardManager.shared.keyboardAppearance = .dark
        IQKeyboardManager.shared.toolbarTintColor = UIColor.primaryColor
        IQKeyboardManager.shared.enableAutoToolbar = true
        IQKeyboardManager.shared.previousNextDisplayMode = .alwaysShow
        IQKeyboardManager.shared.toolbarPreviousNextAllowedClasses.append(UIStackView.self)
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        //        let stackViewAppearance = UIStackView.appearance(whenContainedInInstancesOf: [UINavigationBar.self])
        //        stackViewAppearance.spacing = -10
    }
    
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
        //    UsersConnectedSocket.instance.userDisconnected()
    }
    
    
}

