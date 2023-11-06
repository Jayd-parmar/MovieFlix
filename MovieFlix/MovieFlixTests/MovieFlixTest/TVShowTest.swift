//
//  TVShowTest.swift
//  MovieFlixTests
//
//  Created by Jaydip Parmar on 06/11/23.
//

import XCTest
@testable import MovieFlix

final class TVShowTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testTVShowSuccess() {
        let interactor = MockTvShowInteractor()
        interactor.getTvShowData()
        
        let data = interactor.data as? MovieModel
        let error = interactor.error
        
        XCTAssertNotNil(data, "data not fetched")
        XCTAssertNil(error, "Error!")
    }
    
    func testTVShowFailure() {
        let interactor = MockTvShowInteractor()
        interactor.getTvShowData()
        
        let data = interactor.data as? MovieDetailsModel
        let _ = interactor.error

        XCTAssertNil(data, "Data should not be nil")
    }

}
