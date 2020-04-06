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
        label.textColor = UIColor.white
        label.font = UIFont().alegreya(size: 20.0)
        label.textAlignment = NSTextAlignment.left

        return label
    }()

    public let statisticsValueLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = NSTextAlignment.right

        return label
    }()

    public let sideDecoration: UIView = {
        let view: UIView = UIView()

        return view
    }()

    public let bottomDivider: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = AppUI.Color.lightGray

        return view
    }()

    // MARK: Initializer
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.backgroundColor = AppUI.Color.lightPrimary

        self.isUserInteractionEnabled = false
        self.kio.subviews(forAutoLayout:
            self.sideDecoration, self.statisticsLabel,
            self.statisticsValueLabel, self.bottomDivider
        )

        self.sideDecoration.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.leading.equalToSuperview()
            make.width.equalTo(5.0)
            make.top.equalToSuperview().offset(2.0)
            make.bottom.equalToSuperview().inset(2.0)
        }

        self.statisticsLabel.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.leading.equalTo(self.sideDecoration.snp.trailing).offset(16.0)
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

        self.bottomDivider.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.height.equalTo(1.0)
            make.leading.equalToSuperview().offset(16.0)
            make.trailing.equalToSuperview()
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
        self.sideDecoration.backgroundColor = viewModel.decoration.color
        self.statisticsValueLabel.textColor = viewModel.decoration.color
        self.statisticsValueLabel.font = viewModel.decoration.font
    }
}
