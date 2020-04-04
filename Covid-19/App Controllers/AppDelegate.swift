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
        UINavigationBar.appearance().tintColor = AppUI.Color.darkNavyBlue
        UINavigationBar.appearance().barTintColor = AppUI.Color.lightPurple
        UINavigationBar.appearance().isTranslucent = false

        let barTitleAttributes = [
            NSAttributedString.Key.foregroundColor: AppUI.Color.darkNavyBlue
        ]

        UINavigationBar.appearance().titleTextAttributes = barTitleAttributes
    }
}

extension AppDelegate: UIApplicationDelegate {
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool { //swiftlint:disable:this colon line_length
        self.setAppearance()
        self.parentCoordinator.start()
        return true
    }
}
