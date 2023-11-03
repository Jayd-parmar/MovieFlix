//
//  VideoModel.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 03/11/23.
//

import Foundation

struct VideoModel: Codable {
    let id: Int
    let results: [VideoResult]
}

struct VideoResult: Codable {
    let key: String
    let id: String
}
