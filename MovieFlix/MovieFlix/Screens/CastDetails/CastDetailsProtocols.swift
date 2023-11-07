//
//  CastDetailsProtocols.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 03/11/23.
//

import Foundation
import UIKit

protocol CastDetailsViewInterface {
    var presenter: CastDetailsViewToPresenterInterface? {get set}
    func getCastDetailsSuccess(data: CastDetailsModel)
    func getCastDetailsFailure(error: Error)
    func getCastImagesSuccess(data: [CustomCVModel])
    func getCastImagesFailure(error: Error)
    func getCastCombineSuccess(data: [CustomCVModel])
    func getCastCombineFailure(error: Error)
}

protocol CastDetailsInteractorInterface {
    var presenter: CastDetailsInteractorToPresenterInterface? {get set}
    func getCastDetails(id: Int)
    func getCastImages(id: Int)
    func getCastCombine(id: Int)
}

protocol CastDetailsViewToPresenterInterface {
    var view: CastDetailsViewInterface? {get set}
    var interactor: CastDetailsInteractorInterface? {get set}
    var router: CastDetailsRouterInterface? {get set}
    func viewDidLoad()
}

protocol CastDetailsInteractorToPresenterInterface {
    func getCastDetailsSuccess(data: CastDetailsModel)
    func getCastDetailsFailure(error: Error)
    func getCastImagesSuccess(data: CastImageModel)
    func getCastImagesFailure(error: Error)
    func getCastCombineSuccess(data: CastMovieTVModel)
    func getCastCombineFailure(error: Error)
}

protocol CastDetailsRouterInterface {
    var presenter: CastDetailsViewToPresenterInterface? {get set}
    var view: UIViewController? {get set}
    static func createModule(castId: Int?) -> UIViewController
}
