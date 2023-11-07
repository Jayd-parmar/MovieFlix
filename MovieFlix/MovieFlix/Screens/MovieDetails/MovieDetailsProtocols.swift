//
//  MovieDetailsProtocols.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 03/11/23.
//

import Foundation
import UIKit

protocol MoviedetailsVCInterface {
    var presenter: MovieDetailsViewToPresenterInterface? {get set}
    func getMovieDetailsSuccess(data: CommonMovieTVDetailsModel)
    func getCastSuccess(data: [CustomCVModel])
    func getVideoSuccess(data: [String])
    func getMovieDetailFailure(error: Error)
}

protocol MovieDetailsInteractorInterface {
    var presenter: MovieDetailsInteractorToPresenterInterface? {get set}
    func getMovieDetails<T: Codable>(modelType: T.Type, type: EndPointAPIType)
}

protocol MovieDetailsViewToPresenterInterface {
    var movieId: Int? {get set}
    var view: MoviedetailsVCInterface? {get set}
    var interactor: MovieDetailsInteractorInterface? {get set}
    var router: MovieDetailsRouterInterface? {get set}
    var castList: CastListModel? {get set}
    
    func viewDidLoad()
    func navigateToCastDetails(indexPath: IndexPath)
}

protocol MovieDetailsInteractorToPresenterInterface {
    func getMovieDetailSuccess<T: Codable>(data: T)
    func getMovieDetailFailure(error: Error)
}

protocol MovieDetailsRouterInterface {
    var view: UIViewController? {get set}
    var presenter: MovieDetailsViewToPresenterInterface? {get set}
    static func createModule(movieId: Int?) -> UIViewController
    func navigateToCastDetails(castId: Int?)
}
