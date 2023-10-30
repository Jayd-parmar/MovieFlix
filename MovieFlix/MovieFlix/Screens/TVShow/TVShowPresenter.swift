//
//  TVShowPresenter.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 26/10/23.
//

import Foundation

protocol TVPresenterInterface {
    var view: TVViewInterface? {get set}
    var interactor: TVInteractorInterface? {get set}
    var router: TVRouterInterface? {get set}
    func viewDidLoad()
    func getPopularTVShowSuccess(data: MovieModel)
    func getPopularTVShowFailure(error: Error)
    var tvShowList: MovieModel? {get set}
}

class TVPresenter: TVPresenterInterface {
    
    var view: TVViewInterface?
    var interactor: TVInteractorInterface?
    var router: TVRouterInterface?
    var tvShowList: MovieModel?
    
    func viewDidLoad() {
        interactor?.getTvShowData()
    }
    
    func getPopularTVShowSuccess(data: MovieModel) {
        self.tvShowList = data
        view?.getPopularTVShowSuccess(list: data)
    }
    
    func getPopularTVShowFailure(error: Error) {
        view?.getPopularTVShowFailure(error: error)
    }
}
