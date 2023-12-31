//
//  CastDetailsRouter.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 03/11/23.
//

import Foundation
import UIKit

class CastDetailsRouter: CastDetailsRouterInterface {
    var presenter: CastDetailsViewToPresenterInterface?
    var view: UIViewController?
    
    static func createModule(castId: Int?) -> UIViewController {
        let router = CastDetailsRouter()
        let view = CastDetailsVC()
        var presenter: CastDetailsViewToPresenterInterface & CastDetailsInteractorToPresenterInterface = CastDetailsPresenter(castId: castId)
        var interactor: CastDetailsInteractorInterface = CastDetailsInteractor(presenter: presenter)
        
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
