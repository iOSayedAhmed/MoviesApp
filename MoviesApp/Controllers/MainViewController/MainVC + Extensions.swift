//
//  MainVC + Extensions.swift
//  MoviesApp
//
//  Created by iOSayed on 04/03/2023.
//

import Foundation
import UIKit
 
extension MainVC : UITableViewDelegate , UITableViewDataSource {
    
    func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = .clear
        
        registerCells()
    }
    
    func registerCells(){
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func reloadTableView(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewaModel.numberOfSections()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewaModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let movie = Movies[indexPath.row]
        cell.textLabel?.text = viewaModel.getMovieTitle(movie)
        return cell
    }
    
    
}
