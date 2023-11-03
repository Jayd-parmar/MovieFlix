//
//  CastListModel.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 20/10/23.
//

import Foundation

struct CastListModel: Codable {
    let cast: [Cast]
    let crew: [Cast]
    let id: Int
}

struct Cast: Codable {
    let id: Int
    let name: String
    let profilePath: String?
    enum CodingKeys: String, CodingKey {
        case id, name
        case profilePath = "profile_path"
    }
}
