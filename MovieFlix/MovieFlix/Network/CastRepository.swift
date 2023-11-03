//
//  PersonRepository.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 19/10/23.
//

import Foundation

protocol CastRepositoryDelegate: AnyObject {
    func getCastData<T: Codable>(
        modelType: T.Type,
        type: EndPointAPIType,
        completion: @escaping Handler<T>
    )
}

class CastRepository: CastRepositoryDelegate {
    func getCastData<T: Codable>(modelType: T.Type, type: EndPointAPIType, completion: @escaping Handler<T>) {
        APIManager.shared.request(modelType: modelType, type: type, completion: completion)
    }
}
