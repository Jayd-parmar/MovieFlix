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
    let backdrop_path: String?
    let original_title: String?
    let original_name: String?
    let overview: String
    let poster_path: String?
}
