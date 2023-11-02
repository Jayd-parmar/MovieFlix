//
//  MovieDetailsRouter.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 01/11/23.
//

import Foundation
import UIKit

protocol MovieDetailsRouterInterface {
    var view: UIViewController? {get set}
    var presenter: MovieDetailsPresenterInterface? {get set}
    static func createModule(movieId: Int?) -> UIViewController
}

class MovieDetailsRouter: MovieDetailsRouterInterface {
    var presenter: MovieDetailsPresenterInterface?
    var view: UIViewController?

    static func createModule(movieId: Int? = nil) -> UIViewController {
        let router = MovieDetailsRouter()
        let view = MovieDetailsVC()
        var presenter: MovieDetailsPresenterInterface = MovieDetailsPresenter(movieId: movieId)
        var interactor: MovieDetailsInteractorInterface = MovieDetailsInteractor()
        
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
