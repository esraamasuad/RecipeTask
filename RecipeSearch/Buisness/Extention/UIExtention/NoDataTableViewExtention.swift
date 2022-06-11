//
//  NoDataTableViewExtention.swift
//  PantherAppIOS
//
//  Created by Mahmoud ibrahim on 12/20/19.
//  Copyright © 2019 MahmoudOrganization. All rights reserved.
//

import Foundation
import UIKit

extension UITableView: NoDataProtocol {
    
    func setNoDataPlaceholder(title: String = LocalizedWorlds.noData.localize, message: String = "", messageImage: UIImage = UIImage(named: "logo")!) {
        
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        
        let messageImageView = UIImageView()
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        
        messageImageView.backgroundColor = .clear
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageImageView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name: "Montserrat-Regular", size: 18)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        messageLabel.textColor = UIColor.black
        messageLabel.font = UIFont(name: "Montserrat-Regular", size: 17)
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center

        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageImageView)
        emptyView.addSubview(messageLabel)
        
        messageImageView.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        messageImageView.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor, constant: -20).isActive = true
        messageImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        messageImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: messageImageView.bottomAnchor, constant: 15).isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: emptyView.leadingAnchor, constant: 5).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: emptyView.trailingAnchor, constant: 5).isActive = true
        
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        messageLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        
        messageImageView.image = messageImage
        titleLabel.text = title
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        
        UIView.animate(withDuration: 1, animations: {
            
            messageImageView.transform = CGAffineTransform(rotationAngle: .pi / 10)
        }, completion: { (finish) in
            UIView.animate(withDuration: 1, animations: {
                messageImageView.transform = CGAffineTransform(rotationAngle: -1 * (.pi / 10))
            }, completion: { (finishh) in
                UIView.animate(withDuration: 1, animations: {
                    messageImageView.transform = CGAffineTransform.identity
                })
            })
            
        })
        
        self.backgroundView = emptyView
        self.isScrollEnabled = true

    }
    
    func removeNoDataPlaceholder() {
        
        self.isScrollEnabled = true
        self.backgroundView = nil
        
    }
    
}

