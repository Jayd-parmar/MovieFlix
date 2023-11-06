//
//  HomePresenter.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 25/10/23.
//

import Foundation

class HomePresenter: HomePresenterInterface, GenreCollectionDelegate {
    var router: HomeRouterInterface?
    var interactor: HomeInteractorInterface?
    var view: HomeViewInterface?
    var responseList: [ResponseModel] = []
    var filteredList: [ResponseModel] = []
    var movieList: [MovieModel]? = []
    var popularMovieList: MovieModel?
    var headerTitle = HeaderTitle.headerTitles
    var genreList = GenreList.genres
    var numberOfSections: Int? {
            return filteredList.count
    }
    
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
    
    func configureMovieData(index: Int) -> [CustomCVModel]? {
        var convertModel: [CustomCVModel] = []
        let data = filteredList[index].data
        data.results.forEach({ item in
            let model = CustomCVModel(imagePath: item.posterPath, title: item.originalTitle ?? "")
            convertModel.append(model)
        })
        return convertModel
    }
    
    func setupHeaderConfig() {
        let randomNumber =  Int.random(in: 0...19)
        view?.setupHeaderConfiguration(
            lbl: responseList[0].data.results[randomNumber].originalTitle ?? "",
            voteCount: "\(String(describing: responseList[0].data.results[randomNumber].voteCount)) Votes",
            img: Constant.URL.imgBaseUrl + (responseList[0].data.results[randomNumber].backdropPath ?? ""),
            voteAve: responseList[0].data.results[randomNumber].voteAverage)
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
    
    func showAllBtnTapped(index: Int) {
        var data: MovieModel?
        var type: String = "Movies"
        switch index {
        case 0:
            data = responseList[index].data
            type = "Popular"
        case 1:
            data = responseList[index].data
            type = "In Theaters"
        case 2:
            data = responseList[index].data
            type = "Upcoming"
        case 3:
            data = responseList[index].data
            type = "Top Rated"
        default:
            break
        }
        router?.navigateToMovies(data: data, type: type)
    }
}
