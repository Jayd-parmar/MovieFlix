//
//  TVShowInteractor.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 26/10/23.
//

import Foundation

class TVInteractor: TVInteractorInterface {
    var presenter: TVInteractorToPresenterInterface?
    var tvRepo: CommonRepositoryDelegate
    
    init(tvRepo: CommonRepositoryDelegate = CommonMovieRepository(), presenter: TVInteractorToPresenterInterface?) {
        self.tvRepo = tvRepo
        self.presenter = presenter
    }
    
    func getTvShowData(type: EndPointAPIType) {
        tvRepo.getMovieData(modelType: MovieModel.self, type: type) { [self] response in
            switch response {
            case .success(let tvShow):
                presenter?.getPopularTVShowSuccess(data: tvShow)
            case .failure(let error):
                presenter?.getPopularTVShowFailure(error: error)
            }
        }

    }
}
