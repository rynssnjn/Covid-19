//
//  AlertHandler.swift
//  Covid-19
//
//  Created by Rael San Juan on 4/4/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import UIKit

public struct AlertHandler {

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

// MARK: Instance Methods
extension AlertHandler {
    public func showErrorAlert(action: (() -> Void)? = nil, secondAction: (title: String, action: (() -> Void)?)? = nil) { // swiftlint:disable:this line_length
        let alert: UIAlertController = UIAlertController(
            title: self.title,
            message: self.message,
            preferredStyle: UIAlertController.Style.alert
        )

        alert.addAction(
            UIAlertAction(
                title: "close".localized,
                style: UIAlertAction.Style.destructive,
                handler: { (_: UIAlertAction) -> Void in
                    action?()
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
}
