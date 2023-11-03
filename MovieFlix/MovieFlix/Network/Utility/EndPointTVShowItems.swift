//
//  EndPointTVShowItem.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 20/10/23.
//

import Foundation

enum EndPointTVShowItems {
    case popularTVShow(page: Int = 1)
    case tvShowDetails(id: Int)
    case tvShowVideDetails(id: Int)
}

extension EndPointTVShowItems: EndPointAPIType {
    
    var path: String {
        switch self {
        case .popularTVShow:
            return "tv/popular"
        case .tvShowDetails(let id):
            return "tv/\(id)"
        case .tvShowVideDetails(let id):
            return "tv/\(id)/videos"
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
        case .tvShowDetails, .tvShowVideDetails:
                return [
                    URLQueryItem(name: "api_key", value: Constant.apiKey),
                    URLQueryItem(name: "language", value: "en-US")
                ]
        case .popularTVShow(let page):
                return [
                    URLQueryItem(name: "api_key", value: Constant.apiKey),
                    URLQueryItem(name: "language", value: "en-US"),
                    URLQueryItem(name: "page", value: "\(page)")
                ]
        }
    }
    
}
