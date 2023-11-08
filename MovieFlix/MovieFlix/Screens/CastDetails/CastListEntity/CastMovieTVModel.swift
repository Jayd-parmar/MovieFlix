//
//  CastMovieTVModel.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 20/10/23.
//

import Foundation

struct CastMovieTVModel: Codable {
    let cast: [CastMovie]
    let id: Int
}

struct CastMovie: Codable {
    let adult: Bool
    let backdropPath: String?
    let originalTitle: String?
    let originalName: String?
    let overview: String?
    let posterPath: String?
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case originalTitle = "original_title"
        case originalName = "original_name"
        case overview
        case posterPath = "poster_path"
    }
}
