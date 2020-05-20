//
//  RSJAlertAction.swift
//  RSJ
//
//  Created by Rael San Juan on 5/20/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import UIKit.UIAlertController

public struct RSJAlertAction {

    // MARK: Initializer
    public init(
        title: String? = nil,
        style: UIAlertAction.Style = UIAlertAction.Style.default,
        action: (() -> Void)? = nil
    ) {
        self.title = title
        self.style = style
        self.action = action
    }

    // MARK: Stored Properties
    public let title: String?
    public let style: UIAlertAction.Style
    public let action: (() -> Void)?
}
