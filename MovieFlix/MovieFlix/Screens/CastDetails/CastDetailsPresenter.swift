//
//  CastDetailsPresenter.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 03/11/23.
//

import Foundation

protocol CastDetailsPresenterInterface {
    var view: CastDetailsViewInterface? {get set}
    var interactor: CastDetailsInteractorInterface? {get set}
    var router: CastDetailsRouterInterface? {get set}
    func getCastDetailsSuccess(data: CastDetailsModel)
    func getCastDetailsFailure(error: Error)
    func getCastImagesSuccess(data: CastImageModel)
    func getCastImagesFailure(error: Error)
    func getCastCombineSuccess(data: CastMovieTVModel)
    func getCastCombineFailure(error: Error)
    func viewDidLoad()
}

class CastDetailsPresenter: CastDetailsPresenterInterface {
    var view: CastDetailsViewInterface?
    var interactor: CastDetailsInteractorInterface?
    var router: CastDetailsRouterInterface?
    var castId: Int?
    
    init(castId: Int?) {
        self.castId = castId
    }
    
    func viewDidLoad() {
        interactor?.getCastDetails(id: castId ?? 500)
        interactor?.getCastImages(id: castId ?? 500)
        interactor?.getCastCombine(id: castId ?? 500)
    }
    
    func getCastDetailsSuccess(data: CastDetailsModel) {
        view?.getCastDetailsSuccess(data: data)
    }
    
    func getCastDetailsFailure(error: Error) {
        view?.getCastDetailsFailure(error: error)
    }
    
    func getCastImagesSuccess(data: CastImageModel) {
        let result = data.profiles.compactMap({ CustomCVModel(imagePath: $0.filePath, title: "") })
        view?.getCastImagesSuccess(data: result)
    }
    
    func getCastImagesFailure(error: Error) {
        view?.getCastImagesFailure(error: error)
    }
    
    func getCastCombineSuccess(data: CastMovieTVModel) {
        let result = data.cast.compactMap({ CustomCVModel(imagePath: $0.posterPath ?? "", title: $0.originalTitle ?? "") })
        view?.getCastCombineSuccess(data: result)
    }
    
    func getCastCombineFailure(error: Error) {
        view?.getCastCombineFailure(error: error)
    }
    
}
