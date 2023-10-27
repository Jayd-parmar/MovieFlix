//
//  MovieInteractor.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 26/10/23.
//

import Foundation

protocol MovieInteractorInterface {
    var presenter: MoviePresenterInterface? {get set}
    func getMovieData()
}

class MovieInteractor: MovieInteractorInterface {
    var presenter: MoviePresenterInterface?
    private let movieRepo: MovieRepositoryDelegate
    
    init(movieRepo: MovieRepositoryDelegate = MovieRepository()) {
        self.movieRepo = movieRepo
    }
    
    func getMovieData() {
        movieRepo.getMovieData(modelType: MovieModel.self, type: EndPointMovieItems.popularMovie()) { [self] response in
            switch response {
            case .success(let movie):
                presenter?.getPopularMovieSuccess(data: movie)
            case .failure(let error):
                presenter?.getPopularMovieFailure(error: error)
            }
        }

    }
    
}
