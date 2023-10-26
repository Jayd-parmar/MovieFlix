//
//  EventEnum.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 20/10/23.
//

import Foundation

enum Event {
    case loading
    case stopLoading
    case dataLoaded
    case error(Error?)
}
