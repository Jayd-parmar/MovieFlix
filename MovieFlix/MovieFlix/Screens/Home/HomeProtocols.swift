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
    var responseList: [ResponseModel] {get set}
    var filteredList: [ResponseModel] {get set}
    var headerTitle: [String] {get set}
    var genreList: [Genre] {get}
    func viewDidLoad()
    func getMovieList(enumType: MovieEnum)
    func getMovieSuccess(movie: MovieModel, enumType: MovieEnum)
    func getMovieFailure(error: Error)
    func numberOfSections() -> Int
    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    func setupHeaderConfig()
    func genreCollectionCellForItemAt(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
    func showAllBtnTapped(index: Int)
}

protocol HomeViewInterface {
    var presenter: HomePresenterInterface? {get set}
    func movieSuccess()
    func movieFailure(error: Error)
    func setupHeaderConfiguration(lbl: String, voteCount: String, img: String, voteAve: Double)
    func refreshTableData()
}
