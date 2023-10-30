//
//  t.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 27/10/23.
//

import Foundation
import UIKit

extension UITabBarController {
    
    func tabBarAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor.black
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        UITabBar.appearance().standardAppearance = tabBarAppearance
        self.tabBar.backgroundColor = .black
    }
}
