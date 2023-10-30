//
//  MoviewFlixTBC.swift
//  MovieFlix
//
//  Created by Jaydip Parmar on 19/10/23.
//

import UIKit

class MoviewFlixTBC: UITabBarController {
    
    private let homeVC = HomeRouter.createModule()
    private let movieVC = MovieRouter.createModule()
    private let tvShowVC = TVRouter.createModule()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    func setupTabBar() {
        setupHome()
        setupMovie()
        setupTVShow()
        navBarAppearance()
        self.viewControllers = [UINavigationController(rootViewController: homeVC), UINavigationController(rootViewController: movieVC), UINavigationController(rootViewController: tvShowVC)]
        self.tabBarAppearance()
        self.tabBar.tintColor = .red
        self.tabBar.unselectedItemTintColor = .white
    }
    
    func navBarAppearance() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationBarAppearance.backgroundColor = UIColor.black
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
    
    func setupHome() {
        let tabItem = UITabBarItem(title: IconTitle.home, image: UIImage(named: IconName.homeBeforeClick), selectedImage: UIImage(named: IconName.homeAfterClick))
        homeVC.tabBarItem = tabItem
    }
    
    func setupMovie() {
        let tabItem = UITabBarItem(title: IconTitle.movie, image: UIImage(named: IconName.movieBeforeClick), selectedImage: UIImage(named: IconName.movieAfterClick))
        movieVC.tabBarItem = tabItem
    }
    
    func setupTVShow() {
        let tabItem = UITabBarItem(title: IconTitle.tv, image: UIImage(named: IconName.tvBeforeClick), selectedImage: UIImage(named: IconName.tvAfterClick))
        tvShowVC.tabBarItem = tabItem
    }

}
