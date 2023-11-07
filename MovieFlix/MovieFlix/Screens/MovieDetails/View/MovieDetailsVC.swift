//
//  MovieDetailsVC.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 19/10/23.
//

import UIKit

class MovieDetailsVC: UIViewController, MoviedetailsVCInterface {
    var presenter: MovieDetailsViewToPresenterInterface?
    weak var delegate: MovieDetailsToViewInterface?
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.showsVerticalScrollIndicator = false
        return sv
    }()
    private let contentView: UIView = {
        let cv = UIView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    private let movieDetailsHeader: UIView = {
        let movieDetails = MovieDetailsHeaderClass()
        movieDetails.translatesAutoresizingMaskIntoConstraints = false
        return movieDetails
    }()
    private let lblVideo: UILabel = {
        let lbl = UILabel()
        lbl.font = .robotoSlabMedium(size: 20)
        lbl.text = "VIDEOS"
        return lbl
    }()
    private let lblCast: UILabel = {
        let lbl = UILabel()
        lbl.font = .robotoSlabMedium(size: 20)
        lbl.text = "CAST"
        return lbl
    }()
    private var videoCollectionView: CollectionViewContainer = {
        let cv = CollectionViewContainer(scrollDirection: .horizontal, itemSize: CGSize(width: 150, height: 100), cell: YoutubeCVCell.self, identifier: YoutubeCVCell.identifier)
        cv.collectionView.showsHorizontalScrollIndicator = false
        return cv
    }()
    private var castCollectionView: CollectionViewContainer = {
        let cv = CollectionViewContainer(scrollDirection: .horizontal, itemSize: CGSize(width: 120, height: 200), cell: CollectionViewCell.self, identifier: CollectionViewCell.identifier)
        cv.collectionView.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupUIConstraints()
        presenter?.viewDidLoad()
        castCollectionView.delegate = self
    }
        
    private func setupUI() {
        delegate = movieDetailsHeader as? MovieDetailsToViewInterface
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(movieDetailsHeader)
        let componentArray = [lblVideo, videoCollectionView, lblCast, castCollectionView]
        for component in componentArray {
            component.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(component)
        }
    }
    
    private func setupUIConstraints() {
        setupConstraintsForScrollView()
        setupConstraintsForContentView()
        setupConstraintsForMovieDetailsHeader()
        setupConstraintsForVideos()
        setupCosntraintsForCast()
    }
    
    private func setupConstraintsForScrollView() {
        NSLayoutConstraint.activate([
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }
    
    private func setupConstraintsForContentView() {
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    private func setupConstraintsForMovieDetailsHeader() {
        NSLayoutConstraint.activate([
            movieDetailsHeader.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieDetailsHeader.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
    }
    
    private func setupConstraintsForVideos() {
        NSLayoutConstraint.activate([
            lblVideo.topAnchor.constraint(equalTo: movieDetailsHeader.bottomAnchor, constant: 15),
            lblVideo.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            lblVideo.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            videoCollectionView.topAnchor.constraint(equalTo: lblVideo.bottomAnchor, constant: 15),
            videoCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            videoCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            videoCollectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupCosntraintsForCast() {
        NSLayoutConstraint.activate([
            lblCast.topAnchor.constraint(equalTo: videoCollectionView.bottomAnchor, constant: 15),
            lblCast.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            lblCast.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            castCollectionView.topAnchor.constraint(equalTo: lblCast.bottomAnchor, constant: 15),
            castCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            castCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            castCollectionView.heightAnchor.constraint(equalToConstant: 200),
            contentView.bottomAnchor.constraint(greaterThanOrEqualTo: castCollectionView.bottomAnchor, constant: 110)
        ])
    }
    
    func getMovieDetailsSuccess(data: CommonMovieTVDetailsModel) {
        DispatchQueue.main.async {
            self.title = data.title
            self.delegate?.configureMovieDetails(data: data)
        }
    }
    
    func getMovieDetailsFailure(error: Error) {
        print(error)
    }
    
    func getCastSuccess(data: [CustomCVModel]) {
        DispatchQueue.main.async {
            self.castCollectionView.configContent(list: data)
            self.castCollectionView.collectionView.reloadData()
        }
    }
    
    func getCastFailure(error: Error) {
        print(error)
    }
    
    func getVideoSuccess(data: [String]) {
        DispatchQueue.main.async {
            self.videoCollectionView.configContent(list: data)
            self.videoCollectionView.collectionView.reloadData()
        }
    }
    
    func getVideoFailure(error: Error) {
        print(error)
    }
}

extension MovieDetailsVC: CellActionDelegate {
    func afterClickingOnCell(indexPath: IndexPath) {
        presenter?.navigateToCastDetails(indexPath: indexPath)
    }
    
}

protocol MovieDetailsToViewInterface: AnyObject {
    func configureMovieDetails(data: CommonMovieTVDetailsModel)
}
