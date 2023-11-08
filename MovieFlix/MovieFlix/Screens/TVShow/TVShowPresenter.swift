//
//  TVShowPresenter.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 26/10/23.
//

import Foundation

class TVPresenter: TVViewtoPresenterInterface {
    
    var view: TVViewInterface?
    var interactor: TVInteractorInterface?
    var router: TVRouterInterface?
    var tvShowList: MovieModel?
    var error: Error?
    
    func viewDidLoad() {
        interactor?.getTvShowData(type: EndPointTVShowItems.popularTVShow(page: 1))
    }
    
    func navigateToTvShowDetails(indexPath: IndexPath) {
        let tvShowId = tvShowList?.results[indexPath.row].id
        router?.navigateToTvShowDetails(tvShowId: tvShowId)
    }
}

extension TVPresenter: TVInteractorToPresenterInterface {
    func getPopularTVShowSuccess(data: MovieModel) {
        self.tvShowList = data
        let result = data.results.compactMap({ CustomCVModel(imagePath: $0.posterPath, title: $0.originalName ?? "" ) })
        view?.getPopularTVShowSuccess(list: result)
    }
    
    func getPopularTVShowFailure(error: Error) {
        self.error = error
        view?.getPopularTVShowFailure(error: error)
    }
}
