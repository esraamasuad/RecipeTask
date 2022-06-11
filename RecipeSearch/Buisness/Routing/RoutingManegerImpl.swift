//
//  RoutingController.swift
//  SwiftMVVMStartupProject
//
//  Created by Mahmoud Ibaraheim on 6/14/20.
//  Copyright © 2020 MahmoudOrganization. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import AVKit

enum Storyboard: String {
    
    case main = "Main"
    case splash = "Splash"
    case setting = "Setting"
    case auth = "Auth"
    case chat = "Chat"
    case orders = "Orders"
    case onBoarding = "OnBoarding"
    case help = "Help"
    case addAccount = "AddAccount"
    case sendMoney = "SendMoney"
    case transaction = "Transaction"
    case profile = "Profile"
    
    case provider = "Provider"
    case providerProfile = "ProviderProfile"
    case cart = "Cart"
    case makeOrder = "MakeOrder"
    case department = "Department"
    
    case myProducts = "MyProducts"
    case order = "Order"
}

enum View: String {
    // splash storyboard
    case splash = "SplashView"
    
    // main storyboard
    case main = "MainScreenView"
    case home = "HomeView"
    case ordersTabs = "OrderTabsRoot"
    case ordersList = "OrderListView"
    case tutorials = "TurorialsView"
    case babies = "BabiesServisesView"
    case trends = "TrendsView"
    case Favorite = "FavouriteView"
    case coupons = "CouponsView"
    case chat = "MessagesView"
    case settings = "SettingsView"
    case map = "MapView"
    case previewImage = "PreviewImageView"
    
    // onboard storyboard
    case Walkthrough = "WalkthroughViewController"
    
    // auth storyboard
    case signIn = "SignInView"
    case signup = "SignUpView"
    case waiting = "WaitingView"
    case delegateSignUp = "DelegateSignUpView"
    case providerSignUp = "ProviderSignUpView"
    case forgetPassword = "ForgetPasswordView"
    case resetPassword = "ResetPasswordView"
    case confirmCode = "VerifyCodeView"
    case selectUserTypeView = "SelectUserTypeView"
    case checkPhone = "CheckPhoneView"
    case help = "HelpView"
    case addAccount = "AddAccountView"
    case sendMoney = "SendMoneyView"
    case confirmation = "ConfirmationView"
    case transaction = "TransactionDetailsView"
    case addProfile  = "AddProfileView"
    case countryCodeView = "CountryCodeView"
    
    // order storyboard
    case orderDetails = "OrderDetailsView"
    case providerOrderDetailsView = "ProviderOrderDetailsView"
    case cancelReasonView = "CancelReasonView"
    case rate =  "RateView"
    case successRateView = "SuccessRateView"
    case previewRateView = "PreviewRateView"
    
    case paymentMethods = "PaymentMethodsView"
    case makePayment = "MakePaymentView"
    case continuePayment = "ContinuePaymentView"
    case orderChat =  "ChatView"
    case locationView = "LocationView"
    
    // setting storyboard
    case dresses = "DressesView"
    case dressesDetails = "DressOrderDetailsView"
    case notification = "NotificationsListView"
    case resetLink = "ResetLinkView"
    case newPassword = "NewPasswordView"
    case confirmPassword = "ConfirmPasswordView"
    case discountCodes = "DiscountCodeView"
    case language = "LanguageView"
    case contact = "ContactUsView"
    case info = "InfoView"
    case editProfileView = "EditProfileView"
    case changePasswordView = "ChangePasswordView"
    case changePhoneView = "ChangePhoneView"
    case providersListView = "ProvidersListView"
    case providerProfileTabsRoot = "ProviderProfileTabsRoot"
    case providerTabListView = "ProviderTabListView"
    case showImageView = "ShowImageView"
    
    // Department
    case departmentListView = "DepartmentListView"
    case searchView = "SearchView"
    case filterView = "FilterView"
    
    // ProviderProfile
    case providerRootView = "ProviderRootView"
    case productsListView = "ProductsListView"
    case productDetailsView = "ProductDetailsView"
    case servicesListView = "ServicesListView"
    case serviceDetails = "ServiceDetailsView"
    case addProduct = "AddProductView"
    case addServise = "AddServiceView"
    case addressView = "AddressView"
    case mapAddressView = "MapAddressView"
    
    // Cart
    case cartListView = "CartListView"
    
    // MakeOrder
    case makeOrderFromCartView = "MakeOrderFromCartView"
    case makeOrderServiceView = "MakeOrderServiceView"
    case successOrderView = "SuccessOrderView"
    
    // Provider Account
    case myProductsRootTab = "MyProductsRootTab"
    case providerProfile = "ProviderProfileView"

