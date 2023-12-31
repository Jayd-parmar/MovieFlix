//
//  Constants.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 19/10/23.
//

import Foundation

enum Constant {
    enum URL {
        static let apiBaseUrl = "https://api.themoviedb.org/3/"
        static let imgBaseUrl = "https://image.tmdb.org/t/p/original/"
        static let defaultImgUrl = "https://image.tmdb.org/t/p/original/iwsMu0ehRPbtaSxqiaUDQB9qMWT.jpg"
        static let youtubeBaseUrl = "https://www.youtube.com/embed/"
    }
    static let apiKey = "b344471bf864db8656c45f955ac375fe"
}

enum IconTitle {
    static let home = "Home"
    static let movie = "Movies"
    static let tv = "TV Shows"
}

enum Title {
    static let home = "Home"
    static let movie = "Movies"
    static let tv = "TV Shows"
}

enum IconName {
    static let homeBeforeClick = "house"
    static let homeAfterClick = "play.house.fill"
    static let movieBeforeClick = "movieclapper"
    static let movieAfterClick = "movieclapper.fill"
    static let tvBeforeClick = "tv"
    static let tvAfterClick = "play.tv"
    static let fillStar = "star.fill"
    static let emptyStar = "star"
}

enum Movie {
    static let defaultMovieName = "Expandebles"
}

enum BtnTitle {
    static let ShowAll = "Show All"
}

enum HeaderTitle {
    static let headerTitles = ["Popular", "In Theaters", "Upcoming", "Top Rated"]
}

enum GenreList {
    static let genres = [Genre(id: 1, name: "All"), Genre(id: 28, name: "Action"), Genre(id: 35, name: "Comedy"), Genre(id: 80, name: "Crime"), Genre(id: 27, name: "Horror")]
}
