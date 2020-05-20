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
    public func showAlert(
        firstAction: (title: String, style: UIAlertAction.Style, action: () -> Void),
        secondAction: (title: String?, action: (() -> Void)?)? = nil
    ) {

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
                    firstAction.action()
                }
            )
        )

        if let secondAction = secondAction {
            alert.addAction(
                UIAlertAction(
                    title: secondAction.title,
                    style: UIAlertAction.Style.default,
                    handler: { (_: UIAlertAction) -> Void in
                        secondAction.action?()
                    }
                )
            )
        }

        self.vc.present(alert, animated: true, completion: nil)
    }

    public func showActionSheet(actions: [(
        title: String?,
        style: UIAlertAction.Style?,
        action: (() -> Void)?)]
    ) {
        let alert: UIAlertController = UIAlertController(
            title: self.title,
            message: self.message,
            preferredStyle: UIAlertController.Style.actionSheet
        )

        actions.forEach { (action: (title: String?, style: UIAlertAction.Style?, action: (() -> Void)?)) -> Void in
            alert.addAction(
                UIAlertAction(
                    title: action.title,
                    style: action.style ?? UIAlertAction.Style.default,
                    handler: { (_: UIAlertAction) -> Void in
                        action.action?()
                    }
                )
            )
        }

        self.vc.present(alert, animated: true, completion: nil)
    }
}
