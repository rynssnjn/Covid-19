//
//  DeathsRow.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation

public enum DeathsRow: Int {
    case new = 0
    case total = 1

    public var title: String {
        switch self {
            case .new:
                return "New"
            case .total:
                return "Total"
        }
    }
}
