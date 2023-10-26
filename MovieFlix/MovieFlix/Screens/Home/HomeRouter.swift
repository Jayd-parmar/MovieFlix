//
//  HomeRouter.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 25/10/23.
//

import Foundation
import UIKit

typealias EntryPointHome = HomeViewInterface & UIViewController

protocol HomeRouterInterface {
    var entry: EntryPointHome? {get set}
    var presenter: HomePresenterInterface? {get set}
    static func createModule() -> HomeRouterInterface
}

class HomeRouter: HomeRouterInterface {
    
    var entry: EntryPointHome?
    var presenter: HomePresenterInterface?
    
    static func createModule() -> HomeRouterInterface {
        let router = HomeRouter()
        var view: HomeViewInterface = HomeVC()
        var presenter: HomePresenterInterface = HomePresenter()
        var interactor: HomeInteractorInterface = HomeInteractor()
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        interactor.presenter = presenter
        router.presenter = presenter
        router.entry = view as? EntryPointHome
        return router
    }
    
}
