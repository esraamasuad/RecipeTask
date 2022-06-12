//
//  SearchListTableViewCell.swift
//  RecipeSearch
//
//  Created by Esraa on 11/06/2022.
//  Copyright © 2022 MahmoudOrganization. All rights reserved.
//

import UIKit

class SearchListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var sourceLbl: UILabel!
    @IBOutlet weak var healthLbl: UILabel!
    @IBOutlet weak var recipeImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(_ item: RecipeDetailsModel?) {
        titleLbl.text = item?.label
        sourceLbl.text = item?.source
        healthLbl.text = item?.healthLabels?.joined(separator: ", ")
        recipeImg.loadUserWebImage(imageUrl: item?.image ?? "")
    }
    
}
