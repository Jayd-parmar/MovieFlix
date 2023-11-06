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
        let interactor = MockMovieInteractor()
        interactor.getMovieData()
        
        let data = interactor.data as? MovieDetailsModel
        let error = interactor.error
        
        XCTAssertNotNil(data, "data not fetched")
        XCTAssertNil(error, "Error!")
    }
    
    func testMovieDetailsFailure() {
        let interactor = MockMovieInteractor()
        interactor.getMovieData()
        
        let data = interactor.data as? MovieModel
        let _ = interactor.error
        
        XCTAssertNil(data, "data not fetched")
    }

}
