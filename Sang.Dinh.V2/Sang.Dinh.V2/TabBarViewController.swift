//
//  TabBarViewController.swift
//  Sang.Dinh.V2
//
//  Created by Rin Sang on 15/04/2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    let homeVC = HomeVC()
    let favoriteVC = FavoriteVC()

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarViewController()
        custom()
        // Do any additional setup after loading the view.
    }
    private func tabBarViewController () {
        let homeVN = UINavigationController(rootViewController: homeVC)
        homeVN.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Home.png"), selectedImage: UIImage(named: "Home.png"))
        
        let favoriteVN = UINavigationController(rootViewController: favoriteVC)
        favoriteVN.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Favorite.png"), selectedImage: UIImage(named: "Favorite.png"))
//       Đẩy dữ liệu từ Home() sang Favorite()
        favoriteVC.datasource = homeVC
        viewControllers = [homeVN,favoriteVN]
    }

    func custom () {
        tabBar.tintColor = .red
//        UIColor.init(named: "TabBarBackgroundColor")
        tabBar.backgroundColor = UIColor.init(red: 0.945, green: 0.961, blue: 0.973, alpha: 1)
    }
}

