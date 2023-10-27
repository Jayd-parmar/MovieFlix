//
//  MoviePresenter.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 26/10/23.
//

import Foundation

protocol MoviePresenterInterface {
    var view: MovieViewInterface? {get set}
    var interactor: MovieInteractorInterface? {get set}
    var router: MovieRouterInterface? {get set}
    func getPopularMovieSuccess(data: MovieModel)
    func getPopularMovieFailure(error: Error)
    var movieList: MovieModel? {get set}
    var getItemCount: Int? { get }
    func getMovieData()
}

class MoviePresenter: MoviePresenterInterface {
    var getItemCount: Int? {
        movieList?.results.count
    }
    var movieList: MovieModel?
    var view: MovieViewInterface?
    var interactor: MovieInteractorInterface?
    var router: MovieRouterInterface?
    
    func getMovieData() {
        interactor?.getMovieData()
    }
    
    func getPopularMovieSuccess(data: MovieModel) {
        self.movieList = data
        view?.popularMovieSuccess()
    }
    
    func getPopularMovieFailure(error: Error) {
        view?.popularMovieFailure(error: error)
    }

}
