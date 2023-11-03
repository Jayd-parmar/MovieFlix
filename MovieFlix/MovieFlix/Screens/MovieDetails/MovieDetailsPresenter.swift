//
//  MovieDetailsPresenter.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 01/11/23.
//

import Foundation

class MovieDetailsPresenter: MovieDetailsPresenterInterface {
    var view: MoviedetailsVCInterface?
    var interactor: MovieDetailsInteractorInterface?
    var router: MovieDetailsRouterInterface?
    var movieId: Int?
    var castList: CastListModel?

    init(movieId: Int?) {
        self.movieId = movieId
    }
    
    func viewDidLoad() {
        interactor?.getMovieDetails(id: movieId ?? 500)
        interactor?.getMovieCastDetails(id: movieId ?? 500)
        interactor?.getMovieVideo(id: movieId ?? 500)
    }
    
    func getMovieDetailsSuccess(data: MovieDetailsModel) {
        convertDatatoCommonModel(data: data)
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
    
    func getMovieDetailsFailure(error: Error) {
        view?.getMovieDetailsFailure(error: error)
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
    
    func navigateToCastDetails(indexPath: IndexPath) {
        let castId = castList?.cast[indexPath.row].id
        router?.navigateToCastDetails(castId: castId)
    }
    
}
