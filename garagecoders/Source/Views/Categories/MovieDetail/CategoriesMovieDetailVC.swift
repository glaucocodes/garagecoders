//
//  CategoriesMovieDetailVC.swift
//  garagecoders
//
//  Created by Glauco Valdes on 9/4/19.
//  Copyright © 2019 Glauco Valdes. All rights reserved.
//

import UIKit

class CategoriesMovieDetailVC: UIViewController {

    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var year: UILabel!
    var movie : Movie?
    var categoryColor : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.subtitle.text = self.movie!.subTitle
        self.movieDescription.text = self.movie!.description
        self.year.text = String(self.movie!.year)
        
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: self.categoryColor.uppercased())
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    func setVC(movie: Movie,categoryColor: String){
        self.title = movie.title
        self.movie = movie
        self.categoryColor = categoryColor
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
