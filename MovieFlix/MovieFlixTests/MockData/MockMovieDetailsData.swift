//
//  MockMovieDetailsData.swift
//  MovieFlixTests
//
//  Created by Jaydip Parmar on 06/11/23.
//

import Foundation
@testable import MovieFlix

let MovieDetailJsonResponse = """
    {
        "adult": false,
        "backdrop_path": "/ww1eIoywghjoMzRLRIcbJLuKnJH.jpg",
        "belongs_to_collection": {
            "id": 403374,
            "name": "Jack Reacher Collection",
            "poster_path": "/qtafXiYDUMKxzsssU41qWey5oiT.jpg",
            "backdrop_path": "/vViRXFnSyGJ2fzMbcc5sqTKswcd.jpg"
        },
        "budget": 60000000,
        "genres": [
            {
                "id": 28,
                "name": "Action"
            },
            {
                "id": 53,
                "name": "Thriller"
            }
        ],
        "homepage": "",
        "id": 343611,
        "imdb_id": "tt3393786",
        "original_language": "en",
        "original_title": "Jack Reacher: Never Go Back",
        "overview": "When Major Susan Turner is arrested for treason, ex-investigator Jack Reacher undertakes the challenging task to prove her innocence and ends up exposing a shocking conspiracy.",
        "popularity": 52.38,
        "poster_path": "/cOg3UT2NYWHZxp41vpxAnVCOC4M.jpg",
        "production_companies": [
            {
                "id": 82819,
                "logo_path": "/gXfFl9pRPaoaq14jybEn1pHeldr.png",
                "name": "Skydance",
                "origin_country": "US"
            },
            {
                "id": 83645,
                "logo_path": null,
                "name": "Huahua Media",
                "origin_country": "CN"
            },
            {
                "id": 3407,
                "logo_path": "/iVMjKOFyRvm9PW45lW1wW6TSvnj.png",
                "name": "Shanghai Film Group",
                "origin_country": "CN"
            },
            {
                "id": 21777,
                "logo_path": null,
                "name": "TC Productions",
                "origin_country": "US"
            },
            {
                "id": 4,
                "logo_path": "/gz66EfNoYPqHTYI4q9UEN4CbHRc.png",
                "name": "Paramount",
                "origin_country": "US"
            }
        ],
        "production_countries": [
            {
                "iso_3166_1": "CN",
                "name": "China"
            },
            {
                "iso_3166_1": "US",
                "name": "United States of America"
            }
        ],
        "release_date": "2016-10-19",
        "revenue": 162146076,
        "runtime": 118,
        "spoken_languages": [
            {
                "english_name": "English",
                "iso_639_1": "en",
                "name": "English"
            }
        ],
        "status": "Released",
        "tagline": "Justice is Coming.",
        "title": "Jack Reacher: Never Go Back",
        "video": false,
        "vote_average": 5.954,
        "vote_count": 4527
    }
""".data(using: .utf8)

let movieDetailResponse = try? JSONDecoder().decode(MovieDetailsModel.self, from: MovieDetailJsonResponse!)
