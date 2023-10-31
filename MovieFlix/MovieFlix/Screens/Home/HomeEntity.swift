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
    let totalPages: Int
    let totalResults: Int
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct ResultMovie: Codable {
    let backdropPath: String?
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String?
    let originalName: String?
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String?
    let voteAverage: Double
    let voteCount: Int
    enum CodingKeys: String, CodingKey {
        case id, overview, popularity
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case originalName = "original_name"
    }
}

struct ResponseModel {
    let enumType: MovieEnum
    let data: MovieModel
}
