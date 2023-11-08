//
//  MovieRouter.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 26/10/23.
//

import Foundation
import UIKit

class MovieRouter: MovieRouterInterface {
    var view: UINavigationController?
    var presenter: MovieViewToPresenterInterface?
    static func createModule() -> UINavigationController {
        let router = MovieRouter()
        let view = MoviesVC()
        var presenter: MovieViewToPresenterInterface & MovieInteractorToPresenterInterface = MoviePresenter()
        var interactor: MovieInteractorInterface = MovieInteractor(presenter: presenter)
        
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
    
    func navigateToMovieDetails(movieId: Int?) {
        let movieDetailsInst = MovieDetailsRouter.createModule(movieId: movieId)
        view?.pushViewController(movieDetailsInst, animated: true)
        view?.navigationBar.prefersLargeTitles = false
        movieDetailsInst.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .done, target: self, action: #selector(backButtontapped(_:)))
        movieDetailsInst.navigationController?.navigationBar.tintColor = .white
    }
    
    @objc private func backButtontapped(_ sender: UIViewController) {
        DispatchQueue.main.async { [weak self] in
            self?.view?.navigationBar.prefersLargeTitles = true
            self?.view?.popViewController(animated: true)
        }
    }
}
