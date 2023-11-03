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
    let aspectRatio: Double
    let filePath: String
    let width: Int
    let voteAverage: Double
    let voteCount: Int
    enum CodingKeys: String, CodingKey {
        case aspectRatio = "aspect_ratio"
        case filePath = "file_path"
        case width
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