    var storyboard: Storyboard {
        switch self {
        case .departmentListView, .searchView, .filterView:
            return .department
            
        case .providerRootView, .productsListView, .servicesListView,
             .serviceDetails, .productDetailsView, .addressView, .mapAddressView:
            return .provider
            
        case .splash:
            return .splash
        
        case .Walkthrough:
            return .onBoarding
            
        case .orderChat:
            return .chat
            
        case .ordersList, .paymentMethods,.makePayment,.continuePayment:
            return .orders
        
        case .orderDetails, .providerOrderDetailsView,
             .cancelReasonView, .successRateView, .rate, .previewRateView:
            return .order
            
        case .signIn, .signup, .forgetPassword, .confirmCode, .newPassword,.checkPhone, .selectUserTypeView,.resetPassword,.resetLink,.confirmPassword,.countryCodeView,.locationView,.delegateSignUp,.providerSignUp,.waiting:
       
            return .auth
        
        case .main, .home, .ordersTabs, .tutorials, .chat ,.settings,
                .babies,.trends,.Favorite,.notification,.coupons,.map,.previewImage:
            return .main
       
        case .help: return .help
        case .dresses, .dressesDetails, .discountCodes , .language , .contact ,.info,
             .editProfileView, .changePhoneView, .changePasswordView,
             .providersListView, .providerProfileTabsRoot, .providerTabListView,
             .showImageView:
            return .setting
            
        case .addAccount: return .addAccount
        case .transaction: return .transaction
        case .sendMoney , .confirmation: return .sendMoney
        case .addProfile:
            return .profile
        case .providerProfile: return .providerProfile
        case .cartListView:
            return .cart
            
        case .makeOrderFromCartView, .makeOrderServiceView, .successOrderView:
            return .makeOrder
            
        case .myProductsRootTab,.addProduct,.addServise:
            return .myProducts
        }
    }
    
    func controller<Presenter: BaseVM, Item: BaseItem>(presenterType: Presenter.Type, item: Item) -> BaseView<Presenter, Item> {
        let controller = UIStoryboard.init(name: storyboard.rawValue, bundle: Bundle.main).instantiateViewController(withIdentifier: rawValue)
            as! BaseView<Presenter, Item> //swiftlint:disable:this force_cast
        controller.item = item
        return controller
    }
    
    func identifyViewController<viewController: UIViewController>(viewControllerType: viewController.Type) -> viewController {
        let controller = UIStoryboard.init(name: storyboard.rawValue, bundle: Bundle.main).instantiateViewController(withIdentifier: rawValue)
            as! viewController //swiftlint:disable:this force_cast
        return controller
    }
    
    
    func baseController<ViewController: UIViewController>(viewControllerType: ViewController.Type) -> ViewController {
        let controller = UIStoryboard.init(name: storyboard.rawValue, bundle: Bundle.main).instantiateViewController(withIdentifier: rawValue)
            as! ViewController //swiftlint:disable:this force_cast
        return controller
    }
}


class RouterManagerImpl: RouterManager {
    
    var currentViewController: UIViewController
    
    init(_ currentViewController: UIViewController) {
        self.currentViewController = currentViewController
    }
    
    func routeToInitialController<ViewController>(view: View, controller: ViewController.Type) where ViewController : UIViewController {
        let storyboard = UIStoryboard(name: view.storyboard.rawValue, bundle: nil)
        SceneDelegate.window!.rootViewController =  UINavigationController.init(rootViewController: storyboard.instantiateViewController(withIdentifier: view.rawValue) as! ViewController)
        SceneDelegate.window!.makeKeyAndVisible()
    }
    
    func present<Presenter: BaseVM, Item: BaseItem>(view: View, presenter: Presenter.Type, item: Item) {
        let viewController = view.controller(presenterType: presenter, item: item)
        viewController.modalPresentationStyle = .automatic
        currentViewController.present(viewController, animated: true)
    }

  
    func presentFullScreen<Presenter: BaseVM, Item: BaseItem>(view: View, presenter: Presenter.Type, item: Item) {
        let viewController = view.controller(presenterType: presenter, item: item)
        if #available(iOS 13.0, *) {
            if viewController.modalPresentationStyle == .automatic {
                viewController.modalPresentationStyle = .fullScreen
            }
        }
        currentViewController.present(viewController, animated: true)
    }
    
    func push<Presenter: BaseVM, Item: BaseItem>(view: View, presenter: Presenter.Type, item: Item ) {
        let viewController = view.controller(presenterType: presenter, item: item)
        currentViewController.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func push(vc: UIViewController) {
        currentViewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushNotPresenterController<ViewController: UIViewController>(view: View, controller: ViewController.Type) {
        let viewController = view.baseController(viewControllerType: controller)
        currentViewController.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func present(vc: UIViewController) {
        currentViewController.present(vc, animated: true)
    }
    
    func popBack() {
        currentViewController.navigationController?.popViewController(animated: true)
    }
    
    func popNumOfViews(num: Int){
        currentViewController.navigationController?.popViewControllers(viewsToPop: num)
    }
    
    func dismiss() {
        currentViewController.dismiss(animated: true, completion: nil)
    }
    
    func openMediaPlayer(url : String){
        let audioSession = AVAudioSession.sharedInstance()
        do{
            try audioSession.setCategory(.playback, mode: .default)
            let audioURL = URL.init(string: url)
            let player = AVPlayer(url: audioURL!)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            currentViewController.present(playerViewController, animated: true) {
                playerViewController.player?.play()
            }
        }catch {
            print(error)
        }
    }
    
    func openShare(share: Any) {
        let activityViewController = UIActivityViewController(activityItems: share as! [Any], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = currentViewController.view
        currentViewController.present(activityViewController, animated: true, completion: nil)
    }
}

extension UINavigationController {
    
    func popToViewController(ofClass: AnyClass, animated: Bool = false) {
        if let vc = viewControllers.filter({$0.isKind(of: ofClass)}).last {
            popToViewController(vc, animated: animated)
        }
    }
    
    func popViewControllers(viewsToPop: Int, animated: Bool = false) {
        if viewControllers.count > viewsToPop {
            let vc = viewControllers[viewControllers.count - viewsToPop - 1]
            popToViewController(vc, animated: animated)
        }
    }
    
}
