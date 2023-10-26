//
//  CustomSectionHeaderView.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 26/10/23.
//

import UIKit

class CustomSectionHeaderView: UIView {
    
    let lblTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .robotoSlabMedium(size: 20)
        return label
    }()
    let btnShowAll: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Show all", for: .normal)
        btn.titleLabel?.font = .robotoSlabLight(size: 15)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupUI() {
        addSubview(lblTitle)
        addSubview(btnShowAll)
    }
    
    func setupConstraints() {
        lblTitle.edgesToSuperview(excluding: [.bottom, .right], insets: UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0))
        btnShowAll.right(to: self, offset: 0)
    }
}
