//
//  HomeRouter.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 25/10/23.
//

import Foundation
import UIKit

class HomeRouter: HomeRouterInterface {
    var presenter: HomeViewToPresenterInterface?
    var view: UINavigationController?
    var movieViewController: UINavigationController?
    
    static func createModule() -> UINavigationController {
        let router = HomeRouter()
        let view = HomeVC()
        var presenter: HomeViewToPresenterInterface & HomeInteractorToPresenterInterface = HomePresenter()
        var interactor: HomeInteractorInterface = HomeInteractor(presenter: presenter)
        
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
