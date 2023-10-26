//
//  EndPointApiType.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 20/10/23.
//

import Foundation

protocol EndPointAPIType {
    var path: String { get }
    var url: String? { get }
    var methods: HttpMethod { get }
    var headers: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
}
