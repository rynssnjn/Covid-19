//
//  StatisticsViewModel.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import UIKit

public struct StatisticsViewModel {

    // MARK: Initializer
    public init(row: Any, statistics: Statistics) {
        self.row = row
        self.statistics = statistics
    }

    // MARK: Stored Properties
    private let row: Any
    private let statistics: Statistics

    // MARK: Computed Properties
    public var title: String {
        switch self.row is CasesRow {
            case true:
                guard let row = self.row as? CasesRow else { return "0" }
                return row.title
            case false:
                guard let row = self.row as? DeathsRow else { return "0" }
                return row.title
        }
    }

    public var value: String {
        switch self.row is CasesRow {
            case true:
                guard let row = self.row as? CasesRow else { return "0" }
                let cases: Cases = self.statistics.cases
                switch row {
                    case .new:
                        guard let new = cases.new else { return "0" }
                        return new
                    case .active:
                        return cases.active.kio.stringValue
                    case .critical:
                        return cases.critical.kio.stringValue
                    case .recovered:
                        return cases.recovered.kio.stringValue
                    case .total:
                        return cases.total.kio.stringValue
                }
            case false:
                guard let row = self.row as? DeathsRow else { return "0" }
                let deaths: Deaths = self.statistics.deaths
                switch row {
                    case .new:
                        guard let new = deaths.new else { return "0" }
                        return new
                    case .total:
                        return deaths.total.kio.stringValue
                }
        }
    }

    public var decoration: (color: UIColor, font: UIFont) {
        let color: UIColor
        let font: UIFont
        switch self.row is CasesRow {
            case true:
                guard
                    let row = self.row as? CasesRow
                else {
                    return (
                        color: AppUI.Color.secondary,
                        font: UIFont().alegreyaMedium(size: 25.0)
                    )
                }
                switch row {
                    case .new:
                        color = UIColor.white
                        font = UIFont().alegreyaMedium(size: 25.0)
                    case .active:
                        color = UIColor.white
                        font = UIFont().alegreyaMedium(size: 25.0)
                    case .critical:
                        color = UIColor.white
                        font = UIFont().alegreyaMedium(size: 25.0)
                    case .recovered:
                        color = AppUI.Color.neonBlue
                        font = UIFont().alegreyaExtraBold(size: 30.0)
                    case .total:
                        color = AppUI.Color.secondary
                        font = UIFont().alegreyaBlack(size: 35.0)
                }
            case false:
                guard
                    let row = self.row as? DeathsRow
                else {
                    return (
                        color: AppUI.Color.secondary,
                        font: UIFont().alegreyaMedium(size: 25.0)
                    )
                }
                switch row {
                    case .new:
                        color = UIColor.white
                        font = UIFont().alegreyaMedium(size: 25.0)
                    case .total:
                        color = AppUI.Color.secondary
                        font = UIFont().alegreyaBlack(size: 35.0)
                }
        }

        return (color: color, font: font)
    }
}
