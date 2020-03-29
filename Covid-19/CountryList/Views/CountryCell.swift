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

public final class CountryCell: UITableViewCell {

    // MARK: Subviews
    public let countryLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.textAlignment = NSTextAlignment.left

        return label
    }()

    // MARK: Initializer
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.kio.subview(forAutoLayout: self.countryLabel)

        self.countryLabel.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.leading.equalToSuperview().offset(16.0)
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Configurable Cell
extension CountryCell {
    public static var identifier: String = "CountryCell"

    public func configure(with country: String) {
        self.countryLabel.text = country
    }
}
