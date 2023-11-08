//
//  CastDetailsTest.swift
//  MovieFlixTests
//
//  Created by Jaydip Parmar on 07/11/23.
//

import XCTest
@testable import MovieFlix

final class CastDetailsTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testCastDetailsSuccess() {
        let presenter = CastDetailsPresenter(castId: 0)
        let interactor = CastDetailsInteractor(castRepo: MockCommonRepository(), presenter: presenter)
        presenter.interactor = interactor
        
        interactor.getCastDetail(modelType: CastDetailsModel.self, type: EndPointCastItems.castDetails(id: 0))
        let data = presenter.castDetails
        let error = presenter.error
        XCTAssertNotNil(data, "data not fetched")
        XCTAssertNil(error, "Error!")
    }
    
    func testCastDetailsFailure() {
        let presenter = CastDetailsPresenter(castId: 0)
        let interactor = CastDetailsInteractor(castRepo: MockCommonRepository(), presenter: presenter)
        presenter.interactor = interactor
        
        interactor.getCastDetail(modelType: MovieModel.self, type: EndPointCastItems.castDetails(id: 0))
        let data = presenter.castDetails
        let error = presenter.error
        XCTAssertNil(data, "data not fetched")
        XCTAssertNotNil(error, "Error!")
    }
    
    func testCastCombineSuccess() {
        let presenter = CastDetailsPresenter(castId: 0)
        let interactor = CastDetailsInteractor(castRepo: MockCommonRepository(), presenter: presenter)
        presenter.interactor = interactor
        
        interactor.getCastDetail(modelType: CastMovieTVModel.self, type: EndPointCastItems.castCombine(id: 0))
        let data = presenter.castCombine
        let error = presenter.error
        XCTAssertNotNil(data, "data not fetched")
        XCTAssertNil(error, "Error!")
    }
    
    func testCastCombineFailure() {
        let presenter = CastDetailsPresenter(castId: 0)
        let interactor = CastDetailsInteractor(castRepo: MockCommonRepository(), presenter: presenter)
        presenter.interactor = interactor
        
        interactor.getCastDetail(modelType: MovieModel.self, type: EndPointCastItems.castCombine(id: 0))
        let data = presenter.castCombine
        let error = presenter.error
        XCTAssertNil(data, "data not fetched")
        XCTAssertNotNil(error, "Error!")
    }
    
    func testCastImageSuccess() {
        let presenter = CastDetailsPresenter(castId: 0)
        let interactor = CastDetailsInteractor(castRepo: MockCommonRepository(), presenter: presenter)
        presenter.interactor = interactor
        
        interactor.getCastDetail(modelType: CastImageModel.self, type: EndPointCastItems.castImages(id: 0))
        let data = presenter.castImages
        let error = presenter.error
        XCTAssertNotNil(data, "data not fetched")
        XCTAssertNil(error, "Error!")
    }
    
    func testCastImageFailure() {
        let presenter = CastDetailsPresenter(castId: 0)
        let interactor = CastDetailsInteractor(castRepo: MockCommonRepository(), presenter: presenter)
        presenter.interactor = interactor
        
        interactor.getCastDetail(modelType: MovieModel.self, type: EndPointCastItems.castImages(id: 0))
        let data = presenter.castImages
        let error = presenter.error
        XCTAssertNil(data, "data not fetched")
        XCTAssertNotNil(error, "Error!")
    }

}
