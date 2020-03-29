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
                return "New Cases"
            case .active:
                return "Active"
            case .critical:
                return "Critical"
            case .recovered:
                return "Recovered"
            case .total:
                return "Total"
        }
    }
}
