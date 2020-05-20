//
//  RSJAlert.swift
//  RSJ
//
//  Created by Rael San Juan on 5/20/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import UIKit.UIViewController
import UIKit.UIAlertController

public struct RSJAlert {

    // MARK: Initializer
    public init(title: String? = nil, message: String, viewController: UIViewController) {
        self.title = title
        self.message = message
        self.vc = viewController
    }

    // MARK: Stored Properties
    public let title: String?
    public let message: String
    public let vc: UIViewController
}

extension RSJAlert {
    public func showAlert(firstAction: RSJAlertAction, secondAction: RSJAlertAction? = nil) {
        let alert: UIAlertController = UIAlertController(
            title: self.title,
            message: self.message,
            preferredStyle: UIAlertController.Style.alert
        )

        alert.addAction(
            UIAlertAction(
                title: firstAction.title,
                style: firstAction.style,
                handler: { (_: UIAlertAction) -> Void in
                    firstAction.action?()
                }
            )
        )

        self.vc.present(alert, animated: true, completion: nil)
    }

    public func showActionSheet(actions: [RSJAlertAction]) {
        let alert: UIAlertController = UIAlertController(
            title: self.title,
            message: self.message,
            preferredStyle: UIAlertController.Style.actionSheet
        )

        actions.forEach { (rsj: RSJAlertAction) -> Void in
            alert.addAction(
                UIAlertAction(
                    title: rsj.title,
                    style: rsj.style,
                    handler: { (_: UIAlertAction) -> Void in
                        rsj.action?()
                    }
                )
            )
        }

        self.vc.present(alert, animated: true, completion: nil)
    }
}
