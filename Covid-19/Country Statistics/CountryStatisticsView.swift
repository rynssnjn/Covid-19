//
//  CountryStatisticsView.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import RSJ
import SnapKit

public final class CountryStatisticsView: RSJView {

    // MARK: Subviews
    public let tableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.backgroundColor = AppUI.Color.darkPrimary

        return tableView
    }()

    // MARK: Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = AppUI.Color.darkPrimary

        self.rsj.addView(forAutoLayout: self.tableView)

        self.tableView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.edges.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
