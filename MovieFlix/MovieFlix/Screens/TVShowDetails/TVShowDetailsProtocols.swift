//
//  TVShowDetailsProtocols.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 03/11/23.
//

import Foundation
import UIKit

protocol TVShowDetailsViewInterface {
    var presenter: TVShowDetailsViewtoPresenterInterface? {get set}
    func getTVShowDetailsSuccess(data: CommonMovieTVDetailsModel)
    func getTVShowDetailFailure(error: Error)
    func getCastSuccess(data: [CustomCVModel])
    func getVideoSuccess(data: [String])
}

protocol TVShowDetailsInteractorInterface {
    var presenter: TVShowdetailsInteractorToPresenterInterface? {get set}
    func getTVShowDetail<T: Codable>(modelType: T.Type, type: EndPointAPIType)
}

protocol TVShowDetailsViewtoPresenterInterface {
    var view: TVShowDetailsViewInterface? {get set}
    var interactor: TVShowDetailsInteractorInterface? {get set}
    var router: TVShowDetailsRouterInterface? {get set}
    var castList: CastListModel? {get set}
    func viewDidLoad()
    func navigateToCastDetails(indexPath: IndexPath)
}

protocol TVShowdetailsInteractorToPresenterInterface {
    func getTVShowDetailSuccess<T: Codable>(data: T)
    func getTVShowDetailsFailure(error: Error)
}

protocol TVShowDetailsRouterInterface {
    var presenter: TVShowDetailsViewtoPresenterInterface? {get set}
    var view: UIViewController? {get set}
    static func createModule(tvShowId: Int?) -> UIViewController
    func navigateToCastDetails(castId: Int?)
}
