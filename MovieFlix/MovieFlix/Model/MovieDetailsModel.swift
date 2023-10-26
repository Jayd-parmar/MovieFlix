//
//  MovieDetailsModel.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 20/10/23.
//

import Foundation

struct MovieDetailsModel: Codable {
    let adult: Bool
    let backdrop_path: String
    let belongs_to_collection: BelongCollection
    let budget: Int
    let genres: [Genre]
    let homepage: String
    let id: Int
    let imdb_id: String
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Double
    let poster_path: String
    let release_date: String
    let revenue: Int
    let runtime: Int
    let spoken_languages: [Language]
    let status: String
    let tagline: String
    let title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
}

struct BelongCollection: Codable {
    let id: Int
    let name: String
    let poster_path: String
    let backdrop_path: String
}

struct Genre: Codable {
    let id: Int
    let name: String
}

struct Language: Codable {
    let english_name: String
    let iso_639_1: String
    let name: String
}
