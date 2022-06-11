//
//  TextFieldStyle.swift
//  chappme
//
//  Created by Ahmed Maher on 8/5/20.
//  Copyright © 2020 MahmoudOrganization. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class TextFieldStyle: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupStyle()
    }
    
    private func setupStyle() {
        font =  UIFont(name: AppFonts.Cairo.regular, size: 10)
        tintColor = UIColor.assetColor
        textColor =  UIColor.textColor
        layer.masksToBounds = false
        clipsToBounds = true
    }
    
    @IBInspectable public var styles: String = " " {
        didSet {
            setupStyle()
        }
    }
    
}
