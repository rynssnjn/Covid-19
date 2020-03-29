//
//  FoundationExtension.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation

extension String {
    public var localized: String {
        return NSLocalizedString(self, comment: self)
    }
}
