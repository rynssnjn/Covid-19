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

    public var decoration: (sideColor: UIColor, valueColor: UIColor, font: UIFont) { // swiftlint:disable:this large_tuple line_length
        let sideColor: UIColor
        let valueColor: UIColor
        let font: UIFont
        switch self.row is CasesRow {
            case true:
                guard
                    let row = self.row as? CasesRow
                else {
                    return (
                        sideColor: AppUI.Color.secondary,
                        valueColor: AppUI.Color.secondary,
                        font: UIFont().alegreyaMedium(size: 25.0)
                    )
                }
                switch row {
                    case .new:
                        sideColor = AppUI.Color.violet
                        valueColor = UIColor.white
                        font = UIFont().alegreyaMedium(size: 25.0)
                    case .active:
                        sideColor = AppUI.Color.pinkishRed
                        valueColor = UIColor.white
                        font = UIFont().alegreyaMedium(size: 25.0)
                    case .critical:
                        sideColor = AppUI.Color.neonGreen
                        valueColor = UIColor.white
                        font = UIFont().alegreyaMedium(size: 25.0)
                    case .recovered:
                        sideColor = AppUI.Color.neonBlue
                        valueColor = AppUI.Color.neonBlue
                        font = UIFont().alegreyaExtraBold(size: 30.0)
                    case .total:
                        sideColor = AppUI.Color.yellowishOrange
                        valueColor = AppUI.Color.secondary
                        font = UIFont().alegreyaBlack(size: 35.0)
                }
            case false:
                guard
                    let row = self.row as? DeathsRow
                else {
                    return (
                        sideColor: AppUI.Color.secondary,
                        valueColor: AppUI.Color.secondary,
                        font: UIFont().alegreyaMedium(size: 25.0)
                    )
                }
                switch row {
                    case .new:
                        sideColor = AppUI.Color.darkishBlue
                        valueColor = UIColor.white
                        font = UIFont().alegreyaMedium(size: 25.0)
                    case .total:
                        sideColor = AppUI.Color.darkPink
                        valueColor = AppUI.Color.secondary
                        font = UIFont().alegreyaBlack(size: 35.0)
                }
        }

        return (sideColor: sideColor, valueColor: valueColor, font: font)
    }
}
