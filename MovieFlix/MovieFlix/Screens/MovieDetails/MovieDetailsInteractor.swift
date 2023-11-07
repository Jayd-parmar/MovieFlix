//
//  MovieDetailsInteractor.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 01/11/23.
//

import Foundation

class MovieDetailsInteractor: MovieDetailsInteractorInterface {
    var presenter: MovieDetailsInteractorToPresenterInterface?
    private let movieRepo: CommonRepositoryDelegate
    
    init(movieRepo: CommonRepositoryDelegate = CommonMovieRepository()) {
        self.movieRepo = movieRepo
    }
    
    func getMovieDetails<T: Codable>(modelType: T.Type, type: EndPointAPIType) {
        movieRepo.getMovieData(modelType: modelType, type: type) { [self] response in
            switch response {
            case .success(let movie):
                presenter?.getMovieDetailSuccess(data: movie)
            case .failure(let error):
                presenter?.getMovieDetailFailure(error: error)
            }
        }
    }
}
