//
//  MockMovieDetailsInteractor.swift
//  MovieFlixTests
//
//  Created by Jaydip Parmar on 07/11/23.
//

import Foundation
@testable import MovieFlix

class MockMovieDetailsInteractor: MovieDetailsInteractorInterface {
    
    var presenter: MovieFlix.MovieDetailsInteractorToPresenterInterface?
    private var movieRepo: CommonRepositoryDelegate
    var data: Codable?
    var error: DataError?
    
    init(movieRepo: CommonRepositoryDelegate = MockCommonRepository()) {
        self.movieRepo = movieRepo
    }
    
    func getMovieDetails<T: Codable>(modelType: T.Type, type: MovieFlix.EndPointAPIType) {
        movieRepo.getMovieData(modelType: modelType, type: type) { response in
            switch response {
            case .success(let data):
                self.data = data
            case .failure(let error):
                self.error = error
            }
        }
    }
}
