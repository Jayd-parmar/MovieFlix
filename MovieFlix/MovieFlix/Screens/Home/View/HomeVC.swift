//
//  HomeVC.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 19/10/23.
//

import UIKit
import TinyConstraints

protocol HomeViewInterface {
    var presenter: HomePresenterInterface? {get set}
    func popularMovieSuccess()
    func popularMovieFailure(error: Error)
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    func numberOfSections(in tableView: UITableView) -> Int
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
}

class HomeVC: UIViewController, HomeViewInterface {
    
    var presenter: HomePresenterInterface?
    private let contentView: UIView = {
        let cv = UIView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    private let movieTableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(MovieTableViewCell.self, forCellReuseIdentifier: Identifier.tableViewIdentifier)
        tv.showsVerticalScrollIndicator = false
        return tv
    }()
    private let imgHeader: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.setImage(with: Constant.URL.defaultImgUrl)
        return image
    }()
    private let lblHeader: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Expend4bles"
        lbl.font = .robotoSlabMedium(size: 40)
        return lbl
    }()
    private let starContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()
    private let lblVote: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "496 Votes"
        lbl.font = .robotoSlabLight(size: 15)
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        setupUI()
        setupConstraints()
        presenter?.getPopularMovieList()
    }
    
    func setupTitle() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = IconTitle.home
    }
    
    func setupUI() {
        view.addSubview(contentView)
        contentView.addSubview(movieTableView)
    }
    
    func setupConstraints() {
        setupConstraintsOfContentView()
        setupConstraintsForTableView()
    }
    
    func setupConstraintsOfContentView() {
        contentView.edgesToSuperview(usingSafeArea: true)
    }
    
    func setupConstraintsForTableView() {
        movieTableView.edgesToSuperview()
        setupHeaderForTableView()
    }
    
    func setupHeaderForTableView() {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: 300))
        header.addSubview(imgHeader)
        header.addSubview(lblHeader)
        header.addSubview(starContainer)
        header.addSubview(lblVote)
        movieTableView.tableHeaderView = header
        setDelegateAndDataSourceTable()
        setupConstraintsForHeader()
    }
    
    func setDelegateAndDataSourceTable() {
        movieTableView.delegate = self
        movieTableView.dataSource = self
    }
    
    func setupConstraintsForHeader() {
        setupConstraintsForImgHeader()
        setupConstraintsForLblHeader()
        setupConstraintsForStarContainer()
        setupStar()
        setupConstraintsForLblVote()
    }
    
    func setupConstraintsForImgHeader() {
        imgHeader.height(250)
        imgHeader.edgesToSuperview(insets: UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0))
    }
    
    func setupConstraintsForLblHeader() {
        lblHeader.topToBottom(of: imgHeader, offset: -45)
        lblHeader.edgesToSuperview(excluding: [.top, .bottom], insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    func setupConstraintsForStarContainer() {
        starContainer.topToBottom(of: imgHeader, offset: 10)
        starContainer.height(15)
        starContainer.edgesToSuperview(excluding: [.top, .bottom, .right], insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    func setupStar() {
        for _ in 1...5 {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "star.fill")!
            imageView.width(15)
            starContainer.addArrangedSubview(imageView)
        }
    }
    
    func setupConstraintsForLblVote() {
        lblVote.centerY(to: starContainer)
        lblVote.leftToRight(of: starContainer, offset: 10)
    }
    
    func popularMovieSuccess() {
        DispatchQueue.main.async {
            self.movieTableView.reloadData()
        }
    }
    
    func popularMovieFailure(error: Error) {
        print(error)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.headerTitle.count ?? 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = CustomSectionHeaderView()
        headerView.lblTitle.text = presenter?.headerTitle[section]
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.tableViewIdentifier, for: indexPath) as? MovieTableViewCell
        cell?.movieCollection.tag = indexPath.section
        cell?.popularMovieList = presenter?.popularMovieList
        return cell ?? UITableViewCell()
    }
}
