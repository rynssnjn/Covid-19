//
//  RSJViewController.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import class UIKit.UIViewController

/**
 A subclass of UIViewController that implements a print statement when deinitialized.
 Conforms to NavigationItemSetting and TargetActionSetting.
*/
open class RSJViewController: UIViewController, RSJDebuggable {
    deinit {
        self.log()
    }
}

public extension RSJDebuggable where Self: UIViewController {

    func logMessage() {
        print("\(type(of: self)) deallocated")
    }

}
