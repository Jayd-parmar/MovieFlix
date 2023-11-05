//
//  HomeRouter.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 25/10/23.
//

import Foundation
import UIKit

protocol HomeRouterInterface {
    var view: UINavigationController? {get set}
    var presenter: HomePresenterInterface? {get set}
    static func createModule() -> UINavigationController
    func navigateToMovies(data: MovieModel?, type: String)
    var movieViewController: UINavigationController? {get set}
}

class HomeRouter: HomeRouterInterface {
    var view: UINavigationController?
    var presenter: HomePresenterInterface?
    var movieViewController: UINavigationController?
    
    static func createModule() -> UINavigationController {
        let router = HomeRouter()
        let view = HomeVC()
        var presenter: HomePresenterInterface = HomePresenter()
        var interactor: HomeInteractorInterface = HomeInteractor()
        
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
    
    func navigateToMovies(data: MovieModel?, type: String) {
        let movieViewController = self.view?.tabBarController?.viewControllers?[1]
                                  as? UINavigationController
        self.movieViewController = movieViewController
        let movieViewInterFace = movieViewController?.visibleViewController as? MovieViewInterface
        movieViewInterFace?.presenter?.configureMovies(data: data, type: type)
        view?.tabBarController?.selectedIndex = 1
    }
    
}
