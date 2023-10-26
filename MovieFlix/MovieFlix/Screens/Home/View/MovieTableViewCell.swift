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
        cv.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.backgroundColor = .red
        DispatchQueue.main.async {
            self.movieCollection.reloadData()
        }
        setupUI()
        setupUIConstraints()
        // Configure the view for the selected state
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
        if let popularMovieList = popularMovieList?.results {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell
            cell!.configureMovieCellDetails(popularMovieList[indexPath.row])
            return cell!
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell
            cell!.configureDefaultDetails()
            return cell!
        }
    }
}
