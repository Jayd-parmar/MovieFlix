//
//  TVShowDetailsInteractor.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 02/11/23.
//

import Foundation

protocol TVShowDetailsInteractorInterface {
    var presenter: TVShowDetailsPresenterInterface? {get set}
    func getTvShowDetails(id: Int)
    func getTvShowCastDetails(id: Int)
}

class TVShowDetailsInteractor: TVShowDetailsInteractorInterface {
    var presenter: TVShowDetailsPresenterInterface?
    private let tvRepo: TVRepositoryDelegate
    private let castRepo: CastRepositoryDelegate
    
    init(tvRepo: TVRepositoryDelegate = TVRepository(), castRepo: CastRepositoryDelegate = CastRepository()) {
        self.tvRepo = tvRepo
        self.castRepo = castRepo
    }
    
    func getTvShowDetails(id: Int) {
        tvRepo.getTvShowData(modelType: TVShowDetailsModel.self, type: EndPointTVShowItems.tvShowDetails(id: id)) { [self] response in
            switch response {
            case .success(let tv):
                presenter?.getTVShowDetailsSuccess(data: tv)
            case .failure(let error):
                presenter?.getTVShowDetailsFailure(error: error)
            }
        }
    }
    
    func getTvShowCastDetails(id: Int) {
        castRepo.getCastData(modelType: CastListModel.self, type: EndPointCastItems.tvShowCastList(id: id)) { [self] response in
            switch response {
            case .success(let cast):
                presenter?.getCastSuccess(data: cast)
            case .failure(let error):
                presenter?.getCastFailure(error: error)
            }
        }
    }
}