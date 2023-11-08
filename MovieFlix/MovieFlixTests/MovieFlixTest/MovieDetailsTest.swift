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
        let presenter = MovieDetailsPresenter(movieId: 0)
        let interactor = MovieDetailsInteractor(movieRepo: MockCommonRepository(), presenter: presenter)
        presenter.interactor = interactor
        
        interactor.getMovieDetails(modelType: MovieDetailsModel.self, type: EndPointMovieItems.movieDetails(id: 0))
        let data = presenter.movieDetails
        let error = presenter.error
        XCTAssertNotNil(data, "data not fetched")
        XCTAssertNil(error, "Error!")
    }
    
    func testMovieDetailsFailure() {
        let presenter = MovieDetailsPresenter(movieId: 0)
        let interactor = MovieDetailsInteractor(movieRepo: MockCommonRepository(), presenter: presenter)
        presenter.interactor = interactor
        
        interactor.getMovieDetails(modelType: MovieModel.self, type: EndPointMovieItems.movieDetails(id: 0))
        let data = presenter.movieDetails
        let error = presenter.error
        XCTAssertNil(data, "data not fetched")
        XCTAssertNotNil(error, "Error!")
    }
    
    func testCastListMovieSuccess() {
        let presenter = MovieDetailsPresenter(movieId: 0)
        let interactor = MovieDetailsInteractor(movieRepo: MockCommonRepository(), presenter: presenter)
        presenter.interactor = interactor
        
        interactor.getMovieDetails(modelType: CastListModel.self, type: EndPointCastItems.movieCastList(id: 0))
        let data = presenter.castList
        let error = presenter.error
        XCTAssertNotNil(data, "data not fetched")
        XCTAssertNil(error, "Error!")
    }
    
    func testCastListMovieFailure() {
        let presenter = MovieDetailsPresenter(movieId: 0)
        let interactor = MovieDetailsInteractor(movieRepo: MockCommonRepository(), presenter: presenter)
        presenter.interactor = interactor
        
        interactor.getMovieDetails(modelType: MovieModel.self, type: EndPointCastItems.movieCastList(id: 0))
        let data = presenter.movieDetails
        let error = presenter.error
        XCTAssertNil(data, "data not fetched")
        XCTAssertNotNil(error, "Error!")
    }
    
    func testVideoMovieSuccess() {
        let presenter = MovieDetailsPresenter(movieId: 0)
        let interactor = MovieDetailsInteractor(movieRepo: MockCommonRepository(), presenter: presenter)
        presenter.interactor = interactor
        
        interactor.getMovieDetails(modelType: VideoModel.self, type: EndPointMovieItems.movieVideoDetails(id: 0))
        let data = presenter.video
        let error = presenter.error
        XCTAssertNotNil(data, "data not fetched")
        XCTAssertNil(error, "Error!")
    }
    
    func testVideoMovieFailure() {
        let presenter = MovieDetailsPresenter(movieId: 0)
        let interactor = MovieDetailsInteractor(movieRepo: MockCommonRepository(), presenter: presenter)
        presenter.interactor = interactor
        
        interactor.getMovieDetails(modelType: MovieModel.self, type: EndPointMovieItems.movieVideoDetails(id: 0))
        let data = presenter.video
        let error = presenter.error
        XCTAssertNil(data, "data not fetched")
        XCTAssertNotNil(error, "Error!")
    }
}
