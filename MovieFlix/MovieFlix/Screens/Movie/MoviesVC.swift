//
//  MoviesVC.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 19/10/23.
//

import UIKit

protocol MovieViewInterface {
    var presenter: MoviePresenterInterface? {get set}
    func popularMovieSuccess()
    func popularMovieFailure(error: Error)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
}

class MoviesVC: UIViewController, MovieViewInterface {
    var presenter: MoviePresenterInterface?
    private let contentView: UIView = {
        let cv = UIView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    private let movieCollection = {
        let cv = CollectionView(layoutConfig: LayoutConfiguration(scrollDirection: .vertical, itemSize: CGSize(width: UIScreen.main.bounds.width/3 - 20, height: 200), minimumLineSpacing: 20))
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.clipsToBounds = false
        cv.register(CollectionViewCell.self, forCellWithReuseIdentifier: Identifier.collectionViewIdentifier)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        setupUI()
        setDelegateAndDataSourceCollection()
        setupUIConstraints()
        presenter?.getMovieData()
    }
    
    func setupTitle() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = Title.movie
    }
    
    func setupUI() {
        view.addSubview(contentView)
        contentView.addSubview(movieCollection)
    }
    
    func setDelegateAndDataSourceCollection() {
        movieCollection.delegate = self
        movieCollection.dataSource = self
    }
    
    func setupUIConstraints() {
        setupUIConstraintsForContentView()
        setupUIConstraintsForCollection()
    }
    
    func setupUIConstraintsForContentView() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupUIConstraintsForCollection() {
        NSLayoutConstraint.activate([
            movieCollection.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieCollection.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            movieCollection.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            movieCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func popularMovieSuccess() {
        DispatchQueue.main.async {
            self.movieCollection.reloadData()
        }
    }
    
    func popularMovieFailure(error: Error) {
        print(error)
    }

}

extension MoviesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getItemCount ?? 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.collectionViewIdentifier, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        if let movieList = presenter?.movieList?.results {
            cell.configureMovieCellDetails(movieList[indexPath.row])
            return cell
        } else {
            cell.configureDefaultDetails()
            return cell
        }
    }
}
