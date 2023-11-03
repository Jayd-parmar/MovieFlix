//
//  CastImageModel.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 20/10/23.
//

import Foundation

struct CastImageModel: Codable {
    let id: Int
    let profiles: [Profile]
}

struct Profile: Codable {
    let aspect_ratio: Double
    let file_path: String
    let width: Int
    let vote_average: Double
    let vote_count: Int
}
