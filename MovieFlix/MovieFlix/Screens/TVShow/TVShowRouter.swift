//
//  TVShowRouter.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 26/10/23.
//

import Foundation
import UIKit

class TVRouter: TVRouterInterface {
    var view: UINavigationController?
    var presenter: TVViewtoPresenterInterface?
    
    static func createModule() -> UIViewController {
        let router = TVRouter()
        let view = TVShowsVC()
        var presenter: TVViewtoPresenterInterface & TVInteractorToPresenterInterface = TVPresenter()
        var interactor: TVInteractorInterface = TVInteractor(presenter: presenter)
        
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
    
    func navigateToTvShowDetails(tvShowId: Int?) {
        let tvShowDetailsInst = TVShowDetailsRouter.createModule(tvShowId: tvShowId)
        view?.pushViewController(tvShowDetailsInst, animated: true)
        view?.navigationBar.prefersLargeTitles = false
        tvShowDetailsInst.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .done, target: self, action: #selector(backButtontapped(_:)))
        tvShowDetailsInst.title = "title"
        tvShowDetailsInst.navigationController?.navigationBar.tintColor = .white
    }
    
    @objc private func backButtontapped(_ sender: UIViewController) {
        DispatchQueue.main.async { [weak self] in
            self?.view?.navigationBar.prefersLargeTitles = true
            self?.view?.popViewController(animated: true)
        }
    }
}
