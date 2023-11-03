//
//  CastDetailsRouter.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 03/11/23.
//

import Foundation
import UIKit

class CastDetailsRouter: CastDetailsRouterInterface {
    var presenter: CastDetailsPresenterInterface?
    var view: UIViewController?
    
    static func createModule(castId: Int?) -> UIViewController {
        let router = CastDetailsRouter()
        let view = CastDetailsVC()
        var presenter: CastDetailsPresenterInterface = CastDetailsPresenter(castId: castId)
        var interactor: CastDetailsInteractorInterface = CastDetailsInteractor()
        
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
