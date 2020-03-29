//
//  CountryCell.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import Kio
import SnapKit

public final class StatisticsCell: UITableViewCell {

    // MARK: Subviews
    public let statisticsLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.textAlignment = NSTextAlignment.left

        return label
    }()

    public let statisticsValueLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textAlignment = NSTextAlignment.right

        return label
    }()

    // MARK: Initializer
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.kio.subviews(forAutoLayout: self.statisticsLabel, self.statisticsValueLabel)

        self.statisticsLabel.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.leading.equalToSuperview().offset(16.0)
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        self.statisticsValueLabel.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().inset(16.0)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Configurable Cell
extension StatisticsCell {
    public static var identifier: String = "StatisticsCell"

    public func configure(with viewModel: StatisticsViewModel) {
        self.statisticsLabel.text = viewModel.title
        self.statisticsValueLabel.text = viewModel.value.replacingOccurrences(of: "+", with: "")
    }
}