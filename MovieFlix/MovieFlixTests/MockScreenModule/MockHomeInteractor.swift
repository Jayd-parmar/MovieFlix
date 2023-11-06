//
//  MockHomeInteractor.swift
//  MovieFlixTests
//
//  Created by Jaydip Parmar on 06/11/23.
//

import Foundation
@testable import MovieFlix

class MockHomeInteractor: HomeInteractorInterface {
    var presenter: MovieFlix.HomePresenterInterface?
    private var movieRepo: CommonRepositoryDelegate
    var data: Codable?
    var error: DataError?
    
    init(movieRepo: CommonRepositoryDelegate = MockCommonRepository()) {
        self.movieRepo = movieRepo
    }
    
    func getMovieData(type: MovieFlix.EndPointAPIType, enumType: MovieFlix.MovieEnum) {
        movieRepo.getMovieData(modelType: MovieModel.self, type: type) {
            response in
            switch response {
            case .success(let data):
                self.data = data
            case .failure(let error):
                self.error = error
            }
        }
    }
    
}
