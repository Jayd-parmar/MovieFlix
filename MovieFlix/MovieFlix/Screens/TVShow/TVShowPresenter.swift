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
    func getPopularTVShowSuccess(data: TVShowModel)
    func getPopularTVShowFailure(error: Error)
    var tvShowList: TVShowModel? {get set}
    func getTVShowData()
    var getItemCount: Int? {get}
}

class TVPresenter: TVPresenterInterface {
    
    var tvShowList: TVShowModel?
    var view: TVViewInterface?
    var interactor: TVInteractorInterface?
    var router: TVRouterInterface?
    var getItemCount: Int? {
        tvShowList?.results.count
    }
    
    func getTVShowData() {
        interactor?.getTvShowData()
    }
    
    func getPopularTVShowSuccess(data: TVShowModel) {
        self.tvShowList = data
        view?.getPopularTVShowSuccess()
    }
    
    func getPopularTVShowFailure(error: Error) {
        view?.getPopularTVShowFailure(error: error)
    }
}
