//
//  TVShowRouter.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 26/10/23.
//

import Foundation
import UIKit

typealias EntryPointTV = TVViewInterface & UIViewController

protocol TVRouterInterface {
    var entry: EntryPointTV? {get set}
    var presenter: TVPresenterInterface? {get set}
    static func createModule() -> TVRouterInterface
}

class TVRouter: TVRouterInterface {
    var entry: EntryPointTV?
    var presenter: TVPresenterInterface?
    
    static func createModule() -> TVRouterInterface {
        let router = TVRouter()
        var view: TVViewInterface = TVShowsVC()
        var presenter: TVPresenterInterface = TVPresenter()
        var interactor: TVInteractorInterface = TVInteractor()
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        interactor.presenter = presenter
        router.presenter = presenter
        router.entry = view as? EntryPointTV
        return router
    }
}
