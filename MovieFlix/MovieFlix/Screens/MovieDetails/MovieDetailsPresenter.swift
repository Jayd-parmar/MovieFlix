//
//  MovieDetailsPresenter.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 01/11/23.
//

import Foundation

protocol MovieDetailsPresenterInterface {
    var movieId: Int? {get set}
    var view: MoviedetailsVCInterface? {get set}
    var interactor: MovieDetailsInteractorInterface? {get set}
    var router: MovieDetailsRouterInterface? {get set}
    
    func getMovieDetailsSuccess(data: MovieDetailsModel)
    func getMovieDetailsFailure(error: Error)
    func getCastSuccess(data: CastListModel)
    func getCastFailure(error: Error)
    
    func viewDidLoad()
}

class MovieDetailsPresenter: MovieDetailsPresenterInterface {
    var view: MoviedetailsVCInterface?
    var interactor: MovieDetailsInteractorInterface?
    var router: MovieDetailsRouterInterface?
    var movieId: Int?

    init(movieId: Int?) {
        self.movieId = movieId
    }
    
    func viewDidLoad() {
        interactor?.getMovieDetails(id: movieId ?? 500)
        interactor?.getMovieCastDetails(id: movieId ?? 500)
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
        
        let model = CommonMovieTVDetailsModel(image: image, title: title, genre: genre, voteCount: voteCount, voteAve: voteAverage, date: date, runtime: runtime, language: language, episodes: nil, seasons: nil, description: description)
        view?.getMovieDetailsSuccess(data: model)
    }
    
    func getMovieDetailsFailure(error: Error) {
        view?.getMovieDetailsFailure(error: error)
    }
    
    func getCastSuccess(data: CastListModel) {
        let result = data.cast.compactMap({ CustomCVModel(imagePath: $0.profilePath ?? "", title: $0.name ) }) 
        view?.getCastSuccess(data: result)
    }
    
    func getCastFailure(error: Error) {
        view?.getCastFailure(error: error)
    }
}
