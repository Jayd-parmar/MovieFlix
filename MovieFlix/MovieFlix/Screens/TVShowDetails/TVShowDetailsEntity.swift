//
//  TVShowDetailsModel.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 20/10/23.
//

import Foundation

struct TVShowDetailsModel: Codable {
    let adult: Bool
    let backdropPath: String
    let firstAirDate: String
    let genres: [Genre]
    let id: Int
    let lastAirDate: String
    let name: String
    let numberOfEpisodes: Int
    let numberOfSeasons: Int
    let overview: String
    let posterPath: String
    let voteAverage: Double
    let voteCount: Int
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case genres
        case id
        case lastAirDate = "last_air_date"
        case name
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case overview
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
