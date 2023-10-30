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
    var movieList: [MovieModel]? {get set}
    var popularMovieList: MovieModel? {get set}
    var headerTitle: [String] {get set}
    func getMovieList(enumType: MovieEnum)
    func getMovieSuccess(movie: MovieModel)
    func getMovieFailure(error: Error)
}

class HomePresenter: HomePresenterInterface {
    var movieList: [MovieModel]? = []
    var router: HomeRouterInterface?
    var interactor: HomeInteractorInterface?
    var view: HomeViewInterface?
    var popularMovieList: MovieModel?
    
    var headerTitle = ["Popular", "In Theaters", "Upcoming", "Top Rated"]
    
    func getMovieList(enumType: MovieEnum) {
        switch enumType {
        case .popular:
            interactor?.getMovieData(type: EndPointMovieItems.popularMovie())
        case .nowplaying:
            interactor?.getMovieData(type: EndPointMovieItems.nowPlayingMovie())
        case .toprated:
            interactor?.getMovieData(type: EndPointMovieItems.topRatedMovie())
        case .upcoming:
            interactor?.getMovieData(type: EndPointMovieItems.upcomingMovie())
        }
    }
    
    func getMovieSuccess(movie: MovieModel) {
        self.popularMovieList = movie
        movieList?.append(movie)
        view?.movieSuccess()
    }
    
    func getMovieFailure(error: Error) {
        view?.movieFailure(error: error)
    }
}
