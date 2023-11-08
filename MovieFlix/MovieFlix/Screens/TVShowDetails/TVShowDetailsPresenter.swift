//
//  TVShowDetailsPresenter.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 02/11/23.
//

import Foundation

class TVShowDetailsPresenter: TVShowDetailsViewtoPresenterInterface {
    var view: TVShowDetailsViewInterface?
    var interactor: TVShowDetailsInteractorInterface?
    var router: TVShowDetailsRouterInterface?
    var tvShowId: Int?
    var castList: CastListModel?
    var tvShowDetails: TVShowDetailsModel?
    var video: VideoModel?
    var error: Error?
    
    init(tvShowId: Int?) {
        self.tvShowId = tvShowId
    }
    
    func viewDidLoad() {
        guard let tvShowId = tvShowId else { return }
        interactor?.getTVShowDetail(modelType: TVShowDetailsModel.self, type: EndPointTVShowItems.tvShowDetails(id: tvShowId))
        interactor?.getTVShowDetail(modelType: CastListModel.self, type: EndPointCastItems.tvShowCastList(id: tvShowId))
        interactor?.getTVShowDetail(modelType: VideoModel.self, type: EndPointTVShowItems.tvShowVideDetails(id: tvShowId))
    }
    
    func convertDatatoCommonModel(data: TVShowDetailsModel) {
        let image = Constant.URL.imgBaseUrl + data.backdropPath
        let title = data.name
        let genres = data.genres
        var genre: String = ""
        genres.forEach({item in genre = genre + item.name + "/"})
        genre.removeLast()
        let voteCount = "\(data.voteCount) Votes"
        let voteAverage = data.voteAverage
        let date = data.firstAirDate.convertDate(date: data.firstAirDate)
        let episodes = "Episodes: \(data.numberOfEpisodes)"
        let seasons = "Seasons: \(data.numberOfSeasons)"
        let description = data.overview
        
        let model = CommonMovieTVDetailsModel(image: image, title: title, genre: genre, voteCount: voteCount, voteAve: voteAverage, date: date, runtime: nil, language: nil, episodes: episodes, seasons: seasons, description: description, imgTime: nil, imgLanguage: nil, imgTV: "tv")
        view?.getTVShowDetailsSuccess(data: model)
    }
    
    func navigateToCastDetails(indexPath: IndexPath) {
        let castId = castList?.cast[indexPath.row].id
        router?.navigateToCastDetails(castId: castId)
    }
}

extension TVShowDetailsPresenter: TVShowdetailsInteractorToPresenterInterface {
    
    func getTVShowDetailSuccess<T: Codable>(data: T) {
        switch data {
        case is TVShowDetailsModel:
            guard let data = data as? TVShowDetailsModel else { return }
            self.tvShowDetails = data
            convertDatatoCommonModel(data: data)
        case is CastListModel:
            guard let data = data as? CastListModel else { return }
            self.castList = data
            let result = data.cast.compactMap({ CustomCVModel(imagePath: $0.profilePath ?? "", title: $0.name ) })
            view?.getCastSuccess(data: result)
        case is VideoModel:
            guard let data = data as? VideoModel else { return }
            self.video = data
            let result = data.results.compactMap({ $0.key })
            view?.getVideoSuccess(data: result)
        default:
            break
        }
    }
    
    func getTVShowDetailsFailure(error: Error) {
        self.error = error
        view?.getTVShowDetailFailure(error: error)
    }
}
