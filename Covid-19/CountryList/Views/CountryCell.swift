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
        label.textColor = UIColor.white
        label.font = UIFont().chunkFive(size: 20.0)
        label.textAlignment = NSTextAlignment.left

        return label
    }()

    public let sideDecoration: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = AppUI.Color.violet

        return view
    }()

    public let bottomDivider: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = AppUI.Color.lightGray

        return view
    }()

    public let chevron: UIImageView = {
        let image: UIImage = #imageLiteral(resourceName: "chevron_right").withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        let imageView: UIImageView = UIImageView()
        imageView.tintColor = AppUI.Color.secondary
        imageView.image = image

        return imageView
    }()

    // MARK: Initializer
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = AppUI.Color.lightPrimary

        self.kio.subviews(forAutoLayout:
            self.sideDecoration, self.countryLabel,
            self.bottomDivider, self.chevron
        )

        self.sideDecoration.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.leading.equalToSuperview()
            make.width.equalTo(8.0)
            make.top.equalToSuperview().offset(2.0)
            make.bottom.equalToSuperview().inset(2.0)
        }

        self.countryLabel.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.leading.equalTo(self.sideDecoration.snp.trailing).offset(16.0)
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        self.bottomDivider.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.height.equalTo(1.0)
            make.leading.equalToSuperview().offset(20.0)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        self.chevron.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.trailing.equalToSuperview().inset(16.0)
            make.size.equalTo(20.0)
            make.centerY.equalToSuperview()
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
