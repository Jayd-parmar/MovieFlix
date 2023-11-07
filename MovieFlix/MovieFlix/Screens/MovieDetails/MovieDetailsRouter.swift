//
//  MovieDetailsRouter.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 01/11/23.
//

import Foundation
import UIKit

class MovieDetailsRouter: MovieDetailsRouterInterface {
    var view: UIViewController?
    var presenter: MovieDetailsViewToPresenterInterface?

    static func createModule(movieId: Int? = nil) -> UIViewController {
        let router = MovieDetailsRouter()
        let view = MovieDetailsVC()
        var presenter: MovieDetailsViewToPresenterInterface & MovieDetailsInteractorToPresenterInterface = MovieDetailsPresenter(movieId: movieId)
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
    
    func navigateToCastDetails(castId: Int?) {
        let castDetailsInst = CastDetailsRouter.createModule(castId: castId)
        view?.navigationController?.pushViewController(castDetailsInst, animated: true)
        castDetailsInst.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .done, target: self, action: #selector(backButtontapped(_:)))
        castDetailsInst.title = "title"
        castDetailsInst.navigationController?.navigationBar.tintColor = .white
    }
    
    @objc private func backButtontapped(_ sender: UIViewController) {
        DispatchQueue.main.async { [weak self] in
            self?.view?.navigationController?.popViewController(animated: true)
        }
    }
    
}
