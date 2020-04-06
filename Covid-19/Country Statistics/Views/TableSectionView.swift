//
//  TableSectionView.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import Kio
import SnapKit

public final class TableSectionView: KioView {

    // MARK: Subviews
    public let sectionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = AppUI.Color.secondary
        label.font = UIFont().alegreyaBlack(size: 45.0)
        label.textAlignment = NSTextAlignment.center

        return label
    }()

    // MARK: Initalizer
    public init(title: String) {
        super.init(frame: CGRect.zero)
        self.backgroundColor = AppUI.Color.darkPrimary
        self.sectionLabel.text = title
        self.kio.subview(forAutoLayout: self.sectionLabel)

        self.sectionLabel.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
