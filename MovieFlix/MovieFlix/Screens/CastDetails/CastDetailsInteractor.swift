//
//  CastDetailsInteractor.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 03/11/23.
//

import Foundation

class CastDetailsInteractor: CastDetailsInteractorInterface {
    var presenter: CastDetailsInteractorToPresenterInterface?
    private let castRepo: CommonRepositoryDelegate
    
    init(castRepo: CommonRepositoryDelegate = CommonMovieRepository(), presenter: CastDetailsInteractorToPresenterInterface?) {
        self.castRepo = castRepo
        self.presenter = presenter
    }
    
    func getCastDetail<T: Codable>(modelType: T.Type, type: EndPointAPIType) {
        castRepo.getMovieData(modelType: modelType, type: type) { [self] response in
            switch response {
            case .success(let movie):
                presenter?.getCastDetailsSuccess(data: movie)
            case .failure(let error):
                presenter?.getCastDetailsFailure(error: error)
            }
        }
    }
}
