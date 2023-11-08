//
//  MockMovieRepository.swift
//  MovieFlixTests
//
//  Created by Jaydip Parmar on 06/11/23.
//

import Foundation
@testable import MovieFlix

class MockCommonRepository: CommonRepositoryDelegate {
    
    func getMovieData<T: Codable>(modelType: T.Type, type: MovieFlix.EndPointAPIType, completion: @escaping MovieFlix.Handler<T>) {
        
        switch type {
        case EndPointMovieItems.popularMovie(page: 1):
            guard let data = movieResponse as? T else {
                return completion(.failure(.invalidData))
            }
            completion(.success(data))
        case EndPointMovieItems.movieDetails(id: 0):
            guard let data = movieDetailResponse as? T else {
                return completion(.failure(.invalidData))
            }
            completion(.success(data))
        case EndPointTVShowItems.popularTVShow(page: 1):
            let tvShowResponse = getTvShowResponse()
            guard let data = tvShowResponse as? T else {
                return completion(.failure(.invalidData))
            }
            completion(.success(data))
        case EndPointTVShowItems.tvShowDetails(id: 0):
            let tvShowResponse = getTvShowDetailsResponse()
            guard let data = tvShowResponse as? T else {
                return completion(.failure(.invalidData))
            }
            completion(.success(data))
        case EndPointCastItems.castDetails(id: 0):
            let castResponse = getCastDetailsResponse()
            guard let data = castResponse as? T else {
                return completion(.failure(.invalidData))
            }
            completion(.success(data))
        case EndPointCastItems.movieCastList(id: 0):
            let movieCastResponse = getMovieCastData()
            guard let data = movieCastResponse as? T else {
                return completion(.failure(.invalidData))
            }
            completion(.success(data))
        case EndPointCastItems.tvShowCastList(id: 0):
            let tvCastResponse = getTVCastData()
            guard let data = tvCastResponse as? T else {
                return completion(.failure(.invalidData))
            }
            completion(.success(data))
        case EndPointCastItems.castCombine(id: 0):
            let combineCastResponse = getCombineCastData()
            guard let data = combineCastResponse as? T else {
                return completion(.failure(.invalidData))
            }
            completion(.success(data))
        case EndPointCastItems.castImages(id: 0):
            let castImageResponse = getCastImageData()
            guard let data = castImageResponse as? T else {
                return completion(.failure(.invalidData))
            }
            completion(.success(data))
        case EndPointMovieItems.movieVideoDetails(id: 0):
            let videoResponse = getMovieVideoData()
            guard let data = videoResponse as? T else {
                return completion(.failure(.invalidData))
            }
            completion(.success(data))
        case EndPointTVShowItems.tvShowVideDetails(id: 0):
            let videoResponse = getVideoTVResponse()
            guard let data = videoResponse as? T else {
                return completion(.failure(.invalidData))
            }
            completion(.success(data))
        default:
            completion(.failure(.invalidData))
        }
    }
}
