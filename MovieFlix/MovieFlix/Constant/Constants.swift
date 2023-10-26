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
    }
    static let apiKey = "b344471bf864db8656c45f955ac375fe"
}

enum IconTitle {
    static let home = "Home"
    static let movie = "Movies"
    static let tv = "TV Shows"
}

enum IconName {
    static let homeBeforeClick = "house"
    static let homeAfterClick = "play.house"
    static let movieBeforeClick = "movieclapper"
    static let tvBeforeClick = "tv"
    static let tvAfterClick = "play.tv"
}
