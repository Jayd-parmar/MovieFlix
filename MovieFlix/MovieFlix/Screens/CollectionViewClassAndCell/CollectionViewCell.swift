//
//  CollectionViewCell.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 26/10/23.
//

import UIKit
import TinyConstraints

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"
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
    
    private func setupUI() {
        self.addSubview(imgMovie)
        self.addSubview(lblMovie)
    }
    
    private func setupConstraints() {
        imgMovie.height(180)
        imgMovie.edgesToSuperview(excluding: .bottom, insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        lblMovie.topToBottom(of: imgMovie, offset: 2)
        lblMovie.edgesToSuperview(excluding: [.top, .bottom], insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    func configureCellDetails(_ data: CustomCVModel) {
        lblMovie.text = data.title
        imgMovie.setImage(with: Constant.URL.imgBaseUrl + data.imagePath)
    }
}
