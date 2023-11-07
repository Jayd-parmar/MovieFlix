//
//  TVShowProtocols.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 03/11/23.
//

import Foundation
import UIKit

protocol TVViewInterface {
    var presenter: TVViewtoPresenterInterface? {get set}
    func getPopularTVShowSuccess(list: [CustomCVModel])
    func getPopularTVShowFailure(error: Error)
}

protocol TVInteractorInterface {
    var presenter: TVInteractorToPresenterInterface? {get set}
    func getTvShowData()
}

protocol TVViewtoPresenterInterface {
    var view: TVViewInterface? {get set}
    var interactor: TVInteractorInterface? {get set}
    var router: TVRouterInterface? {get set}
    func viewDidLoad()
    
    var tvShowList: MovieModel? {get set}
    func navigateToTvShowDetails(indexPath: IndexPath)
}

protocol TVInteractorToPresenterInterface {
    func getPopularTVShowSuccess(data: MovieModel)
    func getPopularTVShowFailure(error: Error)
}

protocol TVRouterInterface {
    var view: UINavigationController? {get set}
    var presenter: TVViewtoPresenterInterface? {get set}
    static func createModule() -> UIViewController
    func navigateToTvShowDetails(tvShowId: Int?)
}
