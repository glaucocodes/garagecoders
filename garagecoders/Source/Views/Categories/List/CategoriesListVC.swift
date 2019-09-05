//
//  MoviesCategoriesListVC.swift
//  garagecoders
//
//  Created by Glauco Valdes on 9/4/19.
//  Copyright © 2019 Glauco Valdes. All rights reserved.
//

import UIKit

class CategoriesListVC: UIViewController {

     var networkProvider: NetworkManager = NetworkManager()
    
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    private var state: State = .loading {
        didSet {
            switch state {
            case .showTable:
                self.errorView.isHidden = true
                self.tableView.isHidden = false
                self.loadingView.isHidden = true
                self.loadingIndicator.stopAnimating()
                self.tableView.reloadData()
            case .loading:
                self.errorView.isHidden = true
                self.tableView.isHidden = true
                self.loadingView.isHidden = false
                self.loadingIndicator.startAnimating()
                self.requestCategories()
            case .error:
                self.errorView.isHidden = false
                self.tableView.isHidden = true
                self.loadingView.isHidden = true
                self.loadingIndicator.stopAnimating()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 64
        
        self.title = "Categories"
        
        self.state = .loading
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.barTintColor = UIColor.darkGray
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    @IBAction func reloadData(_ sender: Any) {
        self.state = .loading
    }
    
    func requestCategories(){
        networkProvider.getCategories(onResult: {result in
            self.state = .showTable(result)
        }, onError: {error in
            self.state = .error
        })
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
extension CategoriesListVC {
    enum State {
        case loading
        case showTable([Category])
        case error
    }
}

extension CategoriesListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesMovieCell.reuseIdentifier, for: indexPath) as! CategoriesMovieCell
        
        guard case .showTable(let items) = state else { return cell }
        
        cell.setCell(movie: items[indexPath.section].movies[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard case .showTable(let items) = state else { return 0 }
        
        return  items[section].movies.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard case .showTable(let items) = state else { return 0 }
        
        return  items.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO detailView
        
        let storyboard: UIStoryboard = UIStoryboard(name: "CategoriesMovieDetail", bundle: nil)
        let categoriesListVC: CategoriesMovieDetailVC = storyboard.instantiateViewController(withIdentifier: "CategoriesMovieDetailVC") as! CategoriesMovieDetailVC
        guard case .showTable(let items) = state else { return }
        categoriesListVC.setVC(movie: items[indexPath.section].movies[indexPath.row], categoryColor: items[indexPath.section].color)
        
        self.navigationController?.pushViewController(categoriesListVC, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesCategoryCell.reuseIdentifier) as! CategoriesCategoryCell
        
        guard case .showTable(let items) = state else { return cell }
        
        cell.setCell(category: items[section])
        return cell
    }
}
