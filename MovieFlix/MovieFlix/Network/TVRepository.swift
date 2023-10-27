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
    
    
//    var eventHandler: ((Event) -> Void)?
//    var popularTVShows: TVShowModel?
//    var tvShowDetails: TVShowDetailsModel?
//
//    func getPopularTVShows() {
//        self.eventHandler?(.loading)
//        APIManager.shared.request(modelType: TVShowModel.self, type: EndPointTVShowItems.popularTVShow()) { response in
//            self.eventHandler?(.stopLoading)
//                switch response {
//                case .success(let tvShow):
//                    self.popularTVShows = tvShow
//                    print("Popular TV Shows: \(self.popularTVShows!)")
//                    print("-------------------------------------------------------------------")
//                    self.eventHandler?(.dataLoaded)
//                case .failure(let error):
//                    self.eventHandler?(.error(error))
//            }
//        }
//    }
//
//    func getTVShowDetails() {
//        self.eventHandler?(.loading)
//        let tvId = 233643
//        APIManager.shared.request(modelType: TVShowDetailsModel.self, type: EndPointTVShowItems.tvShowDetails(id: tvId)) { response in
//            self.eventHandler?(.stopLoading)
//                switch response {
//                case .success(let tvShow):
//                    self.tvShowDetails = tvShow
//                    print("TV Shows Details: \(self.tvShowDetails!)")
//                    print("-------------------------------------------------------------------")
//                    self.eventHandler?(.dataLoaded)
//                case .failure(let error):
//                    self.eventHandler?(.error(error))
//            }
//        }
//    }
    
}
