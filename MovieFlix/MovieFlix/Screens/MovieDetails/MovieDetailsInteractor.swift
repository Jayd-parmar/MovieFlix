//
//  MovieDetailsInteractor.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 01/11/23.
//

import Foundation

class MovieDetailsInteractor: MovieDetailsInteractorInterface {
    var presenter: MovieDetailsPresenterInterface?
    private let movieRepo: CommonRepositoryDelegate
    
    init(movieRepo: CommonRepositoryDelegate = CommonMovieRepository()) {
        self.movieRepo = movieRepo
    }
    
    func getMovieDetails(id: Int) {
        movieRepo.getMovieData(modelType: MovieDetailsModel.self, type: EndPointMovieItems.movieDetails(id: id)) { [self] response in
            switch response {
            case .success(let movie):
                presenter?.getMovieDetailsSuccess(data: movie)
            case .failure(let error):
                presenter?.getMovieDetailsFailure(error: error)
            }
        }
    }
    
    func getMovieCastDetails(id: Int) {
        movieRepo.getMovieData(modelType: CastListModel.self, type: EndPointCastItems.movieCastList(id: id)) { [self] response in
            switch response {
            case .success(let cast):
                presenter?.getCastSuccess(data: cast)
            case .failure(let error):
                presenter?.getCastFailure(error: error)
            }
        }
    }
    
    func getMovieVideo(id: Int) {
        movieRepo.getMovieData(modelType: VideoModel.self, type: EndPointMovieItems.movieVideoDetails(id: id)) { [self] response in
            switch response {
            case .success(let video):
                presenter?.getVideoSuccess(data: video)
            case .failure(let error):
                presenter?.getVideoFailure(error: error)
            }
        }
    }
}
