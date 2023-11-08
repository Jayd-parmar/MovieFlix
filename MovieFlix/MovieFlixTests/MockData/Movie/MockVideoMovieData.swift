//
//  MockVideoMovieData.swift
//  MovieFlixTests
//
//  Created by Jaydip Parmar on 08/11/23.
//

import Foundation
@testable import MovieFlix

let videoJsonResponse = """
    {
        "id": 343611,
        "results": [
            {
                "iso_639_1": "en",
                "iso_3166_1": "US",
                "name": "Jack Reacher: Never Go Back (2016) - IMAX Trailer - Paramount Pictures",
                "key": "DTBcGQWmQ1c",
                "published_at": "2016-09-29T16:00:00.000Z",
                "site": "YouTube",
                "size": 1080,
                "type": "Trailer",
                "official": true,
                "id": "58ba538dc3a368668f0148b8"
            },
            {
                "iso_639_1": "en",
                "iso_3166_1": "US",
                "name": "Jack Reacher: Never Go Back (2016) - Find Spot - Paramount Pictures",
                "key": "fm9Ol-Cq7_s",
                "published_at": "2016-09-13T18:07:31.000Z",
                "site": "YouTube",
                "size": 1080,
                "type": "Teaser",
                "official": true,
                "id": "57d95e019251416851005d34"
            },
            {
                "iso_639_1": "en",
                "iso_3166_1": "US",
                "name": "Jack Reacher: Never Go Back (2016) - Command Spot - Paramount Pictures",
                "key": "k3kzqVliF48",
                "published_at": "2016-09-02T17:31:00.000Z",
                "site": "YouTube",
                "size": 1080,
                "type": "Teaser",
                "official": true,
                "id": "57d95e2dc3a36852e0005a62"
            },
            {
                "iso_639_1": "en",
                "iso_3166_1": "US",
                "name": "Jack Reacher: Never Go Back (2016) - Followed Spot - Paramount Pictures",
                "key": "51nZS-a7mMY",
                "published_at": "2016-08-10T20:02:47.000Z",
                "site": "YouTube",
                "size": 1080,
                "type": "Teaser",
                "official": true,
                "id": "57d95e49925141670f006166"
            },
            {
                "iso_639_1": "en",
                "iso_3166_1": "US",
                "name": "Jack Reacher: Never Go Back Trailer (2016) - Paramount Pictures",
                "key": "aoCP_JHzBUM",
                "published_at": "2016-06-22T12:00:03.000Z",
                "site": "YouTube",
                "size": 1080,
                "type": "Trailer",
                "official": true,
                "id": "58ba535c9251416077018228"
            }
        ]
    }
""".data(using: .utf8)

func getMovieVideoData() -> VideoModel? {
    let response: VideoModel?
    do {
        guard let data = videoJsonResponse else {
            print("nil returned data \n\n")
            return nil
        }
        response =  try JSONDecoder().decode(VideoModel.self, from: data)
    } catch(let error){
        print("error in decode : \(error) \n\n")
        return nil
    }
    return response
}
