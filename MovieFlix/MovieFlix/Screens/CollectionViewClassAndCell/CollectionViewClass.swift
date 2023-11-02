//
//  CollectionViewClass.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 27/10/23.
//
import UIKit

class CollectionViewContainer: UIView {
    var collectionView: UICollectionView!
    var list: [CustomCVModel] = []
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

    func configContent(list: [CustomCVModel]) {
        self.list = list
    }
}

extension CollectionViewContainer: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.collectionViewIdentifier, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configureCellDetails(list[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.afterClickingOnCell(indexPath: indexPath)
    }
}

protocol CellActionDelegate: AnyObject {
    func afterClickingOnCell(indexPath: IndexPath)
}
