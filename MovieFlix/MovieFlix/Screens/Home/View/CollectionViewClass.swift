//
//  CollectionViewClass.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 27/10/23.
//

import UIKit

struct LayoutConfiguration {
  let scrollDirection: UICollectionView.ScrollDirection
  let itemSize: CGSize
  let minimumLineSpacing: CGFloat
}

class CollectionView: UICollectionView {
    
    init(layoutConfig: LayoutConfiguration) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = layoutConfig.scrollDirection
        layout.itemSize = layoutConfig.itemSize
        layout.minimumLineSpacing = layoutConfig.minimumLineSpacing
        super.init(frame: .zero, collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
