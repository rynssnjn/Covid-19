//
//  CategorySection.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation

public enum CategorySection: Int {
    case cases = 0
    case deaths = 1

    public var title: String {
        switch self {
            case .cases:
                return "CASES"
            case .deaths:
                return "DEATHS"
        }
    }

    public var numberOfRows: Int {
        switch self {
            case .cases:
                return 5
            case .deaths:
                return 2
        }
    }
}
