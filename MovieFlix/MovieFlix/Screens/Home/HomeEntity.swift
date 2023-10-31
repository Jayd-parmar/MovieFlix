//
//  PopularMovieModel.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 19/10/23.
//

import Foundation

struct MovieModel: Codable {
    let page: Int
    let results: [ResultMovie]
    enum CodingKeys: String, CodingKey {
        case page, results
    }
}

struct ResultMovie: Codable {
    let backdropPath: String?
    let genreIds: [Int]
    let id: Int
    let originalTitle: String?
    let originalName: String?
    let posterPath: String
    let voteAverage: Double
    let voteCount: Int
    enum CodingKeys: String, CodingKey {
        case id
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case originalName = "original_name"
    }
}

struct ResponseModel {
    let enumType: MovieEnum
    let data: MovieModel
}
