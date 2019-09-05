//
//  CategoriesMovieTVCell.swift
//  garagecoders
//
//  Created by Glauco Valdes on 9/4/19.
//  Copyright © 2019 Glauco Valdes. All rights reserved.
//

import UIKit

class CategoriesMovieCell: UITableViewCell {

    public static let reuseIdentifier = "CategoriesMovieCell"
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var year: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(movie: Movie){
        self.title.text = movie.title
        self.subtitle.text = movie.subTitle
        self.movieDescription.text = movie.description
        self.year.text = String(movie.year)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
