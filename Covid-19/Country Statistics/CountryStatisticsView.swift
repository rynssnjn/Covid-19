//
//  CountryStatisticsView.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import Kio
import SnapKit

public final class CountryStatisticsView: KioView {

    // MARK: Subviews
    public let tableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.backgroundColor = UIColor.white

        return tableView
    }()

    // MARK: Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white

        self.kio.subview(forAutoLayout: self.tableView)

        self.tableView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.edges.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
