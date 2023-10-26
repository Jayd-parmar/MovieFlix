//
//  CollectionViewCell.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 26/10/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let imgMovie: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    let lblMovie: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .robotoSlabMedium(size: 15)
        lbl.text = "exxpendables"
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.addSubview(imgMovie)
        self.addSubview(lblMovie)
    }
    
    func setupConstraints() {
        imgMovie.height(180)
        imgMovie.edgesToSuperview(excluding: .bottom, insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        lblMovie.topToBottom(of: imgMovie, offset: 5)
        lblMovie.edgesToSuperview(excluding: [.top, .bottom], insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    func configureMovieCellDetails(_ data: ResultMovie) {
        let imagePath = Constant.URL.imgBaseUrl + (data.posterPath)
        imgMovie.setImage(with: imagePath)
        lblMovie.text = data.originalTitle
    }
    
    func configureDefaultDetails() {
        imgMovie.setImage(with: "https://image.tmdb.org/t/p/original/iwsMu0ehRPbtaSxqiaUDQB9qMWT.jpg")
        lblMovie.text = "Expandebles"
    }
}
