//
//  TVShowsVC.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 19/10/23.
//

import UIKit

class TVShowsVC: UIViewController {
    
    private let tvShowRepository = TVRepository()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        setupUI()
    }
    
    func setupUI() {
        
    }
    
    func setupTitle() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "TV Shows"
    }

}
