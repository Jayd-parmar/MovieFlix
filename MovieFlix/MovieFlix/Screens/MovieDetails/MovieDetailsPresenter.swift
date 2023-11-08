//
//  MovieDetailsPresenter.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 01/11/23.
//

import Foundation

class MovieDetailsPresenter: MovieDetailsViewToPresenterInterface {
    var view: MoviedetailsVCInterface?
    var interactor: MovieDetailsInteractorInterface?
    var router: MovieDetailsRouterInterface?
    var movieId: Int?
    var castList: CastListModel?
    var movieDetails: MovieDetailsModel?
    var video: VideoModel?
    var error: Error?

    init(movieId: Int?) {
        self.movieId = movieId
    }
    
    func viewDidLoad() {
        guard let movieId = movieId else { return }
        interactor?.getMovieDetails(modelType: MovieDetailsModel.self, type: EndPointMovieItems.movieDetails(id: movieId))
        interactor?.getMovieDetails(modelType: CastListModel.self, type: EndPointCastItems.movieCastList(id: movieId))
        interactor?.getMovieDetails(modelType: VideoModel.self, type: EndPointMovieItems.movieVideoDetails(id: movieId))
    }
    
    func convertDatatoCommonModel(data: MovieDetailsModel) {
        let image = Constant.URL.imgBaseUrl + data.backdropPath
        let title = data.title
        let genres = data.genres
        var genre: String = ""
        genres.forEach({item in genre = genre + item.name + "/"})
        genre.removeLast()
        let voteCount = "\(data.voteCount) Votes"
        let voteAverage = data.voteAverage
        let date = data.releaseDate.convertDate(date: data.releaseDate)
        let runtime = "\(data.runtime.description.convertMinutesToHoursMinutes(minutes: data.runtime))/ \(data.runtime) min"
        let language = "\(data.spokenLanguages[0].englishName)"
        let description = data.overview
        
        let model = CommonMovieTVDetailsModel(image: image, title: title, genre: genre, voteCount: voteCount, voteAve: voteAverage, date: date, runtime: runtime, language: language, episodes: nil, seasons: nil, description: description, imgTime: "clock", imgLanguage: "globe", imgTV: nil)
        view?.getMovieDetailsSuccess(data: model)
    }
    
    func navigateToCastDetails(indexPath: IndexPath) {
        let castId = castList?.cast[indexPath.row].id
        router?.navigateToCastDetails(castId: castId)
    }
    
}

extension MovieDetailsPresenter: MovieDetailsInteractorToPresenterInterface {
    
    func getMovieDetailSuccess<T: Codable>(data: T) {
        switch data {
        case is MovieDetailsModel:
            guard let data = data as? MovieDetailsModel else { return }
            self.movieDetails = data
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
    
    func getMovieDetailFailure(error: Error) {
        self.error = error
        view?.getMovieDetailFailure(error: error)
    }
}
