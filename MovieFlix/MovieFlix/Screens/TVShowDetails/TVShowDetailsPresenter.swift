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
    
    init(tvShowId: Int?) {
        self.tvShowId = tvShowId
    }
    
    func viewDidLoad() {
        interactor?.getTvShowDetails(id: tvShowId ?? 200)
        interactor?.getTvShowCastDetails(id: tvShowId ?? 200)
        interactor?.getTvShowVideo(id: tvShowId ?? 500)
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
    
    func getTVShowDetailsSuccess(data: TVShowDetailsModel) {
        convertDatatoCommonModel(data: data)
    }
    
    func getTVShowDetailsFailure(error: Error) {
        view?.getTVShowDetailsFailure(error: error)
    }
    
    func getCastSuccess(data: CastListModel) {
        self.castList = data
        let result = data.cast.compactMap({ CustomCVModel(imagePath: $0.profilePath ?? "", title: $0.name ) })
        view?.getCastSuccess(data: result)
    }
    
    func getCastFailure(error: Error) {
        view?.getCastFailure(error: error)
    }
    
    func getVideoSuccess(data: VideoModel) {
        let result = data.results.compactMap({ $0.key })
        view?.getVideoSuccess(data: result)
    }
    
    func getVideoFailure(error: Error) {
        view?.getVideoFailure(error: error)
    }
}
