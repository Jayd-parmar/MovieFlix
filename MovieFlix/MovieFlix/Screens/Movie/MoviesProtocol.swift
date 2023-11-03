//
//  MoviesProtocol.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 03/11/23.
//

import Foundation
import UIKit

protocol MovieViewInterface {
    var presenter: MoviePresenterInterface? {get set}
    func popularMovieSuccess(list: [CustomCVModel])
    func popularMovieFailure(error: Error)
}

protocol MovieInteractorInterface {
    var presenter: MoviePresenterInterface? {get set}
    func getMovieData()
}

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

protocol MovieRouterInterface {
    var view: UINavigationController? {get set}
    var presenter: MoviePresenterInterface? {get set}
    static func createModule() -> UINavigationController
    func navigateToMovieDetails(movieId: Int?)
}
