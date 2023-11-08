//
//  TVShowDetailsTest.swift
//  MovieFlixTests
//
//  Created by Jaydip Parmar on 07/11/23.
//

import XCTest
@testable import MovieFlix

final class TVShowDetailsTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testTVShowDetailsSuccess() {
        let presenter = TVShowDetailsPresenter(tvShowId: 0)
        let interactor = TVShowDetailsInteractor(tvRepo: MockCommonRepository(), presenter: presenter)
        presenter.interactor = interactor
        
        interactor.getTVShowDetail(modelType: TVShowDetailsModel.self, type: EndPointTVShowItems.tvShowDetails(id: 0))
        let data = presenter.tvShowDetails
        let error = presenter.error
        XCTAssertNotNil(data, "data not fetched")
        XCTAssertNil(error, "Error!")
    }
    
    func testTVShowDetailsFailure() {
        let presenter = TVShowDetailsPresenter(tvShowId: 0)
        let interactor = TVShowDetailsInteractor(tvRepo: MockCommonRepository(), presenter: presenter)
        presenter.interactor = interactor
        
        interactor.getTVShowDetail(modelType: MovieModel.self, type: EndPointTVShowItems.tvShowDetails(id: 0))
        let data = presenter.tvShowDetails
        let error = presenter.error
        XCTAssertNil(data, "data not fetched")
        XCTAssertNotNil(error, "Error!")
    }
    
    func testCastListTVSuccess() {
        let presenter = TVShowDetailsPresenter(tvShowId: 0)
        let interactor = TVShowDetailsInteractor(tvRepo: MockCommonRepository(), presenter: presenter)
        presenter.interactor = interactor
        
        interactor.getTVShowDetail(modelType: CastListModel.self, type: EndPointCastItems.tvShowCastList(id: 0))
        let data = presenter.castList
        let error = presenter.error
        XCTAssertNotNil(data, "data not fetched")
        XCTAssertNil(error, "Error!")
    }
    
    func testCastListTVFailure() {
        let presenter = TVShowDetailsPresenter(tvShowId: 0)
        let interactor = TVShowDetailsInteractor(tvRepo: MockCommonRepository(), presenter: presenter)
        presenter.interactor = interactor
        
        interactor.getTVShowDetail(modelType: MovieModel.self, type: EndPointCastItems.tvShowCastList(id: 0))
        let data = presenter.tvShowDetails
        let error = presenter.error
        XCTAssertNil(data, "data not fetched")
        XCTAssertNotNil(error, "Error!")
    }
    
    func testTVVideoSuccess() {
        let presenter = TVShowDetailsPresenter(tvShowId: 0)
        let interactor = TVShowDetailsInteractor(tvRepo: MockCommonRepository(), presenter: presenter)
        presenter.interactor = interactor
        
        interactor.getTVShowDetail(modelType: VideoModel.self, type: EndPointTVShowItems.tvShowVideDetails(id: 0))
        let data = presenter.video
        let error = presenter.error
        XCTAssertNotNil(data, "data not fetched")
        XCTAssertNil(error, "Error!")
    }
    
    func testTVVideoFailure() {
        let presenter = TVShowDetailsPresenter(tvShowId: 0)
        let interactor = TVShowDetailsInteractor(tvRepo: MockCommonRepository(), presenter: presenter)
        presenter.interactor = interactor
        
        interactor.getTVShowDetail(modelType: MovieModel.self, type: EndPointTVShowItems.tvShowVideDetails(id: 0))
        let data = presenter.video
        let error = presenter.error
        XCTAssertNil(data, "data not fetched")
        XCTAssertNotNil(error, "Error!")
    }

}
