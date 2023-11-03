//
//  MovieTableViewCell.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 26/10/23.
//

import UIKit
import TinyConstraints

class MovieTableViewCell: UITableViewCell {
    static let identifier = "MovieTableViewCell"
    var movieList: [MovieModel]? = []
    var collectionViewContainer: CollectionViewContainer = {
        let cv = CollectionViewContainer(scrollDirection: .horizontal, itemSize: CGSize(width: 120, height: 200), cell: CollectionViewCell.self, identifier: CollectionViewCell.identifier)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.collectionView.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
        setupUIConstraints()
    }
    
    private func setupUI() {
        self.addSubview(collectionViewContainer)
    }
    
    private func setupUIConstraints() {
        collectionViewContainer.edgesToSuperview()
    }
}
