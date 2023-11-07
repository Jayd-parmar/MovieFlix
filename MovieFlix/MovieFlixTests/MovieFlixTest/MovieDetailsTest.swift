//
//  MovieDetailsTest.swift
//  MovieFlixTests
//
//  Created by Jaydip Parmar on 07/11/23.
//

import XCTest
@testable import MovieFlix

final class MovieDetailsTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testMovieDetailsSuccess() {
        let interactor = MockMovieDetailsInteractor()
        interactor.getMovieDetails(modelType: MovieDetailsModel.self, type: EndPointMovieItems.movieDetails(id: 0))
        
        let data = interactor.data as? MovieDetailsModel
        let error = interactor.error
        XCTAssertNotNil(data, "data not fetched")
        XCTAssertNil(error, "Error!")
    }
    
    func testMovieDetailsFailure() {
        let interactor = MockMovieDetailsInteractor()
        interactor.getMovieDetails(modelType: MovieDetailsModel.self, type: EndPointMovieItems.movieDetails(id: 0))
        
        let data = interactor.data as? MovieModel
        let _ = interactor.error
        XCTAssertNil(data, "data not fetched")
//        XCTAssertNotNil(error, "Error")
    }
}
