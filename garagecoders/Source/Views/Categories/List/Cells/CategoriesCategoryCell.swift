//
//  CategoriesCategoryCell.swift
//  garagecoders
//
//  Created by Glauco Valdes on 9/4/19.
//  Copyright © 2019 Glauco Valdes. All rights reserved.
//

import UIKit

class CategoriesCategoryCell: UITableViewCell {
    public static let reuseIdentifier = "CategoriesCategoryCell"
    @IBOutlet weak var category: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCell(category: Category){
        self.category.text = category.category
        self.backgroundColor = UIColor(hex: category.color.uppercased())
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
