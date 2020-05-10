//
//  AcknowledgementDataSource.swift
//  Covid-19
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import RSJ

public final class AcknowledgementDataSource: RSJObject {

    // MARK: Initializers
    public init(tableView: UITableView, acknowledgements: [Acknowledgement]) {
        self.tableView = tableView
        self.acknowledgements = acknowledgements
        super.init()
        self.tableView.dataSource = self
        self.tableView.register(AcknowledgementCell.self, forCellReuseIdentifier: AcknowledgementCell.identifier)
    }

    // MARK: Stored Properties
    private let tableView: UITableView
    private let acknowledgements: [Acknowledgement]
}

extension AcknowledgementDataSource: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.acknowledgements.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: AcknowledgementCell.identifier
        )  as? AcknowledgementCell else { return UITableViewCell() }

        cell.sideDecoration.backgroundColor = indexPath.row % 2 == 0
            ? AppUI.Color.secondary : UIColor.white

        cell.configure(with: self.acknowledgements[indexPath.row].title)
        return cell
    }
}
