//
//  CountryListDataSource.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import Kio

public final class CountryListDataSource: KioObject {

    // MARK: Initializer
    public init(tableView: UITableView) {
        self.tableView = tableView
        super.init()

        self.tableView.dataSource = self
        self.tableView.register(CountryCell.self, forCellReuseIdentifier: CountryCell.identifier)

    }

    // MARK: Stored Properties
    private let tableView: UITableView
}

extension CountryListDataSource: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CountryCell.identifier
        )  as? CountryCell else { return UITableViewCell() }

        cell.configure(with: "PINAS")

        return cell
    }
}
