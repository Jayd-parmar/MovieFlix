//
//  TVShowDetailsModel.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 20/10/23.
//

import Foundation

struct TVShowDetailsModel: Codable {
    let adult: Bool
    let backdrop_path: String
    let created_by: [String]
    let first_air_date: String
    let genres: [Genre]
    let id: Int
    let last_air_date: String
    let name: String
    let number_of_episodes: Int
    let number_of_seasons: Int
    let overview: String
    let popularity: Double
    let poster_path: String
    let vote_average: Double
    let vote_count: Int
}
