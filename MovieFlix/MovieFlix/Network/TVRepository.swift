//
//  TVRepository.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 19/10/23.
//

import Foundation

protocol TVRepositoryDelegate: AnyObject {
    func getTvShowData<T: Codable>(
        modelType: T.Type,
        type: EndPointAPIType,
        completion: @escaping Handler<T>
    )
}

class TVRepository: TVRepositoryDelegate {
    
    func getTvShowData<T: Codable>(modelType: T.Type, type: EndPointAPIType, completion: @escaping Handler<T>) {
        APIManager.shared.request(modelType: modelType, type: type, completion: completion)
    }
}
