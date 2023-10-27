//
//  TVShowEntity.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 26/10/23.
//

import Foundation

struct TVShowModel: Codable {
    let page: Int
    let results: [ResultTv]
    let totalPages: Int
    let totalResults: Int
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct ResultTv: Codable {
    let backdropPath: String
    let genreIds: [Int]
    let id: Int
    let name: String?
    let originalLanguage: String
    let originalName: String?
    let posterPath: String
    let voteAverage: Double
    let voteCount: Int
    enum CodingKeys: String, CodingKey {
        case id, name
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
