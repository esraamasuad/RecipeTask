//
//  UIImageExtention.swift
//  chappme
//
//  Created by Ahmed on 9/2/20.
//  Copyright © 2020 MahmoudOrganization. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func compressImage() -> UIImage {
        let imageData = UIImage(named:"background.jpg")!.jpegData(compressionQuality: 0.2)
           let image = UIImage(data: imageData!)
           return image!
           }
}
extension UIImage {
    func resizeImage(newSize : CGSize , original : Bool = true) -> UIImage {
           
           UIGraphicsBeginImageContext(CGSize(width: newSize.width, height: newSize.height))
           self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
           var newImage = UIGraphicsGetImageFromCurrentImageContext()
           if original {
               newImage = newImage?.withRenderingMode(.alwaysOriginal)
           }
           
           UIGraphicsEndImageContext()
           
           return newImage!
           
           
       }
}
extension UIImage {
    
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    func toData() -> Data? {
        return self.pngData()
    }
    
    func jpeg(_ jpegQuality: JPEGQuality) -> Data? {
        return  self.jpegData(compressionQuality: jpegQuality.rawValue)
    }
    
}

class RotateImage:UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        let current_lang = Localization.currentAppleLanguage()
        if current_lang == "ar" {
            self.transform = CGAffineTransform(rotationAngle: .pi)
        }
    }
}
