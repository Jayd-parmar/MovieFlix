//
//  HomeProtocols.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 03/11/23.
//

import Foundation
import UIKit

protocol HomeInteractorInterface {
    var presenter: HomePresenterInterface? {get set}
    func getMovieData(type: EndPointAPIType, enumType: MovieEnum)
}

protocol HomePresenterInterface {
    var router: HomeRouterInterface? {get set}
    var interactor: HomeInteractorInterface? {get set}
    var view: HomeViewInterface? {get set}
    var genreList: [Genre] {get}
    var numberOfSections: Int? {get}
    func viewDidLoad()
    func headerTitle(index: Int) -> String
    func getMovieSuccess(movie: MovieModel, enumType: MovieEnum)
    func getMovieFailure(error: Error)
    func configureMovieData(index: Int) -> [CustomCVModel]?
    func didTapButton(_ index: Int)
    func setupHeaderConfig()
    func showAllBtnTapped(index: Int)
}

protocol HomeViewInterface {
    var presenter: HomePresenterInterface? {get set}
    func movieSuccess()
    func movieFailure(error: Error)
    func setupHeaderConfiguration(lbl: String, voteCount: String, img: String, voteAve: Double)
    func refreshTableData()
}
