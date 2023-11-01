//
//  CollectionViewClass.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 27/10/23.
//
import UIKit

class CollectionViewContainer: UIView {
    var collectionView: UICollectionView!
    var list: MovieModel?
    weak var delegate: CellActionDelegate?

    init(scrollDirection: UICollectionView.ScrollDirection, itemSize: CGSize) {
        super.init(frame: .zero)
        setupLayout(scrollDirection: scrollDirection, itemSize: itemSize)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLayout(scrollDirection: UICollectionView.ScrollDirection, itemSize: CGSize) {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = scrollDirection
        collectionLayout.itemSize = itemSize
        collectionLayout.minimumLineSpacing = 20

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(CollectionViewCell.self,
                                 forCellWithReuseIdentifier: Identifier.collectionViewIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(collectionView)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func configContent(list: MovieModel?) {
        self.list = list
    }
}

extension CollectionViewContainer: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list?.results.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.collectionViewIdentifier, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        let listDetails = list?.results[indexPath.row]
        cell.configureCellDetails(title: (listDetails?.originalName ?? listDetails?.originalTitle) ?? "",
                                    imagePath: listDetails?.posterPath ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.afterClickingOnCell(id: list?.results[indexPath.row].id ?? 500)
    }
}

protocol CellActionDelegate: AnyObject {
    func afterClickingOnCell(id: Int)
}
