//
//  TextFieldWithImage.swift
//  chappme
//
//  Created by Ahmed Maher on 8/30/20.
//  Copyright © 2020 MahmoudOrganization. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {

enum Direction {
    case Left
    case Right
}
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
    }

// add image to textfield
func withImage(direction: Direction, image: UIImage, colorBorder: UIColor){
    let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
    mainView.layer.cornerRadius = 5

    let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
    view.backgroundColor = .white
    view.clipsToBounds = true
    view.layer.cornerRadius = 4
    view.layer.borderWidth = 0
    view.layer.borderColor = colorBorder.cgColor
    mainView.addSubview(view)

    let imageView = UIImageView(image: image)
    imageView.contentMode = .scaleAspectFit
    imageView.frame = CGRect(x: 12, y: 13, width: 20.0, height: 20.0)
    view.addSubview(imageView)


    if(Direction.Left == direction){ // image left
        self.leftViewMode = .always
        self.leftView = mainView
    } else { // image right
        
        self.rightViewMode = .always
        self.rightView = mainView
    }

    self.layer.borderColor = colorBorder.cgColor
    self.layer.borderWidth = 2
    self.layer.cornerRadius = 4
   }

 
}
