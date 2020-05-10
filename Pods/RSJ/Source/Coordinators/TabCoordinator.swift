//
//  TabCoordinator.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import class UIKit.UIViewController
import class UIKit.UITabBarItem

public protocol TabCoordinator: Coordinator {

    /**
     UIViewController type to be managed by TabCoordinator
    */
    associatedtype ViewController: UIViewController

    /**
     UIViewController instance being managed
    */
    var viewController: ViewController { get }

    /**
     UITabBarItem for the UIViewController
    */
    var tabBarItem: UITabBarItem { get }

}
