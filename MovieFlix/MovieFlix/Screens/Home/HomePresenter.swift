//
//  HomePresenter.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 25/10/23.
//

import Foundation

protocol HomePresenterInterface {
    var router: HomeRouterInterface? {get set}
    var interactor: HomeInteractorInterface? {get set}
    var view: HomeViewInterface? {get set}
    var popularMovieList: MovieModel? {get set}
    var headerTitle: [String] {get set}
    func getPopularMovieList()
    func getPopularMovieSuccess(movie: MovieModel)
    func getPopularMovieFailure(error: Error)
}

class HomePresenter: HomePresenterInterface {
    
    var router: HomeRouterInterface?
    var interactor: HomeInteractorInterface?
    var view: HomeViewInterface?
    var popularMovieList: MovieModel?
    
    var headerTitle = ["Popular", "In Theaters", "Upcoming", "Top Rated"]
    
    func getPopularMovieList() {
        interactor?.getPopularMovieData()
    }
    
    func getPopularMovieSuccess(movie: MovieModel) {
        self.popularMovieList = movie
        view?.popularMovieSuccess()
    }
    
    func getPopularMovieFailure(error: Error) {
        view?.popularMovieFailure(error: error)
    }
}
