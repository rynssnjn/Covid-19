//
//  AnyTabCoordinator.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import class UIKit.UIViewController
import class UIKit.UITabBarItem

/**
 AnyTabCoordinator is a class for type erasure on a TabCoordinator instance
*/
open class AnyTabCoordinator {

    // MARK: Initializer
    /**
     AnyTabCoordinator is a class for type erasure on a TabCoordinator instance
     - parameter tabCoordinator: The TabCoordinator instance to be type erased.
    */
    public init<T: TabCoordinator>(_ tabCoordinator: T) {
        self.viewController = tabCoordinator.viewController
        self.tabBarItem = tabCoordinator.tabBarItem
    }

    // MARK: Stored Properties
    /**
     UIViewController instance being managed
    */
    public let viewController: UIViewController

    /**
     UITabBarItem for the UIViewController
    */
    public let tabBarItem: UITabBarItem
}
