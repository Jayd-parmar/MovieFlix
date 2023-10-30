//
//  MovieTableViewCell.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 26/10/23.
//

import UIKit
import TinyConstraints

class MovieTableViewCell: UITableViewCell {
    var movieList: [MovieModel]? = []
    var popularMovieList: MovieModel?
    var movieCollection = {
        let cv = CollectionView(layoutConfig: LayoutConfiguration(scrollDirection: .horizontal, itemSize: CGSize(width: 150, height: 200), minimumLineSpacing: 20))
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.clipsToBounds = false
        cv.register(CollectionViewCell.self, forCellWithReuseIdentifier: Identifier.collectionViewIdentifier)
        return cv
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
        setupUIConstraints()
    }
    
    func setupUI() {
        self.addSubview(movieCollection)
        movieCollection.delegate = self
        movieCollection.dataSource = self
    }
    
    func setupUIConstraints() {
        movieCollection.edgesToSuperview()
    }

}

extension MovieTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard movieList?.isEmpty == false else { return 0 }
        return movieList?[movieCollection.tag].results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.collectionViewIdentifier, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        if let movieList = movieList?[movieCollection.tag].results {
            cell.configureMovieCellDetails(movieList[indexPath.row])
            return cell
        } else {
            cell.configureDefaultDetails()
            return cell
        }
    }
}
