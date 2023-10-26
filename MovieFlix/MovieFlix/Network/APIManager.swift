//
//  APIManager.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 19/10/23.
//

import Foundation

typealias Handler<T> = (Result<T, DataError>) -> Void

final class APIManager {

    static let shared = APIManager()
    var request: URLRequest?
    init() {}
    
    func request<T: Codable>(
        modelType: T.Type,
        type: EndPointAPIType,
        completion: @escaping Handler<T>
    ) {
        guard let strURL = type.url else {
            completion(.failure(.invalidURL))
            return
        }
        
        if !(type.queryItems!.isEmpty) {
            var urlComps = URLComponents(string: strURL)
            urlComps?.queryItems = type.queryItems
            request = URLRequest(url: (urlComps?.url)!)
        } else {
            request = URLRequest(url: URL(string: strURL)!)
        }
        request?.httpMethod = type.methods.rawValue
        request?.allHTTPHeaderFields = type.headers
        
        URLSession.shared.dataTask(with: request!) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.invalidData))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }

            do {
                let response = try JSONDecoder().decode(modelType, from: data)
                completion(.success(response))
            } catch {
                print(error)
                completion(.failure(.network(error)))
            }
        }.resume()
    }
}
