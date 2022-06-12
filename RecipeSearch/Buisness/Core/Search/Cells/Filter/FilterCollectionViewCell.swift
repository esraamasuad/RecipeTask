//
//  FilterCollectionViewCell.swift
//  RecipeSearch
//
//  Created by Esraa on 12/06/2022.
//  Copyright © 2022 MahmoudOrganization. All rights reserved.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
 
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var filtedView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override var isSelected: Bool {
        didSet{
            filtedView.backgroundColor = isSelected ? .assetColor : .clear
            titleLbl.textColor = isSelected ? .white : .black
        }
    }
    
    func configure(_ item: (Int, String, String)) {
        titleLbl.text = item.1
    }

}

