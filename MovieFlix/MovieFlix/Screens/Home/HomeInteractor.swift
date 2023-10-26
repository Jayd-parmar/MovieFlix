//
//  HomeInteractor.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 25/10/23.
//

import Foundation

protocol HomeInteractorInterface {
    var presenter: HomePresenterInterface? {get set}
    func getPopularMovieData()
}

class HomeInteractor: HomeInteractorInterface {
    var presenter: HomePresenterInterface?
    private let movieRepo: MovieRepositoryDelegate
    
    init(movieRepo: MovieRepositoryDelegate = MovieRepository()) {
        self.movieRepo = movieRepo
    }
    
    func getPopularMovieData() {
        movieRepo.getMovieData(modelType: MovieModel.self, type: EndPointMovieItems.popularMovie()) { [self] response in
            switch response {
            case .success(let movie):
                presenter?.getPopularMovieSuccess(movie: movie)
            case .failure(let error):
                presenter?.getPopularMovieFailure(error: error)
            }
        }
    }
}
