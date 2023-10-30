//
//  CollectionViewCell.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 26/10/23.
//

import UIKit
import TinyConstraints

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
        let imagePath = Constant.URL.imgBaseUrl + data.posterPath
        imgMovie.setImage(with: imagePath)
        lblMovie.text = data.originalTitle
    }
    
    func configureDefaultDetails() {
        imgMovie.setImage(with: Constant.URL.defaultImgUrl)
        lblMovie.text = Movie.defaultMovieName
    }
    
    func configureTVCellDetails(_ data: ResultTv) {
        let imagePath = Constant.URL.imgBaseUrl + data.posterPath
        imgMovie.setImage(with: imagePath)
        lblMovie.text = data.originalName
    }
    
    func configureTvCellDetails(title: String, imagePath: String) {
        lblMovie.text = title
        imgMovie.setImage(with: Constant.URL.imgBaseUrl + imagePath)
    }
}
