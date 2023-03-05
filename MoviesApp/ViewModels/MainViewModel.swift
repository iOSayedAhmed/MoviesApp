//
//  MainViewModel.swift
//  MoviesApp
//
//  Created by iOSayed on 04/03/2023.
//

import Foundation

class MainViewModel {
    var isLoading:Observable<Bool> = Observable(false)
    var cellDataSource:Observable<[Result]> = Observable(nil)
    var moviesTrendings:MoviesTrendingModel?
    
    func numberOfSections() -> Int {
        return 1
    }
    func numberOfRows(in section:Int) -> Int {
        return moviesTrendings?.results.count ?? 0
    }
    
    
    // FetchMoviesTrinding
    
    func FetchMoviesTrending() {
        let url = URL(string: "https://api.themoviedb.org/3/trending/all/week?api_key=641cb501d987f7743ca0b747641c3aa0")
        if isLoading.value ?? true {
            return
        }
        self.isLoading.value = true
        URLSession.shared.request(url:url , expecting: MoviesTrendingModel.self) {[weak self] result in
            self?.isLoading.value = false
            switch result {
            case .success(let data):
                print(data)
                self?.moviesTrendings = data
                self?.mapCellData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func mapCellData(){
        self.cellDataSource.value = self.moviesTrendings?.results ?? []
    }
    
    func getMovieTitle(_ movie:Result)-> String {
        return movie.title ?? movie.name ?? ""
    }
}
