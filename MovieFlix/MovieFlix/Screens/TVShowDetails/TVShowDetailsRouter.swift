//
//  TVShowDetailsRouter.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 02/11/23.
//

import Foundation
import UIKit

protocol TVShowDetailsRouterInterface {
    var presenter: TVShowDetailsPresenterInterface? {get set}
    var view: UIViewController? {get set}
    static func createModule(tvShowId: Int?) -> UIViewController
}

class TVShowDetailsRouter: TVShowDetailsRouterInterface {
    var view: UIViewController?
    var presenter: TVShowDetailsPresenterInterface?
    
    static func createModule(tvShowId: Int? = nil) -> UIViewController {
        let router = TVShowDetailsRouter()
        let view = TVShowDetailsVC()
        var presenter: TVShowDetailsPresenterInterface = TVShowDetailsPresenter(tvShowId: tvShowId)
        var interactor: TVShowDetailsInteractorInterface = TVShowDetailsInteractor()
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        interactor.presenter = presenter
        router.presenter = presenter
        router.view = view
        return view
    }
    
}
