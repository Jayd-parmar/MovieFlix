//
//  HomePresenter.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 25/10/23.
//

import UIKit
import Foundation

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
//    func filterGenre(_ index: Int)
    func genreCollectionCellForItemAt(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
}

class HomePresenter: HomePresenterInterface, GenreCollectionDelegate {
    
    var responseList: [ResponseModel] = []
    var filteredList: [ResponseModel] = []
    var movieList: [MovieModel]? = []
    var router: HomeRouterInterface?
    var interactor: HomeInteractorInterface?
    var view: HomeViewInterface?
    var popularMovieList: MovieModel?
    var headerTitle = ["Popular", "In Theaters", "Upcoming", "Top Rated"]
    var genreList = [Genre(id: 1, name: "All"), Genre(id: 28, name: "Action"), Genre(id: 35, name: "Comedy"), Genre(id: 80, name: "Crime"), Genre(id: 27, name: "Horror")]
    func viewDidLoad() {
        getMovieList(enumType: .popular)
        getMovieList(enumType: .nowplaying)
        getMovieList(enumType: .upcoming)
        getMovieList(enumType: .toprated)
    }
    
    func getMovieList(enumType: MovieEnum) {
        switch enumType {
        case .popular:
            interactor?.getMovieData(type: EndPointMovieItems.popularMovie(), enumType: enumType)
        case .nowplaying:
            interactor?.getMovieData(type: EndPointMovieItems.nowPlayingMovie(), enumType: enumType)
        case .toprated:
            interactor?.getMovieData(type: EndPointMovieItems.topRatedMovie(), enumType: enumType)
        case .upcoming:
            interactor?.getMovieData(type: EndPointMovieItems.upcomingMovie(), enumType: enumType)
        }
    }
    
    func getMovieSuccess(movie: MovieModel, enumType: MovieEnum) {
        responseList.append(ResponseModel(enumType: enumType, data: movie))
        filteredList.append(ResponseModel(enumType: enumType, data: movie))
        view?.movieSuccess()
        if enumType == .popular {
            setupHeaderConfig()
        }
    }
    
    func getMovieFailure(error: Error) {
        view?.movieFailure(error: error)
    }
    
    func numberOfSections() -> Int {
        return filteredList.count
    }
    
    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.tableViewIdentifier, for: indexPath) as? MovieTableViewCell
        cell?.collectionViewContainer.collectionView.tag = indexPath.section
        let data = filteredList[indexPath.section].data
        var convertModel: [CustomCVModel] = []
        data.results.forEach({ item in
            let model = CustomCVModel(imagePath: item.posterPath, title: item.originalTitle ?? "")
            convertModel.append(model)
        })
        cell?.collectionViewContainer.configContent(list: convertModel)
        cell?.collectionViewContainer.collectionView.reloadData()
        return cell ?? UITableViewCell()
    }
    
    func setupHeaderConfig() {
        let randomNumber =  Int.random(in: 0...19)
        view?.setupHeaderConfiguration(
            lbl: responseList[0].data.results[randomNumber].originalTitle ?? "",
            voteCount: "\(String(describing: responseList[0].data.results[randomNumber].voteCount)) Votes",
            img: Constant.URL.imgBaseUrl + (responseList[0].data.results[randomNumber].backdropPath ?? ""),
            voteAve: responseList[0].data.results[randomNumber].voteAverage)
    }
    
    func genreCollectionCellForItemAt(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.collectionViewIdentifier, for: indexPath) as? GenreCVCell
        cell?.delegate = self
        cell?.btnGenre.tag = indexPath.row
        cell?.configContent(genreList[indexPath.row])
        return cell ?? UICollectionViewCell()
    }

    func didTapButton(_ index: Int) {
        if index != 0 {
            let genreId = genreList[index].id
            filteredList.removeAll()
            responseList.forEach { item in
                var data = item.data
                let genreIds = data.results.filter { $0.genreIds.contains(genreId) }
                data.results = genreIds
                filteredList.append(ResponseModel(enumType: item.enumType, data: data))
            }
        } else {
            filteredList = responseList
        }
        view?.refreshTableData()
    }
}
