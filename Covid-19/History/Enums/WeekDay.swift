//
//  WeekDay.swift
//  Covid-19
//
//  Created by Rael San Juan on 4/4/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation

public enum WeekDay: Int {
    case sunday = 1
    case monday = 2
    case tuesday = 3
    case wednesday = 4
    case thursday = 5
    case friday = 6
    case saturday = 7

    public var string: String {
        switch self {
            case .sunday:
                return "sunday".localized
            case .monday:
                return "monday".localized
            case .tuesday:
                return "tuesday".localized
            case .wednesday:
                return "wednesday".localized
            case .thursday:
                return "thursday".localized
            case .friday:
                return "friday".localized
            case .saturday:
                return "saturday".localized
        }
    }
}
