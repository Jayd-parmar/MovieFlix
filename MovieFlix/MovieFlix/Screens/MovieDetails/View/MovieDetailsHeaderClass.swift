//
//  MovieDetailsHeaderClass.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 01/11/23.
//

import Foundation
import UIKit

class MovieDetailsHeaderClass: UIView {
    private let imgMovie: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.setImage(with: Constant.URL.defaultImgUrl)
        image.contentMode = .scaleToFill
        return image
    }()
    private let movieTitle: UILabel = {
        let lbl = UILabel()
        lbl.font = .robotoSlabMedium(size: 25)
        lbl.numberOfLines = 0
        return lbl
    }()
    private let movieGenres: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .robotoSlabLight(size: 15)
        lbl.numberOfLines = 0
        return lbl
    }()
    private lazy var starContainer: UIStackView = {
        let view = createStar(voteAve: 8.67)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let lblVote: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .robotoSlabLight(size: 15)
        return lbl
    }()
    private lazy var starAndVoteContainer: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [starContainer, lblVote])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.spacing = 10
        return sv
    }()
    private lazy var movieTitleGenreSV: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [movieTitle, movieGenres, starAndVoteContainer])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.alignment = .leading
        sv.spacing = 5
        return sv
    }()
    private let lblDate: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .robotoSlabLight(size: 15)
        return lbl
    }()
    private let lblRunTime: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .robotoSlabLight(size: 15)
        return lbl
    }()
    private let lblLanguage: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .robotoSlabLight(size: 15)
        return lbl
    }()
    private lazy var movieDateTimeSV: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [lblDate, lblRunTime, lblLanguage])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.alignment = .leading
        sv.spacing = 5
        return sv
    }()
    private lazy var movieDetailSV: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [movieTitleGenreSV, movieDateTimeSV])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.alignment = .top
        sv.spacing = 5
        sv.axis = .horizontal
        return sv
    }()
    private let lblDescription: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .robotoSlabLight(size: 15)
        lbl.numberOfLines = 0
        return lbl
    }()
    private lazy var detailsContainerSV: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [imgMovie, movieDetailSV, lblDescription])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 5
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        addSubview(detailsContainerSV)
        NSLayoutConstraint.activate([
            detailsContainerSV.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            detailsContainerSV.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            detailsContainerSV.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            detailsContainerSV.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            imgMovie.heightAnchor.constraint(equalToConstant: 250),
            movieDateTimeSV.widthAnchor.constraint(equalToConstant: 100),
            movieDetailSV.widthAnchor.constraint(equalTo: detailsContainerSV.widthAnchor),
            lblDescription.topAnchor.constraint(equalTo: movieTitleGenreSV.bottomAnchor, constant: 10)
        ])
    }
}

extension MovieDetailsHeaderClass: MovieDetailsToViewInterface {
    
    func configureMovieDetails(data: CommonMovieTVDetailsModel) {
        imgMovie.setImage(with: data.image)
        movieTitle.text = data.title
        movieGenres.text = data.genre
        lblVote.text = data.voteCount
        lblDate.text = data.date
        lblRunTime.text = data.runtime
        lblLanguage.text = data.language
        lblDescription.text = data.description
    }
    
}
