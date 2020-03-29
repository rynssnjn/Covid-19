//
//  CasesRow.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation

public enum CasesRow: Int {
    case new = 0
    case active = 1
    case critical = 2
    case recovered = 3
    case total = 4

    public var title: String {
        switch self {
            case .new:
                return "new_cases".localized
            case .active:
                return "active".localized
            case .critical:
                return "critical".localized
            case .recovered:
                return "recovered".localized
            case .total:
                return "total".localized
        }
    }
}
