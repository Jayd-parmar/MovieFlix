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
        let presenter = TVPresenter()
        let interactor = TVInteractor(tvRepo: MockCommonRepository(), presenter: presenter)
        presenter.interactor = interactor
        
        interactor.getTvShowData(type: EndPointTVShowItems.popularTVShow(page: 1))
        let data = presenter.tvShowList
        let error = presenter.error
        XCTAssertNotNil(data, "data not fetched")
        XCTAssertNil(error, "Error!")
    }
    
    func testTVShowFailure() {
        let presenter = TVPresenter()
        let interactor = TVInteractor(tvRepo: MockCommonRepository(), presenter: presenter)
        presenter.interactor = interactor
        
        interactor.getTvShowData(type: EndPointTVShowItems.tvShowDetails(id: 1))
        let data = presenter.tvShowList
        let error = presenter.error
        XCTAssertNil(data, "data not fetched")
        XCTAssertNotNil(error, "Error!")
    }
}
