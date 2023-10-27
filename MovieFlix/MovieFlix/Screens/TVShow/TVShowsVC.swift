//
//  TVShowsVC.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 19/10/23.
//

import UIKit

protocol TVViewInterface {
    var presenter: TVPresenterInterface? {get set}
    func getPopularTVShowSuccess()
    func getPopularTVShowFailure(error: Error)
}

class TVShowsVC: UIViewController, TVViewInterface {
    var presenter: TVPresenterInterface?
    private let contentView: UIView = {
        let cv = UIView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    private let tvCollection = {
        let cv = CollectionView(layoutConfig: LayoutConfiguration(scrollDirection: .vertical, itemSize: CGSize(width: 120, height: 200), minimumLineSpacing: 20))
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
        presenter?.getTVShowData()
    }
    
    func setupTitle() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = Title.tv
    }
    
    func setupUI() {
        view.addSubview(contentView)
        contentView.addSubview(tvCollection)
    }
    
    func setDelegateAndDataSourceCollection() {
        tvCollection.delegate = self
        tvCollection.dataSource = self
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
            tvCollection.topAnchor.constraint(equalTo: contentView.topAnchor),
            tvCollection.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            tvCollection.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            tvCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func getPopularTVShowSuccess() {
        DispatchQueue.main.async {
            self.tvCollection.reloadData()
        }
    }
    
    func getPopularTVShowFailure(error: Error) {
        print(error)
    }
}

extension TVShowsVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getItemCount ?? 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.collectionViewIdentifier, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        if let tvList = presenter?.tvShowList?.results {
            cell.configureTVCellDetails(tvList[indexPath.row])
            return cell
        } else {
            cell.configureDefaultDetails()
            return cell
        }
    }
    
    
}
