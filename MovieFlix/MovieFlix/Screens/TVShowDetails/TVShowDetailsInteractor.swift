//
//  TVShowDetailsInteractor.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 02/11/23.
//

import Foundation

class TVShowDetailsInteractor: TVShowDetailsInteractorInterface {
    var presenter: TVShowdetailsInteractorToPresenterInterface?
    private let tvRepo: CommonRepositoryDelegate
    
    init(tvRepo: CommonRepositoryDelegate = CommonMovieRepository(), presenter: TVShowdetailsInteractorToPresenterInterface?) {
        self.tvRepo = tvRepo
        self.presenter = presenter
    }
    
    func getTVShowDetail<T: Codable>(modelType: T.Type, type: EndPointAPIType) {
        tvRepo.getMovieData(modelType: modelType, type: type) { [self] response in
            switch response {
            case .success(let movie):
                presenter?.getTVShowDetailSuccess(data: movie)
            case .failure(let error):
                presenter?.getTVShowDetailsFailure(error: error)
            }
        }
    }
}
