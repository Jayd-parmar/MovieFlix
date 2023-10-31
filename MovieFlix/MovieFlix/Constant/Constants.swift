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

enum Identifier {
    static let collectionViewIdentifier = "collectionViewCell"
    static let tableViewIdentifier = "movieTableViewCell"
}

enum BtnTitle {
    static let ShowAll = "Show All"
}
