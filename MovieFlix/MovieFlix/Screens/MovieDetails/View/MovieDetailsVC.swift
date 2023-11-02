//
//  MovieDetailsVC.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 19/10/23.
//

import UIKit

class MovieDetailsVC: UIViewController {

    private let castRepository = CastRepository()
    private let movieRepository = MovieRepository()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
//        castRepository.getCastOfMovie()
        // movieRepository.getMovieDetaislById()

        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        
    }

}
