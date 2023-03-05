//
//  MainVC.swift
//  MoviesApp
//
//  Created by iOSayed on 04/03/2023.
//

import UIKit

class MainVC: UIViewController {

    //IBOutlets:
    
    @IBOutlet  weak var tableView: UITableView!
    @IBOutlet weak var ActivityIndicator: UIActivityIndicatorView!
    
    //Variables:
    var Movies = [Result]()
    
    //ViewModel:
    let viewaModel: MainViewModel = MainViewModel()
    
    //MARK: - View Controller LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configMainVC()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewaModel.FetchMoviesTrending()
       
    }
    
    
    private func configMainVC(){
        self.title = "Main View"
        setupTableView()
    }
    
    private func bindViewModel(){
        viewaModel.isLoading.bind { [weak self] isLoading in
            guard let self = self , let isLoading = isLoading else{return}
            DispatchQueue.main.async {
                isLoading ? self.ActivityIndicator.startAnimating() : self.ActivityIndicator.stopAnimating()
            }
        }
        
        viewaModel.cellDataSource.bind { [weak self] movie in
            guard let self = self , let movie = movie else{return}
            self.Movies = movie
            self.reloadTableView()
        }
    }
}
