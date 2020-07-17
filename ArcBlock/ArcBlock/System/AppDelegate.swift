//
//  AppDelegate.swift
//  ArcBlock
//
//  Created by TimberTang on 2020/7/17.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if window == nil {
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.backgroundColor = .white
        }
        setupSplashViewController()
        window?.makeKeyAndVisible()
        return true
    }
    
    
    private func setupSplashViewController () {
        let splashVC = SplashViewController()
        splashVC.completionBlock = { [weak self] isFinshed in
            guard let self = self else { return }
            if isFinshed {
                self.createRootViewController()
            }
        }
        window?.rootViewController = splashVC
    }
    
    
    func createRootViewController() {
        let transtition = CATransition()
        transtition.duration = 0.5
        transtition.timingFunction = CAMediaTimingFunction(name: .easeOut)
        window?.layer.add(transtition, forKey: "animation")
        let root = UINavigationController(rootViewController: ListViewController())
        window?.rootViewController = root
    }

    // MARK: UISceneSession Lifecycle



}

