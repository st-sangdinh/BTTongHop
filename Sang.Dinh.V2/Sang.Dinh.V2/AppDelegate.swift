//
//  AppDelegate.swift
//  Sang.Dinh.V2
//
//  Created by Rin Sang on 15/04/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let tabBar = TabBarViewController()
        let navi = UINavigationController(rootViewController: tabBar)
        navi.navigationBar.isHidden = true
        window?.rootViewController = navi
        window?.makeKeyAndVisible()
        return true
    }
}

