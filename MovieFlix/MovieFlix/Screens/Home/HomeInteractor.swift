//
//  HomeInteractor.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 25/10/23.
//

import Foundation

class HomeInteractor: HomeInteractorInterface {
    var presenter: HomePresenterInterface?
    private let movieRepo: MovieRepositoryDelegate
    
    init(movieRepo: MovieRepositoryDelegate = MovieRepository()) {
        self.movieRepo = movieRepo
    }
    
    func getMovieData(type: EndPointAPIType, enumType: MovieEnum) {
        movieRepo.getMovieData(modelType: MovieModel.self, type: type) { [self] response in
            switch response {
            case .success(let movie):
                presenter?.getMovieSuccess(movie: movie, enumType: enumType)
            case .failure(let error):
                presenter?.getMovieFailure(error: error)
            }
        }
    }
}
