//
//  MoviesProtocol.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 03/11/23.
//

import Foundation
import UIKit

protocol MovieViewInterface {
    var presenter: MovieViewToPresenterInterface? {get set}
    func popularMovieSuccess(list: [CustomCVModel])
    func popularMovieFailure(error: Error)
}

protocol MovieInteractorInterface {
    var presenter: MovieInteractorToPresenterInterface? {get set}
    func getMovieData()
}

protocol MovieViewToPresenterInterface {
    var view: MovieViewInterface? {get set}
    var interactor: MovieInteractorInterface? {get set}
    var router: MovieRouterInterface? {get set}
    var movieList: MovieModel? {get set}
    func viewDidLoad()
    func navigateToDetails(indexPath: IndexPath)
    func configureMovies(data: MovieModel?, type: String)
}

protocol MovieInteractorToPresenterInterface {
    func getPopularMovieSuccess(data: MovieModel)
    func getPopularMovieFailure(error: Error)
}

protocol MovieRouterInterface {
    var view: UINavigationController? {get set}
    var presenter: MovieViewToPresenterInterface? {get set}
    static func createModule() -> UINavigationController
    func navigateToMovieDetails(movieId: Int?)
}
