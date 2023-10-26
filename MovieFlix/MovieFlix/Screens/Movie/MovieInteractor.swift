//
//  MovieInteractor.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 26/10/23.
//

import Foundation

protocol MovieInteractorInterface {
    var presenter: MoviePresenterInterface? {get set}
}

class MovieInteractor: MovieInteractorInterface {
    var presenter: MoviePresenterInterface?
    
}
