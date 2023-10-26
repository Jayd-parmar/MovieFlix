//
//  MovieRouter.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 26/10/23.
//

import Foundation
import UIKit

typealias EntryPointMovie = MovieViewInterface & UIViewController

protocol MovieRouterInterface {
    var entry: EntryPointMovie? {get set}
    var presenter: MoviePresenterInterface? {get set}
    static func createModule() -> MovieRouterInterface
}

class MovieRouter: MovieRouterInterface {
    var entry: EntryPointMovie?
    var presenter: MoviePresenterInterface?
    
    static func createModule() -> MovieRouterInterface {
        let router = MovieRouter()
        var view: MovieViewInterface = MoviesVC()
        var presenter: MoviePresenterInterface = MoviePresenter()
        var interactor: MovieInteractorInterface = MovieInteractor()
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        interactor.presenter = presenter
        router.presenter = presenter
        router.entry = view as? EntryPointMovie
        return router
    }
    
}
