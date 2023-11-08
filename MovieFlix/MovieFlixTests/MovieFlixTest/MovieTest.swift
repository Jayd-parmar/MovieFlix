//
//  MovieTest.swift
//  MovieFlixTests
//
//  Created by Jaydip Parmar on 06/11/23.
//

import XCTest
@testable import MovieFlix

final class MovieTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testMovieDetailsSuccess() {
        let presenter = MoviePresenter()
        let interactor = MovieInteractor(movieRepo: MockCommonRepository(), presenter: presenter)
        presenter.interactor = interactor
        
        interactor.getMovieData(type: EndPointMovieItems.popularMovie(page: 1))
        let data = presenter.movieList
        let error = presenter.error
        XCTAssertNotNil(data, "data not fetched")
        XCTAssertNil(error, "Error!")
    }
    
    func testMovieDetailsFailure() {
        let presenter = MoviePresenter()
        let interactor = MovieInteractor(movieRepo: MockCommonRepository(), presenter: presenter)
        presenter.interactor = interactor
        
        interactor.getMovieData(type: EndPointMovieItems.topRatedMovie(page: 1))
        let data = presenter.movieList
        let error = presenter.error
        XCTAssertNil(data, "data not fetched")
        XCTAssertNotNil(error, "Error!")
    }

}
