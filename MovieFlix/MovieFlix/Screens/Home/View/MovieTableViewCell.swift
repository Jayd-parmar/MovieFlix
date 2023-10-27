//
//  MovieTableViewCell.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 26/10/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    var popularMovieList: MovieModel?
    let movieCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 150, height: 200)
        layout.minimumLineSpacing = 20
        let cv = UICollectionView( frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.clipsToBounds = false
        cv.register(CollectionViewCell.self, forCellWithReuseIdentifier: Identifier.collectionViewIdentifier)
        return cv
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        DispatchQueue.main.async {
            self.movieCollection.reloadData()
        }
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
        return popularMovieList?.results.count ?? 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.collectionViewIdentifier, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        if let popularMovieList = popularMovieList?.results {
            cell.configureMovieCellDetails(popularMovieList[indexPath.row])
            return cell
        } else {
            cell.configureDefaultDetails()
            return cell
        }
    }
}
