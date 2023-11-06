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
        guard let data = movieResponse as? T else {
            return completion(.failure(.invalidData))
        }
        completion(.success(data))
    }
    
}
