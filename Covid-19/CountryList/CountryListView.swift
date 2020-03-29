//
//  CountryListView.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import SnapKit
import Kio

public final class CountryListView: KioView {

    // MARK: Subviews
    public let headerLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Countries"
        label.textColor = UIColor.black
        label.textAlignment = NSTextAlignment.left
        label.font = UIFont.systemFont(ofSize: 30.0)

        return label
    }()

    public let tableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.backgroundColor = UIColor.white

        return tableView
    }()

    // MARK: Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white

        self.kio.subviews(forAutoLayout: self.headerLabel, self.tableView)

        self.headerLabel.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview().offset(16.0)
            make.leading.equalToSuperview().offset(16.0)
            make.trailing.equalToSuperview()
            make.height.equalTo(40.0)
        }

        self.tableView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.headerLabel.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
