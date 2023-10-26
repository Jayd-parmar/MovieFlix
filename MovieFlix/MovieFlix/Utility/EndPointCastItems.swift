//
//  EndPointCastItems.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 20/10/23.
//

import Foundation

enum EndPointCastItems {
    case tvShowCastList(id: Int)
    case movieCastList(id: Int)
    case castDetails(id: Int)
    case castImages(id: Int)
    case castMovie(id: Int)
    case castTVShow(id: Int)
}

extension EndPointCastItems: EndPointAPIType {
    
    var path: String {
        switch self {
        case .tvShowCastList(let id):
            return "tv/\(id)/credits"
        case .movieCastList(let id):
            return "movie/\(id)/credits"
        case .castDetails(let id):
            return "person/\(id)"
        case .castImages(let id):
            return "person/\(id)/images"
        case .castMovie(let id):
            return "person/\(id)/movie_credits"
        case .castTVShow(let id):
            return "person/\(id)/tv_credits"
        }
    }
    
    var url: String? {
        return "\(Constant.URL.apiBaseUrl)\(path)"
    }
    
    var methods: HttpMethod {
        return .get
    }
    
    var headers: [String: String]? {
        return [
            "Content-Type": "application/json"
        ]
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .movieCastList, .tvShowCastList, .castDetails, .castMovie, .castTVShow:
            return [
                URLQueryItem(name: "api_key", value: Constant.apiKey),
                URLQueryItem(name: "language", value: "en-US")
            ]
        case .castImages:
            return [
                URLQueryItem(name: "api_key", value: Constant.apiKey)
            ]
        }
    }
}
