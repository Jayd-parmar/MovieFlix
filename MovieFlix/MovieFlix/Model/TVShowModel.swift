//
//  TVShowModel.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 20/10/23.
//

import Foundation

struct TVShowModel: Codable {
    let page: Int
    let results: [ResultTVShow]
    let total_pages: Int
    let total_results: Int
}

struct ResultTVShow: Codable {
    let backdrop_path: String
    let genre_ids: [Int]
    let id: Int
    let name: String?
    let original_language: String
    let original_name: String?
    let poster_path: String
    let vote_average: Double
    let vote_count: Int
}
