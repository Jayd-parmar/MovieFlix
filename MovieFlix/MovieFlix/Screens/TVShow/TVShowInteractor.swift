//
//  TVShowInteractor.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 26/10/23.
//

import Foundation

class TVInteractor: TVInteractorInterface {
    var presenter: TVPresenterInterface?
    var tvRepo: CommonRepositoryDelegate
    
    init(tvRepo: CommonRepositoryDelegate = CommonMovieRepository()) {
        self.tvRepo = tvRepo
    }
    
    func getTvShowData() {
        tvRepo.getMovieData(modelType: MovieModel.self, type: EndPointTVShowItems.popularTVShow()) { [self] response in
            switch response {
            case .success(let tvShow):
                presenter?.getPopularTVShowSuccess(data: tvShow)
            case .failure(let error):
                presenter?.getPopularTVShowFailure(error: error)
            }
        }

    }
}
