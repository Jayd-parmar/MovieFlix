//
//  MockCastDetailsData.swift
//  MovieFlixTests
//
//  Created by Jaydip Parmar on 07/11/23.
//

import Foundation
@testable import MovieFlix

let castDetailsJsonResponse = """
    {
        "adult": false,
        "also_known_as": [
            "Том Круз",
            "トム・クルーズ",
            "ทอม ครูซ",
            "湯姆·克魯斯",
            "톰 크루즈",
            "توم كروز",
            "Thomas Cruise Mapother IV",
            "Τομ Κρουζ",
            "טום קרוז",
            "Thomas 'Tom' Cruise",
            "汤姆·克鲁斯",
            "TC",
            "Toms Krūzs",
            "تام کروز"
        ],
        "biography": "",
        "birthday": "1962-07-03",
        "deathday": null,
        "gender": 2,
        "homepage": "http://www.tomcruise.com",
        "id": 500,
        "imdb_id": "nm0000129",
        "known_for_department": "Acting",
        "name": "Tom Cruise",
        "place_of_birth": "Syracuse, New York, USA",
        "popularity": 67.179,
        "profile_path": "/8qBylBsQf4llkGrWR3qAsOtOU8O.jpg"
    }
""".data(using: .utf8)

func getCastDetailsResponse() -> CastDetailsModel? {
    let response: CastDetailsModel?
    do {
        guard let data = castDetailsJsonResponse else {
            print("nil returned data \n\n")
            return nil
        }
        response =  try JSONDecoder().decode(CastDetailsModel.self, from: data)
    } catch(let error){
        print("error in decode : \(error) \n\n")
        return nil
    }
    return response
}
