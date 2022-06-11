//
//  UIApplicationHelper.swift
//  SwiftMVVMStartupProject
//
//  Created by Mahmoud Ibaraheim on 6/14/20.
//  Copyright © 2020 MahmoudOrganization. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {

    func isAppInForground() -> Bool {
        switch UIApplication.shared.applicationState {
        case .background, .inactive:
            return false
        case .active:
            return true
        default:
            return true
        }
    }
}
