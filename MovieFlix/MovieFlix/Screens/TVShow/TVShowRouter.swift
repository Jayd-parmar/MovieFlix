//
//  TVShowRouter.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 26/10/23.
//

import Foundation
import UIKit

protocol TVRouterInterface {
    var view: UINavigationController? {get set}
    var presenter: TVPresenterInterface? {get set}
    static func createModule() -> UIViewController
}

class TVRouter: TVRouterInterface {
    var view: UINavigationController?
    var presenter: TVPresenterInterface?
    
    static func createModule() -> UIViewController {
        let router = TVRouter()
        let view = TVShowsVC()
        var presenter: TVPresenterInterface = TVPresenter()
        var interactor: TVInteractorInterface = TVInteractor()
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        interactor.presenter = presenter
        router.presenter = presenter
        
        let navController = UINavigationController(rootViewController: view)
        router.view = navController
        return navController
    }
}
