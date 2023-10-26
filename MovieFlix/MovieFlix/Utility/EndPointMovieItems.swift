//
//  File.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 19/10/23.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
}

enum EndPointMovieItems {
    case popularMovie(page: Int = 1)
    case topRatedMovie(page: Int = 1)
    case upcomingMovie(page: Int = 1)
    case nowPlayingMovie(page: Int = 1)
    case movieDetails(id: Int)
}

extension EndPointMovieItems: EndPointAPIType {
    
    var path: String {
            switch self {
            case .popularMovie:
                return "movie/popular"
            case .topRatedMovie:
                return "movie/top_rated"
            case .upcomingMovie:
                return "movie/upcoming"
            case .nowPlayingMovie:
                return "movie/now_playing"
            case .movieDetails(let id):
                return "movie/\(id)"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
            case .movieDetails:
                return [
                    URLQueryItem(name: "api_key", value: Constant.apiKey),
                    URLQueryItem(name: "language", value: "en-US")
                ]
        case .popularMovie(let page), .topRatedMovie(let page), .nowPlayingMovie(let page), .upcomingMovie(let page):
                return [
                    URLQueryItem(name: "api_key", value: Constant.apiKey),
                    URLQueryItem(name: "language", value: "en-US"),
                    URLQueryItem(name: "page", value: "\(page)")
                ]
        }
    }

    var headers: [String: String]? {
        return [
            "Content-Type": "application/json"
        ]
    }
    
    var url: String? {
        return "\(Constant.URL.apiBaseUrl)\(path)"
    }
    
    var methods: HttpMethod {
        return .get
    }
}
