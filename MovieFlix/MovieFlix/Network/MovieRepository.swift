//
//  MovieRepository.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 19/10/23.
//

import Foundation

protocol MovieRepositoryDelegate: AnyObject {
    func getMovieData<T: Codable>(
        modelType: T.Type,
        type: EndPointAPIType,
        completion: @escaping Handler<T>
    )
}

class MovieRepository: MovieRepositoryDelegate {
    
    func getMovieData<T: Codable>(modelType: T.Type, type: EndPointAPIType, completion: @escaping Handler<T>) {
        APIManager.shared.request(modelType: modelType, type: type, completion: completion)
    }
}

//    var eventHandler: ((Event) -> Void)?
//    var popMovieData: MovieModel?
//    var topRatedMovieData: MovieModel?
//    var upcomingMovieData: MovieModel?
//    var nowPlayingMovieData: MovieModel?
//    var movieDetails: MovieDetailsModel?
//
//    func getPopularMovieData() {
//        self.eventHandler?(.loading)
//        APIManager.shared.request(modelType: MovieModel.self, type: EndPointMovieItems.popularMovie(page: 1)) { response in
//            self.eventHandler?(.stopLoading)
//                switch response {
//                case .success(let movie):
//                    self.popMovieData = movie
//                    print("popular movie: \(self.popMovieData!)")
//                    print("-------------------------------------------------------------------")
//                    self.eventHandler?(.dataLoaded)
//                case .failure(let error):
//                    self.eventHandler?(.error(error))
//            }
//        }
//    }
//
//    func getTopRatedMovieData() {
//        self.eventHandler?(.loading)
//        APIManager.shared.request(modelType: MovieModel.self, type: EndPointMovieItems.topRatedMovie()) { response in
//            self.eventHandler?(.stopLoading)
//                switch response {
//                case .success(let movie):
//                    self.topRatedMovieData = movie
//                    print("top rated movie: \(self.topRatedMovieData!)")
//                    print("-------------------------------------------------------------------")
//                    self.eventHandler?(.dataLoaded)
//                case .failure(let error):
//                    self.eventHandler?(.error(error))
//            }
//        }
//    }
//
//    func getUpcomingData() {
//        self.eventHandler?(.loading)
//        APIManager.shared.request(modelType: MovieModel.self, type: EndPointMovieItems.upcomingMovie()) { response in
//            self.eventHandler?(.stopLoading)
//                switch response {
//                case .success(let movie):
//                    self.upcomingMovieData = movie
//                    print("top rated movie: \(self.upcomingMovieData!)")
//                    print("-------------------------------------------------------------------")
//                    self.eventHandler?(.dataLoaded)
//                case .failure(let error):
//                    self.eventHandler?(.error(error))
//            }
//        }
//    }
//
//    func getNowPlayingData() {
//        self.eventHandler?(.loading)
//        APIManager.shared.request(modelType: MovieModel.self, type: EndPointMovieItems.nowPlayingMovie()) { response in
//            self.eventHandler?(.stopLoading)
//                switch response {
//                case .success(let movie):
//                    self.nowPlayingMovieData = movie
//                    print("Now playing movie: \(self.nowPlayingMovieData!)")
//                    print("-------------------------------------------------------------------")
//                    self.eventHandler?(.dataLoaded)
//                case .failure(let error):
//                    self.eventHandler?(.error(error))
//            }
//        }
//    }
//
//    func getMovieDetaislById() {
//        self.eventHandler?(.loading)
//        let movieId = 299054 // pass movieId
//        APIManager.shared.request(modelType: MovieDetailsModel.self, type: EndPointMovieItems.movieDetails(id: movieId)) { response in
//            self.eventHandler?(.stopLoading)
//                switch response {
//                case .success(let movie):
//                    self.movieDetails = movie
//                    print("movieDetailsByID: \(self.movieDetails!)")
//                    print("-------------------------------------------------------------------")
//                    self.eventHandler?(.dataLoaded)
//                case .failure(let error):
//                    self.eventHandler?(.error(error))
//            }
//        }
//    }
// }
