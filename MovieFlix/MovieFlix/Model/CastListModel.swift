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
    let adult: Bool
    let gender: Int
    let id: Int
    let known_for_department: String
    let name: String
    let profile_path: String?
    let credit_id: String
    let department: String?
    let job: String?
}
