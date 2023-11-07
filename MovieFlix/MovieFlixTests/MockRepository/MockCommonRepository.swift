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
        default:
            completion(.failure(.invalidData))
        }
    }
}
