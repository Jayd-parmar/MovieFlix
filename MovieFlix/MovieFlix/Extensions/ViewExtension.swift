//
//  ViewExtension.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 01/11/23.
//

import Foundation
import UIKit

extension UIView {
    
    func createStar(voteAve: Double) -> UIStackView {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 5
        
        let index = Int((voteAve/2.0).rounded())
    
        for _ in 1...index {
            let imageView = UIImageView()
            imageView.image = UIImage(named: IconName.fillStar)!
            imageView.height(15)
            view.addArrangedSubview(imageView)
        }
        if index != 5 {
            for _ in index+1...5 {
                let imageView = UIImageView()
                imageView.image = UIImage(named: IconName.emptyStar)!
                imageView.width(15)
                view.addArrangedSubview(imageView)
            }
        }
        return view
    }
}
