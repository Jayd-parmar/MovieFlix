//
//  MockMovieInteractor.swift
//  MovieFlixTests
//
//  Created by Jaydip Parmar on 06/11/23.
//

import Foundation
@testable import MovieFlix

class MockMovieInteractor: MovieInteractorInterface {
    var presenter: MovieFlix.MovieInteractorToPresenterInterface?
    private var movieRepo: CommonRepositoryDelegate
    var data: Codable?
    var error: DataError?
    
    init(movieRepo: CommonRepositoryDelegate = MockCommonRepository()) {
        self.movieRepo = movieRepo
    }
    
    func getMovieData() {
        movieRepo.getMovieData(modelType: MovieDetailsModel.self, type: EndPointMovieItems.movieDetails(id: 0)) { response in
            switch response {
            case .success(let data):
                self.data = data
            case .failure(let error):
                self.error = error
            }
        }
    }
    
    
}
