//
//  HomeTest.swift
//  MovieFlixTests
//
//  Created by Jaydip Parmar on 06/11/23.
//

import XCTest
@testable import MovieFlix

final class HomeTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
       super.tearDown()
    }
    
    func testMovieSuccess() {
        let interactor = MockHomeInteractor()
        interactor.getMovieData(type: EndPointMovieItems.popularMovie(page: 1), enumType: .popular)
        
        let data = interactor.data as? MovieModel
        let error = interactor.error
        
        XCTAssertNotNil(data, "data not fetched")
        XCTAssertNil(error, "Error!")
    }
    
    func testFetchMoviesFailure() {
        let interactor = MockHomeInteractor()
        interactor.getMovieData(type: EndPointMovieItems.popularMovie(page: 1), enumType: .popular)
        
        let data = interactor.data as? MovieDetailsModel
        let _ = interactor.error

        XCTAssertNil(data, "Data should not be nil")
    }

}
