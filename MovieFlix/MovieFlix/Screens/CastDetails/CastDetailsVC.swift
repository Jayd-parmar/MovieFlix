//
//  CastDetailsVC.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 19/10/23.
//

import UIKit

class CastDetailsVC: UIViewController, CastDetailsViewInterface {
    var presenter: CastDetailsViewToPresenterInterface?
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
    private let imgCast: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 50
        image.layer.borderWidth = 2
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        image.layer.borderColor = UIColor.white.cgColor
        image.setImage(with: Constant.URL.defaultImgUrl)
        return image
    }()
    private let lblCastName: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .robotoSlabMedium(size: 30)
        lbl.text = "Dwayne Johnson"
        return lbl
    }()
    private let lblKnowFor: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .robotoSlabLight(size: 15)
        lbl.text = "Acting"
        return lbl
    }()
    private let lblOverView: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .robotoSlabLight(size: 15)
        lbl.text = "Some description about actor"
        lbl.numberOfLines = 0
        return lbl
    }()
    private let titlePhotos: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .robotoSlabMedium(size: 25)
        lbl.text = "PHOTOS"
        return lbl
    }()
    private let titleKnownFor: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .robotoSlabMedium(size: 25)
        lbl.text = "KNOWN FOR"
        return lbl
    }()
    private lazy var photosCollectionView: CollectionViewContainer = {
        let cv = CollectionViewContainer(scrollDirection: .horizontal, itemSize: CGSize(width: 100, height: 150), cell: CollectionViewCell.self, identifier: CollectionViewCell.identifier)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.collectionView.showsHorizontalScrollIndicator = false
        return cv
    }()
    private lazy var knowForCollectionView: CollectionViewContainer = {
        let cv = CollectionViewContainer(scrollDirection: .horizontal, itemSize: CGSize(width: 120, height: 200), cell: CollectionViewCell.self, identifier: CollectionViewCell.identifier)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.collectionView.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupUIConstraints()
        presenter?.viewDidLoad()
    }
    
    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imgCast)
        contentView.addSubview(lblCastName)
        contentView.addSubview(lblKnowFor)
        contentView.addSubview(lblOverView)
        contentView.addSubview(titlePhotos)
        contentView.addSubview(photosCollectionView)
        contentView.addSubview(titleKnownFor)
        contentView.addSubview(knowForCollectionView)
    }
    
    private func setupUIConstraints() {
        setupConstraintsForScrollView()
        setupConstraintsForContentView()
        setupConstraintsForCastDetails()
        setupConstraintsForPhotos()
        setupConstraintsForKnowFor()
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
    
    private func setupConstraintsForCastDetails() {
        NSLayoutConstraint.activate([
            imgCast.topAnchor.constraint(equalTo: contentView.topAnchor),
            imgCast.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imgCast.widthAnchor.constraint(equalToConstant: 120),
            imgCast.heightAnchor.constraint(equalToConstant: 120),
            
            lblCastName.topAnchor.constraint(equalTo: imgCast.bottomAnchor),
            lblCastName.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            lblCastName.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            lblKnowFor.topAnchor.constraint(equalTo: lblCastName.bottomAnchor, constant: 5),
            lblKnowFor.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            lblKnowFor.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            lblOverView.topAnchor.constraint(equalTo: lblKnowFor.bottomAnchor, constant: 10),
            lblOverView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            lblOverView.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
    }
    
    private func setupConstraintsForPhotos() {
        NSLayoutConstraint.activate([
            titlePhotos.topAnchor.constraint(equalTo: lblOverView.bottomAnchor, constant: 10),
            titlePhotos.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            titlePhotos.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            photosCollectionView.topAnchor.constraint(equalTo: titlePhotos.bottomAnchor, constant: 10),
            photosCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            photosCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            photosCollectionView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func setupConstraintsForKnowFor() {
        NSLayoutConstraint.activate([
            titleKnownFor.topAnchor.constraint(equalTo: photosCollectionView.bottomAnchor, constant: 10),
            titleKnownFor.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            titleKnownFor.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            knowForCollectionView.topAnchor.constraint(equalTo: titleKnownFor.bottomAnchor, constant: 10),
            knowForCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            knowForCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            knowForCollectionView.heightAnchor.constraint(equalToConstant: 200),
            contentView.bottomAnchor.constraint(greaterThanOrEqualTo: knowForCollectionView.bottomAnchor, constant: 110)
        ])
    }
    
    func getCastDetailsSuccess(data: CastDetailsModel) {
        DispatchQueue.main.async {
            self.title = data.name
            self.imgCast.setImage(with: Constant.URL.imgBaseUrl + data.profilePath)
            self.lblCastName.text = data.name
            self.lblKnowFor.text = data.knownForDepartment
            self.lblOverView.text = data.biography
        }
    }
    
    func getCastImagesSuccess(data: [CustomCVModel]) {
        DispatchQueue.main.async {
            self.photosCollectionView.configContent(list: data)
            self.photosCollectionView.collectionView.reloadData()
        }
    }
    
    func getCastCombineSuccess(data: [CustomCVModel]) {
        DispatchQueue.main.async {
            self.knowForCollectionView.configContent(list: data)
            self.knowForCollectionView.collectionView.reloadData()
        }
    }
    
    func getCastDetailsFailure(error: Error) {
        print(error)
    }
}
