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
    func viewDidLoad()
}

class MoviePresenter: MoviePresenterInterface {
    var movieList: MovieModel?
    var view: MovieViewInterface?
    var interactor: MovieInteractorInterface?
    var router: MovieRouterInterface?
    
    func viewDidLoad() {
        interactor?.getMovieData()
    }
    
    func getPopularMovieSuccess(data: MovieModel) {
        self.movieList = data
        view?.popularMovieSuccess(list: data)
    }
    
    func getPopularMovieFailure(error: Error) {
        view?.popularMovieFailure(error: error)
    }

}
