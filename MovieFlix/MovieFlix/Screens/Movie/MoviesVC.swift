//
//  MoviesVC.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 19/10/23.
//

import UIKit

class MoviesVC: UIViewController, MovieViewInterface {
    var presenter: MovieViewToPresenterInterface?
    private let contentView: UIView = {
        let cv = UIView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    private var collectionViewContainer: CollectionViewContainer = {
        let cv = CollectionViewContainer(scrollDirection: .vertical, itemSize: CGSize(width: UIScreen.main.bounds.width/3 - 20, height: 200), cell: CollectionViewCell.self, identifier: CollectionViewCell.identifier)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.collectionView.showsVerticalScrollIndicator = false
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        setupUI()
        setupUIConstraints()
        presenter?.viewDidLoad()
        collectionViewContainer.delegate = self
    }
    
    func setupTitle() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupUI() {
        self.title = Title.movie
        view.addSubview(contentView)
        contentView.addSubview(collectionViewContainer)
    }
    
    private func setupUIConstraints() {
        setupUIConstraintsForContentView()
        setupUIConstraintsForCollection()
    }
    
    private func setupUIConstraintsForContentView() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupUIConstraintsForCollection() {
        NSLayoutConstraint.activate([
            collectionViewContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionViewContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            collectionViewContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            collectionViewContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func popularMovieSuccess(list: [CustomCVModel]) {
        DispatchQueue.main.async {
            self.collectionViewContainer.configContent(list: list)
            self.collectionViewContainer.collectionView.reloadData()
        }
    }
    
    func popularMovieFailure(error: Error) {
        print(error)
    }

}

extension MoviesVC: CellActionDelegate {
    func afterClickingOnCell(indexPath: IndexPath) {
        presenter?.navigateToDetails(indexPath: indexPath)
    }
    
}
