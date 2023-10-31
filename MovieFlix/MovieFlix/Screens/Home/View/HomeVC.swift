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
    func movieSuccess()
    func movieFailure(error: Error)
    func setupHeaderConfiguration(lbl: String, voteCount: String, img: String, voteAve: Double)
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
        tv.isPrefetchingEnabled = false
        return tv
    }()
    private let imgHeader: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    private let lblHeader: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .robotoSlabMedium(size: 30)
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
        lbl.font = .robotoSlabLight(size: 15)
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        setupUI()
        setupConstraints()
        presenter?.viewDidLoad()
    }
    
    private func setupTitle() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = Title.home
    }
    
    private func setupUI() {
        view.addSubview(contentView)
        contentView.addSubview(movieTableView)
    }
    
    private func setupConstraints() {
        setupConstraintsOfContentView()
        setupConstraintsForTableView()
    }
    
    private func setupConstraintsOfContentView() {
        contentView.edgesToSuperview(usingSafeArea: true)
    }
    
    private func setupConstraintsForTableView() {
        movieTableView.edgesToSuperview()
        setupHeaderForTableView()
    }
    
    private func setupHeaderForTableView() {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: 300))
        header.addSubview(imgHeader)
        header.addSubview(lblHeader)
        header.addSubview(starContainer)
        header.addSubview(lblVote)
        movieTableView.tableHeaderView = header
        setDelegateAndDataSourceTable()
        setupConstraintsForHeader()
    }
    
    private func setDelegateAndDataSourceTable() {
        movieTableView.delegate = self
        movieTableView.dataSource = self
    }
    
    private func setupConstraintsForHeader() {
        setupConstraintsForImgHeader()
        setupConstraintsForLblHeader()
        setupConstraintsForStarContainer()
        setupConstraintsForLblVote()
    }
    
    private func setupConstraintsForImgHeader() {
        imgHeader.height(250)
        imgHeader.edgesToSuperview(insets: UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0))
    }
    
    private func setupConstraintsForLblHeader() {
        lblHeader.topToBottom(of: imgHeader, offset: -45)
        lblHeader.edgesToSuperview(excluding: [.top, .bottom], insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    private func setupConstraintsForStarContainer() {
        starContainer.topToBottom(of: imgHeader, offset: 10)
        starContainer.height(15)
        starContainer.edgesToSuperview(excluding: [.top, .bottom, .right], insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    func setupStar(voteAve: Double) {
        let vote: Double = voteAve
        let index = Int((vote/2.0).rounded())
        setIndexStar(1, index, IconName.fillStar)
        setIndexStar(index + 1, 5, IconName.emptyStar)
    }
    
    func setIndexStar(_ begin: Int, _ end: Int, _ image: String) {
        for _ in begin...end {
            let imageView = UIImageView()
            imageView.image = UIImage(named: image)!
            imageView.width(15)
            starContainer.addArrangedSubview(imageView)
        }
    }
    
    func setupHeaderConfiguration(lbl: String, voteCount: String, img: String, voteAve: Double) {
        DispatchQueue.main.async {
            self.lblHeader.text = lbl
            self.lblVote.text = voteCount
            self.imgHeader.setImage(with: img)
            self.setupStar(voteAve: voteAve)
        }
    }
    
    private func setupConstraintsForLblVote() {
        lblVote.centerY(to: starContainer)
        lblVote.leftToRight(of: starContainer, offset: 10)
    }
    
    func movieSuccess() {
        DispatchQueue.main.async {
            self.movieTableView.reloadData()
        }
    }
    
    func movieFailure(error: Error) {
        print(error)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.numberOfSections() ?? 0
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
        headerView.buttonAction = {
            print("Button in section \(section) tapped")
            self.tabBarController?.selectedIndex = 1
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        presenter?.cellForRowAt(tableView: tableView, indexPath: indexPath) ?? UITableViewCell()
    }
}
