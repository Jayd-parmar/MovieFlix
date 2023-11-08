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
        let presenter = HomePresenter()
        let interactor = HomeInteractor(movieRepo: MockCommonRepository(), presenter: presenter)
        presenter.interactor = interactor
        
        interactor.getMovieData(type: EndPointMovieItems.popularMovie(page: 1), enumType: .popular)
        let data = presenter.responseList.first(where: {$0.enumType == .popular})?.data
        let error = presenter.error
        XCTAssertNotNil(data, "data not fetched")
        XCTAssertNil(error, "Error!")
    }
    
    func testFetchMoviesFailure() {
        let presenter = HomePresenter()
        let interactor = HomeInteractor(movieRepo: MockCommonRepository(), presenter: presenter)
        presenter.interactor = interactor
        
        interactor.getMovieData(type: EndPointMovieItems.topRatedMovie(page: 1), enumType: .popular)
        let data = presenter.responseList.first(where: {$0.enumType == .toprated})?.data
        let error = presenter.error
        XCTAssertNil(data, "data not fetched")
        XCTAssertNotNil(error, "Error!")
    }

}
