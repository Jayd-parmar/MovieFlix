//
//  HomeProtocols.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 03/11/23.
//

import Foundation
import UIKit

protocol HomeInteractorInterface {
    var presenter: HomeInteractorToPresenterInterface? {get set}
    func getMovieData(type: EndPointAPIType, enumType: MovieEnum)
}

protocol HomeViewToPresenterInterface {
    var router: HomeRouterInterface? {get set}
    var interactor: HomeInteractorInterface? {get set}
    var view: HomeViewInterface? {get set}
    var genreList: [Genre] {get}
    var numberOfSections: Int? {get}
    func viewDidLoad()
    func headerTitle(index: Int) -> String
    func configureMovieData(index: Int) -> [CustomCVModel]?
    func didTapButton(_ index: Int)
    func setupHeaderConfig()
    func showAllBtnTapped(index: Int)
}

protocol HomeInteractorToPresenterInterface {
    func getMovieSuccess(movie: MovieModel, enumType: MovieEnum)
    func getMovieFailure(error: Error)
}

protocol HomeViewInterface {
    var presenter: HomeViewToPresenterInterface? {get set}
    func movieSuccess()
    func movieFailure(error: Error)
    func setupHeaderConfiguration(lbl: String, voteCount: String, img: String, voteAve: Double)
    func refreshTableData()
}

protocol HomeRouterInterface {
    var view: UINavigationController? {get set}
    var presenter: HomeViewToPresenterInterface? {get set}
    static func createModule() -> UINavigationController
    func navigateToMovies(data: MovieModel?, type: String)
    var movieViewController: UINavigationController? {get set}
}
