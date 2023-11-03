//
//  TVShowPresenter.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 26/10/23.
//

import Foundation

class TVPresenter: TVPresenterInterface {
    
    var view: TVViewInterface?
    var interactor: TVInteractorInterface?
    var router: TVRouterInterface?
    var tvShowList: MovieModel?
    
    func viewDidLoad() {
        interactor?.getTvShowData()
    }
    
    func getPopularTVShowSuccess(data: MovieModel) {
        self.tvShowList = data
        let result = data.results.compactMap({ CustomCVModel(imagePath: $0.posterPath, title: $0.originalName ?? "" ) })
        view?.getPopularTVShowSuccess(list: result)
    }
    
    func getPopularTVShowFailure(error: Error) {
        view?.getPopularTVShowFailure(error: error)
    }
    
    func navigateToTvShowDetails(indexPath: IndexPath) {
        let tvShowId = tvShowList?.results[indexPath.row].id
        router?.navigateToTvShowDetails(tvShowId: tvShowId)
    }
}
