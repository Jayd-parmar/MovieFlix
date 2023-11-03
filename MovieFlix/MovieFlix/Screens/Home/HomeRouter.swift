//
//  HomeRouter.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 25/10/23.
//

import Foundation
import UIKit

typealias EntryPointHome = HomeViewInterface & UIViewController

class HomeRouter: HomeRouterInterface {
    
    var entry: EntryPointHome?
    var presenter: HomePresenterInterface?
    
    static func createModule() -> UIViewController {
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
        router.entry = view
        return view
    }
    
}
