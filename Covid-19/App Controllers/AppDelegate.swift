//
//  AppDelegate.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import UIKit

@UIApplicationMain
public class AppDelegate: UIResponder {

    // MARK: Stored Properties
    public var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    private let rootViewController: UINavigationController = UINavigationController()
    private lazy var parentCoordinator: CovidAppCoordinator = CovidAppCoordinator(
       window: self.window!,
       rootViewController: self.rootViewController
    )

    // MARK: Instance Methods
    private func setAppearance() {
        UINavigationBar.appearance().barStyle = UIBarStyle.black
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().barTintColor = AppUI.Color.brown
        UINavigationBar.appearance().isTranslucent = false
    }
}

extension AppDelegate: UIApplicationDelegate {
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        self.setAppearance()
        self.parentCoordinator.start()
        return true
    }
}
