//
//  CastDetailsPresenter.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 03/11/23.
//

import Foundation

class CastDetailsPresenter: CastDetailsViewToPresenterInterface {
    var view: CastDetailsViewInterface?
    var interactor: CastDetailsInteractorInterface?
    var router: CastDetailsRouterInterface?
    var castId: Int?
    var castDetails: CastDetailsModel?
    var castImages: CastImageModel?
    var castCombine: CastMovieTVModel?
    var error: Error?
    init(castId: Int?) {
        self.castId = castId
    }
    
    func viewDidLoad() {
        guard let castId = castId else { return }
        interactor?.getCastDetail(modelType: CastDetailsModel.self, type: EndPointCastItems.castDetails(id: castId))
        interactor?.getCastDetail(modelType: CastImageModel.self, type: EndPointCastItems.castImages(id: castId))
        interactor?.getCastDetail(modelType: CastMovieTVModel.self, type: EndPointCastItems.castCombine(id: castId))
    }
}

extension CastDetailsPresenter: CastDetailsInteractorToPresenterInterface {
    func getCastDetailsSuccess<T: Codable>(data: T) {
        switch data {
        case is CastDetailsModel:
            guard let data = data as? CastDetailsModel else { return }
            self.castDetails = data
            view?.getCastDetailsSuccess(data: data)
        case is CastImageModel:
            guard let data = data as? CastImageModel else { return }
            self.castImages = data
            let result = data.profiles.compactMap({ CustomCVModel(imagePath: $0.filePath, title: "") })
            view?.getCastImagesSuccess(data: result)
        case is CastMovieTVModel:
            guard let data = data as? CastMovieTVModel else { return }
            self.castCombine = data
            let result = data.cast.compactMap({ CustomCVModel(imagePath: $0.posterPath ?? "", title: $0.originalTitle ?? "") })
            view?.getCastCombineSuccess(data: result)
        default:
            break
        }
    }
    
    func getCastDetailsFailure(error: Error) {
        self.error = error
        view?.getCastDetailsFailure(error: error)
    }
}
