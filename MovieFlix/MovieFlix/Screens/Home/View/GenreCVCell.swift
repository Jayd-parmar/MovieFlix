//
//  GenreCVCell.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 31/10/23.
//

import UIKit

class GenreCVCell: UICollectionViewCell {
    
    let btnGenre: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("text", for: .normal)
        btn.titleLabel?.font = .robotoSlabLight(size: 15)
        btn.backgroundColor = .black
        return btn
    }()
    var delegate: GenreCollectionDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
        btnGenre.addTarget(self, action: #selector(genreBtnTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.addSubview(btnGenre)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            btnGenre.topAnchor.constraint(equalTo: contentView.topAnchor),
            btnGenre.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            btnGenre.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            btnGenre.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configContent(_ data: Genre?) {
        btnGenre.setTitle(data?.name, for: .normal)
    }
    
    @objc func genreBtnTapped() {
        delegate?.didTapButton(btnGenre.tag)
    }
}

protocol GenreCollectionDelegate: AnyObject {
    func didTapButton(_ index: Int)
}
