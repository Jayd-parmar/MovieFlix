//
//  MockTvShowInteractor.swift
//  MovieFlixTests
//
//  Created by Jaydip Parmar on 06/11/23.
//

import Foundation
@testable import MovieFlix

class MockTvShowInteractor: TVInteractorInterface {
    var presenter: MovieFlix.TVInteractorToPresenterInterface?
    private var tvRepo: CommonRepositoryDelegate
    var data: Codable?
    var error: DataError?
    
    init(tvRepo: CommonRepositoryDelegate = MockCommonRepository()) {
        self.tvRepo = tvRepo
    }
    
    func getTvShowData() {
        tvRepo.getMovieData(modelType: MovieModel.self, type: EndPointTVShowItems.popularTVShow(page: 1)) { response in
            switch response {
            case .success(let data):
                self.data = data
            case .failure(let error):
                self.error = error
            }
        }
    }
    
}
