//
//  TVShowDetailsRouter.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 02/11/23.
//

import Foundation
import UIKit

class TVShowDetailsRouter: TVShowDetailsRouterInterface {
    var view: UIViewController?
    var presenter: TVShowDetailsPresenterInterface?
    
    static func createModule(tvShowId: Int? = nil) -> UIViewController {
        let router = TVShowDetailsRouter()
        let view = TVShowDetailsVC()
        var presenter: TVShowDetailsPresenterInterface = TVShowDetailsPresenter(tvShowId: tvShowId)
        var interactor: TVShowDetailsInteractorInterface = TVShowDetailsInteractor()
        
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
