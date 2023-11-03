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
    let birthday: String?
    let gender: Int
    let id: Int
    let knownForDepartment: String
    let name: String
    let placeOfBirth: String
    let profilePath: String
    enum CodingKeys: String, CodingKey {
        case adult, name, biography, birthday, gender, id
        case knownForDepartment = "known_for_department"
        case placeOfBirth = "place_of_birth"
        case profilePath = "profile_path"
    }
}
