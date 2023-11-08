//
//  HomeInteractor.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 25/10/23.
//

import Foundation

class HomeInteractor: HomeInteractorInterface {
    var presenter: HomeInteractorToPresenterInterface?
    private let movieRepo: CommonRepositoryDelegate
    
    init(movieRepo: CommonRepositoryDelegate = CommonMovieRepository(), presenter: HomeInteractorToPresenterInterface?) {
        self.movieRepo = movieRepo
        self.presenter = presenter
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
