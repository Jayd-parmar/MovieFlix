//
//  CastDetailsModel.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 20/10/23.
//

import Foundation

struct CastDetailsModel: Codable {
    let adult: Bool
    let biography: String
    let birthday: String
    let gender: Int
    let id: Int
    let known_for_department: String
    let name: String
    let place_of_birth: String
    let profile_path: String
}
