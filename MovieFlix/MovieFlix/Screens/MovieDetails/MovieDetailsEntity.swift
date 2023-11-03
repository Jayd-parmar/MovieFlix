//
//  MovieDetailsModel.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 20/10/23.
//

import Foundation

struct MovieDetailsModel: Codable {
    let backdropPath: String
    let belongsToCollection: BelongCollection?
    let genres: [Genre]
    let homepage: String
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    let runtime: Int
    let spokenLanguages: [Language]
    let status: String
    let tagline: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    enum CodingKeys: String, CodingKey {
        case genres, homepage, id, overview, runtime, status, tagline, title, video
        case backdropPath = "backdrop_path"
        case belongsToCollection = "belongs_to_collection"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case spokenLanguages = "spoken_languages"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct BelongCollection: Codable {
    let id: Int?
    let name: String?
    let posterPath: String?
    let backdropPath: String?
    enum CodingKeys: String, CodingKey {
        case id, name
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}

struct Genre: Codable {
    let id: Int
    let name: String
}

struct Language: Codable {
    let englishName: String
    let iso6391: String
    let name: String
    enum CodingKeys: String, CodingKey {
        case name
        case englishName = "english_name"
        case iso6391 = "iso_639_1"
    }
}

struct CommonMovieTVDetailsModel {
    let image: String
    let title: String
    let genre: String
    let voteCount: String
    let voteAve: Double
    let date: String
    let runtime: String?
    let language: String?
    let episodes: String?
    let seasons: String?
    let description: String
    let imgTime: String?
    let imgLanguage: String?
    let imgTV: String?
}
