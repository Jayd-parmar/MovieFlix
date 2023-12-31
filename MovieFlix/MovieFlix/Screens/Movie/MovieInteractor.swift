//
//  MovieInteractor.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 26/10/23.
//

import Foundation

class MovieInteractor: MovieInteractorInterface {
    var presenter: MovieInteractorToPresenterInterface?
    private let movieRepo: CommonRepositoryDelegate
    
    init(movieRepo: CommonRepositoryDelegate = CommonMovieRepository(), presenter: MovieInteractorToPresenterInterface?) {
        self.movieRepo = movieRepo
        self.presenter = presenter
    }
    
    func getMovieData(type: EndPointAPIType) {
        movieRepo.getMovieData(modelType: MovieModel.self, type: type) { [self] response in
            switch response {
            case .success(let movie):
                presenter?.getPopularMovieSuccess(data: movie)
            case .failure(let error):
                presenter?.getPopularMovieFailure(error: error)
            }
        }

    }
    
}
