//
//  MoviesVC.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 19/10/23.
//

import UIKit

protocol MovieViewInterface {
    var presenter: MoviePresenterInterface? {get set}
}

class MoviesVC: UIViewController, MovieViewInterface {
    
    var presenter: MoviePresenterInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        
    }
    
    func setupTitle() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Movies"
    }

}
