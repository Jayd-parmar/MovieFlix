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
    func getTVShowDetailsFailure(error: Error)
    func getCastSuccess(data: [CustomCVModel])
    func getCastFailure(error: Error)
    func getVideoSuccess(data: [String])
    func getVideoFailure(error: Error)
}

protocol TVShowDetailsInteractorInterface {
    var presenter: TVShowdetailsInteractorToPresenterInterface? {get set}
    func getTvShowDetails(id: Int)
    func getTvShowCastDetails(id: Int)
    func getTvShowVideo(id: Int)
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
    func getTVShowDetailsSuccess(data: TVShowDetailsModel)
    func getTVShowDetailsFailure(error: Error)
    func getCastSuccess(data: CastListModel)
    func getCastFailure(error: Error)
    func getVideoSuccess(data: VideoModel)
    func getVideoFailure(error: Error)
}

protocol TVShowDetailsRouterInterface {
    var presenter: TVShowDetailsViewtoPresenterInterface? {get set}
    var view: UIViewController? {get set}
    static func createModule(tvShowId: Int?) -> UIViewController
    func navigateToCastDetails(castId: Int?)
}
