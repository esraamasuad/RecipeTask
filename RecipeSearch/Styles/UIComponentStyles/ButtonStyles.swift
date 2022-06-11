//
//  ButtonStyles.swift
//  it_graduate_new
//
//  Created by Mahmoud Ibaraheim on 7/1/20.
//  Copyright © 2020 MahmoudOrganization. All rights reserved.
//

import Foundation
import UIKit


enum ButtonsType {
    case primary
    case secondary
}

@IBDesignable
class PrimaryButton: UIButton {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPrimaryButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupPrimaryButton()
    }
    
    private func setupPrimaryButton() {
        backgroundColor = UIColor.assetColor
        layer.cornerRadius = 24
        layer.masksToBounds = false
        clipsToBounds = true
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont(name: AppFonts.Cairo.bold, size: 15)
    }
    
    private func setupSecondaryButton() {
        backgroundColor = UIColor.assetColor
        layer.cornerRadius = 4
        layer.masksToBounds = false
        clipsToBounds = true
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont(name: AppFonts.Cairo.semiBold, size: 17)
    }
    
    @IBInspectable public var styles: String = "primary" {
        didSet {
            if styles == "secondary" {
                setupSecondaryButton()
            } else {
                setupPrimaryButton()
            }
        }
    }
}

extension UIButton {
    
    func setActiveButton(fontsize: Int = 17, background: UIColor? = UIColor.assetColor, titleColor: UIColor = .white) {
        isEnabled = true
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = UIFont(name: AppFonts.Cairo.semiBold, size: CGFloat(fontsize))
        if background != nil {
            backgroundColor = background
        }
    }
    
    func setUnActiveButton(fontsize: Int = 17, background: UIColor? = UIColor.lightGray){
        isEnabled = false
        setTitleColor(UIColor.borderColor, for: .normal)
        titleLabel?.font = UIFont(name: AppFonts.Cairo.semiBold, size: 17)
        if background != nil {
            backgroundColor = background
        }
        
    }
    func underline() {
        
        
        if let textUnwrapped = self.titleLabel?.text {
            let underlineAttribute: [NSAttributedString.Key: Any] = [
                .font:  UIFont(name: "Cairo-Regular", size: 13),
                .foregroundColor: UIColor.black,
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ]
            
            let attributeString = NSMutableAttributedString(
                string: textUnwrapped,
                attributes: underlineAttribute
            )
            self.setAttributedTitle(attributeString, for: .normal)
        }
    }
}

