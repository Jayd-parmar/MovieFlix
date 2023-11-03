//
//  CastDetailsInteractor.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 03/11/23.
//

import Foundation

protocol CastDetailsInteractorInterface {
    var presenter: CastDetailsPresenterInterface? {get set}
    func getCastDetails(id: Int)
    func getCastImages(id: Int)
    func getCastCombine(id: Int)
}

class CastDetailsInteractor: CastDetailsInteractorInterface {
    var presenter: CastDetailsPresenterInterface?
    private let castRepo: CastRepositoryDelegate
    
    init(castRepo: CastRepositoryDelegate = CastRepository()) {
        self.castRepo = castRepo
    }
    
    func getCastDetails(id: Int) {
        castRepo.getCastData(modelType: CastDetailsModel.self, type: EndPointCastItems.castDetails(id: id)) { [self] response in
            switch response {
            case .success(let cast):
                presenter?.getCastDetailsSuccess(data: cast)
            case .failure(let error):
                presenter?.getCastDetailsFailure(error: error)
            }
        }
    }
    
    func getCastImages(id: Int) {
        castRepo.getCastData(modelType: CastImageModel.self, type: EndPointCastItems.castImages(id: id)) { [self] response in
            switch response {
            case .success(let cast):
                presenter?.getCastImagesSuccess(data: cast)
            case .failure(let error):
                presenter?.getCastImagesFailure(error: error)
            }
        }
    }
    
    func getCastCombine(id: Int) {
        castRepo.getCastData(modelType: CastMovieTVModel.self, type: EndPointCastItems.castCombine(id: id)) { [self] response in
            switch response {
            case .success(let cast):
                presenter?.getCastCombineSuccess(data: cast)
            case .failure(let error):
                presenter?.getCastCombineFailure(error: error)
            }
        }
    }
}
