//
//  TVShowProtocols.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 03/11/23.
//

import Foundation
import UIKit

protocol TVViewInterface {
    var presenter: TVPresenterInterface? {get set}
    func getPopularTVShowSuccess(list: [CustomCVModel])
    func getPopularTVShowFailure(error: Error)
}

protocol TVInteractorInterface {
    var presenter: TVPresenterInterface? {get set}
    func getTvShowData()
}

protocol TVPresenterInterface {
    var view: TVViewInterface? {get set}
    var interactor: TVInteractorInterface? {get set}
    var router: TVRouterInterface? {get set}
    func viewDidLoad()
    func getPopularTVShowSuccess(data: MovieModel)
    func getPopularTVShowFailure(error: Error)
    var tvShowList: MovieModel? {get set}
    func navigateToTvShowDetails(indexPath: IndexPath)
}

protocol TVRouterInterface {
    var view: UINavigationController? {get set}
    var presenter: TVPresenterInterface? {get set}
    static func createModule() -> UIViewController
    func navigateToTvShowDetails(tvShowId: Int?)
}
