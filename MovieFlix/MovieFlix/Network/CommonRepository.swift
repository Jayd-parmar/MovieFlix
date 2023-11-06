//
//  MovieRepository.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 19/10/23.
//

import Foundation

protocol CommonRepositoryDelegate: AnyObject {
    func getMovieData<T: Codable>(
        modelType: T.Type,
        type: EndPointAPIType,
        completion: @escaping Handler<T>
    )
}

class CommonMovieRepository: CommonRepositoryDelegate {
    
    func getMovieData<T: Codable>(modelType: T.Type, type: EndPointAPIType, completion: @escaping Handler<T>) {
        APIManager.shared.request(modelType: modelType, type: type, completion: completion)
    }
}
