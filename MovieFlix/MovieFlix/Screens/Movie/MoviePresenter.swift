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
    func navigateToDetails(indexPath: IndexPath)
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
        let result = data.results.compactMap({ CustomCVModel(imagePath: $0.posterPath, title: $0.originalTitle ?? "" ) })
        view?.popularMovieSuccess(list: result)
    }
    
    func getPopularMovieFailure(error: Error) {
        view?.popularMovieFailure(error: error)
    }
    
    func navigateToDetails(indexPath: IndexPath) {
        let movieId = movieList?.results[indexPath.row].id
        router?.navigateToMovieDetails(movieId: movieId)
    }

}
