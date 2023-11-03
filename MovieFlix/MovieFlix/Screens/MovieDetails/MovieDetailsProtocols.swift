//
//  MovieDetailsProtocols.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 03/11/23.
//

import Foundation
import UIKit

protocol MoviedetailsVCInterface {
    var presenter: MovieDetailsPresenterInterface? {get set}
    func getMovieDetailsSuccess(data: CommonMovieTVDetailsModel)
    func getMovieDetailsFailure(error: Error)
    func getCastSuccess(data: [CustomCVModel])
    func getCastFailure(error: Error)
    func getVideoSuccess(data: [String])
    func getVideoFailure(error: Error)
}

protocol MovieDetailsInteractorInterface {
    var presenter: MovieDetailsPresenterInterface? {get set}
    func getMovieDetails(id: Int)
    func getMovieCastDetails(id: Int)
    func getMovieVideo(id: Int)
}

protocol MovieDetailsPresenterInterface {
    var movieId: Int? {get set}
    var view: MoviedetailsVCInterface? {get set}
    var interactor: MovieDetailsInteractorInterface? {get set}
    var router: MovieDetailsRouterInterface? {get set}
    var castList: CastListModel? {get set}
    
    func getMovieDetailsSuccess(data: MovieDetailsModel)
    func getMovieDetailsFailure(error: Error)
    func getCastSuccess(data: CastListModel)
    func getCastFailure(error: Error)
    func navigateToCastDetails(indexPath: IndexPath)
    func getVideoSuccess(data: VideoModel)
    func getVideoFailure(error: Error)
    
    func viewDidLoad()
}

protocol MovieDetailsRouterInterface {
    var view: UIViewController? {get set}
    var presenter: MovieDetailsPresenterInterface? {get set}
    static func createModule(movieId: Int?) -> UIViewController
    func navigateToCastDetails(castId: Int?)
}
