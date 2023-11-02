//
//  MovieDetailsInteractor.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 01/11/23.
//

import Foundation

protocol MovieDetailsInteractorInterface {
    var presenter: MovieDetailsPresenterInterface? {get set}
    func getMovieDetails(id: Int)
    func getMovieCastDetails(id: Int)
}

class MovieDetailsInteractor: MovieDetailsInteractorInterface {
    var presenter: MovieDetailsPresenterInterface?
    
    private let movieRepo: MovieRepositoryDelegate
    private let castRepo: CastRepositoryDelegate
    
    init(movieRepo: MovieRepositoryDelegate = MovieRepository(), castRepo: CastRepositoryDelegate = CastRepository()) {
        self.movieRepo = movieRepo
        self.castRepo = castRepo
    }
    
    func getMovieDetails(id: Int) {
        movieRepo.getMovieData(modelType: MovieDetailsModel.self, type: EndPointMovieItems.movieDetails(id: id)) { [self] response in
            switch response {
            case .success(let movie):
                presenter?.getMovieDetailsSuccess(data: movie)
            case .failure(let error):
                presenter?.getMovieDetailsFailure(error: error)
            }
        }
    }
    
    func getMovieCastDetails(id: Int) {
        castRepo.getCastData(modelType: CastListModel.self, type: EndPointCastItems.movieCastList(id: id)) {
            [self] response in
            switch response {
            case .success(let cast):
                presenter?.getCastSuccess(data: cast)
            case .failure(let error):
                presenter?.getCastFailure(error: error)
            }
        }
    }
}
