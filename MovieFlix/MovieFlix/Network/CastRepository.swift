//
//  PersonRepository.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 19/10/23.
//

import Foundation

class CastRepository {
    
    var eventHandler: ((Event) -> Void)?
    var movieCastList: CastListModel?
    var tvShowCastList: CastListModel?
    var castDetails: CastDetailsModel?
    var castImages: CastImageModel?
    var castMovieCredits: CastMovieTVModel?
    var castTVShowCredits: CastMovieTVModel?
    
    func getCastOfMovie() {
        self.eventHandler?(.loading)
        let movieId = 575264
        APIManager.shared.request(modelType: CastListModel.self, type: EndPointCastItems.movieCastList(id: movieId)) { response in
            self.eventHandler?(.stopLoading)
                switch response {
                case .success(let cast):
                    self.movieCastList = cast
                    print("Movie cast list: \(self.movieCastList!)")
                    print("-------------------------------------------------------------------")
                    self.eventHandler?(.dataLoaded)
                case .failure(let error):
                    self.eventHandler?(.error(error))
            }
        }
    }
    
    func getCastOfTVShow() {
        self.eventHandler?(.loading)
        let tvShowId = 233643
        APIManager.shared.request(modelType: CastListModel.self, type: EndPointCastItems.tvShowCastList(id: tvShowId)) { response in
            self.eventHandler?(.stopLoading)
                switch response {
                case .success(let tvShow):
                    self.tvShowCastList = tvShow
                    print("TV Show cast list: \(self.tvShowCastList!)")
                    print("-------------------------------------------------------------------")
                    self.eventHandler?(.dataLoaded)
                case .failure(let error):
                    self.eventHandler?(.error(error))
            }
        }
    }
    
    func getCastDetails() {
        self.eventHandler?(.loading)
        let castId = 500
        APIManager.shared.request(modelType: CastDetailsModel.self, type: EndPointCastItems.castDetails(id: castId)) { response in
            self.eventHandler?(.stopLoading)
                switch response {
                case .success(let cast):
                    self.castDetails = cast
                    print("TV Show cast list: \(self.castDetails!)")
                    print("-------------------------------------------------------------------")
                    self.eventHandler?(.dataLoaded)
                case .failure(let error):
                    self.eventHandler?(.error(error))
            }
        }
    }
    
    func getCastImages() {
        self.eventHandler?(.loading)
        let castId = 500
        APIManager.shared.request(modelType: CastImageModel.self, type: EndPointCastItems.castImages(id: castId)) { response in
            self.eventHandler?(.stopLoading)
                switch response {
                case .success(let cast):
                    self.castImages = cast
                    print("TV Show cast list: \(self.castImages!)")
                    print("-------------------------------------------------------------------")
                    self.eventHandler?(.dataLoaded)
                case .failure(let error):
                    self.eventHandler?(.error(error))
            }
        }
    }
    
    func getCastMovieCredits() {
        self.eventHandler?(.loading)
        let castId = 500
        APIManager.shared.request(modelType: CastMovieTVModel.self, type: EndPointCastItems.castMovie(id: castId)) { response in
            self.eventHandler?(.stopLoading)
                switch response {
                case .success(let cast):
                    self.castMovieCredits = cast
                    print("TV Show cast list: \(self.castMovieCredits!)")
                    print("-------------------------------------------------------------------")
                    self.eventHandler?(.dataLoaded)
                case .failure(let error):
                    self.eventHandler?(.error(error))
            }
        }
    }
    
    func getCastTVShowCredits() {
        self.eventHandler?(.loading)
        let castId = 500
        APIManager.shared.request(modelType: CastMovieTVModel.self, type: EndPointCastItems.castTVShow(id: castId)) { response in
            self.eventHandler?(.stopLoading)
                switch response {
                case .success(let cast):
                    self.castTVShowCredits = cast
                    print("TV Show cast credits: \(self.castTVShowCredits!)")
                    print("-------------------------------------------------------------------")
                    self.eventHandler?(.dataLoaded)
                case .failure(let error):
                    self.eventHandler?(.error(error))
            }
        }
    }
}
