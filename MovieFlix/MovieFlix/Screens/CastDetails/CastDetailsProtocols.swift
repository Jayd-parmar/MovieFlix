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
    func getCastImagesSuccess(data: [CustomCVModel])
    func getCastCombineSuccess(data: [CustomCVModel])
    func getCastDetailsFailure(error: Error)
}

protocol CastDetailsInteractorInterface {
    var presenter: CastDetailsInteractorToPresenterInterface? {get set}
    func getCastDetail<T: Codable>(modelType: T.Type, type: EndPointAPIType)
}

protocol CastDetailsViewToPresenterInterface {
    var view: CastDetailsViewInterface? {get set}
    var interactor: CastDetailsInteractorInterface? {get set}
    var router: CastDetailsRouterInterface? {get set}
    func viewDidLoad()
}

protocol CastDetailsInteractorToPresenterInterface {
    func getCastDetailsSuccess<T: Codable>(data: T)
    func getCastDetailsFailure(error: Error)
}

protocol CastDetailsRouterInterface {
    var presenter: CastDetailsViewToPresenterInterface? {get set}
    var view: UIViewController? {get set}
    static func createModule(castId: Int?) -> UIViewController
}
