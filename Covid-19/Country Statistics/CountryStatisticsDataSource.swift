//
//  CountryStatisticsDataSource.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import Kio

public final class CountryStatisticsDataSource: KioObject {

    // MARK: Initializer
    public init(tableView: UITableView, statistics: Statistics) {
        self.tableView = tableView
        self.statistics = statistics

        super.init()

        self.tableView.dataSource = self
        self.tableView.register(StatisticsCell.self, forCellReuseIdentifier: StatisticsCell.identifier)
    }

    // MARK: Stored Properties
    private let tableView: UITableView
    private let statistics: Statistics

    // MARK: Instance Methods
}

extension CountryStatisticsDataSource: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = CategorySection(rawValue: section) else { return "" }
        return section.title
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = CategorySection(rawValue: section) else { return 0 }
        return section.numberOfRows
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: StatisticsCell.identifier
            )  as? StatisticsCell,
            let section = CategorySection(rawValue: indexPath.section)
        else {
            return UITableViewCell()
        }

        let viewModel: StatisticsViewModel

        switch section {
            case .cases:
                guard let row = CasesRow(rawValue: indexPath.row) else { return UITableViewCell() }
                viewModel = StatisticsViewModel(row: row, statistics: self.statistics)
            case .deaths:
                guard let row = DeathsRow(rawValue: indexPath.row) else { return UITableViewCell() }
                viewModel = StatisticsViewModel(row: row, statistics: self.statistics)
        }

        cell.configure(with: viewModel)
        return cell
    }
}
