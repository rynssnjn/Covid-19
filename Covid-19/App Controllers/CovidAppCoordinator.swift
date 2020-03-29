//
//  CovidAppCoordinator.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import Kio

public final class CovidAppCoordinator: AppCoordinator<UINavigationController> {


    // MARK: Initializer
    public override init(window: UIWindow, rootViewController: UINavigationController) {
        super.init(window: window, rootViewController: rootViewController)

        // MARK: Setup window property
        self.window.backgroundColor = UIColor.white
        self.window.rootViewController = self.rootViewController
        self.window.makeKeyAndVisible()

        self.rootViewController.navigationBar.isTranslucent = false
    }

    // MARK: Instance Methods
    public override func start() {
        super.start()
    }
}
