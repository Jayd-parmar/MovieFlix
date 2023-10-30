//
//  TVShowInteractor.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 26/10/23.
//

import Foundation

protocol TVInteractorInterface {
    var presenter: TVPresenterInterface? {get set}
    func getTvShowData()
}

class TVInteractor: TVInteractorInterface {
    var presenter: TVPresenterInterface?
    var tvRepo: TVRepositoryDelegate
    
    init(tvRepo: TVRepositoryDelegate = TVRepository()) {
        self.tvRepo = tvRepo
    }
    
    func getTvShowData() {
        tvRepo.getTvShowData(modelType: MovieModel.self, type: EndPointTVShowItems.popularTVShow()) { [self] response in
            switch response {
            case .success(let tvShow):
                presenter?.getPopularTVShowSuccess(data: tvShow)
            case .failure(let error):
                presenter?.getPopularTVShowFailure(error: error)
            }
        }

    }
}
