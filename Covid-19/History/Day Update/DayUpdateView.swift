//
//  DayUpdateView.swift
//  Covid-19
//
//  Created by Rael San Juan on 4/4/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import Kio
import SnapKit

public final class DayUpdateView: KioView {

    // MARK: Subview
    public let dateLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = NSTextAlignment.left
        label.font = UIFont().leagueSpartan(size: 45.0)

        return label
    }()

    public let dayLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = AppUI.Color.secondary
        label.textAlignment = NSTextAlignment.left
        label.font = UIFont().alphaEcho(size: 25.0)

        return label
    }()

    public let lineView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = AppUI.Color.secondary

        return view
    }()

    public let casesLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = NSTextAlignment.left
        label.font = UIFont().kinsaleDisplay(size: 32.0)
        label.text = "new_cases".localized

        return label
    }()

    public let casesValueLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = AppUI.Color.secondary
        label.textAlignment = NSTextAlignment.left
        label.font = UIFont().chunkFive(size: 35.0)

        return label
    }()

    public let deathsLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = NSTextAlignment.left
        label.font = UIFont().kinsaleDisplay(size: 32.0)
        label.text = "new_deaths".localized

        return label
    }()

    public let deathsValueLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = AppUI.Color.secondary
        label.textAlignment = NSTextAlignment.left
        label.font = UIFont().chunkFive(size: 35.0)

        return label
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = AppUI.Color.lightPrimary
        self.kio.subviews(forAutoLayout:
            self.dateLabel, self.dayLabel, self.deathsLabel, self.lineView,
            self.deathsValueLabel, self.casesLabel, self.casesValueLabel
        )

        self.dateLabel.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.leading.equalToSuperview().offset(20.0)
            make.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(20.0)
            make.height.equalTo(50.0)
        }

        self.dayLabel.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.leading.equalToSuperview().offset(25.0)
            make.top.equalTo(self.dateLabel.snp.bottom).offset(2.0)
            make.height.equalTo(30.0)
        }

        self.lineView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.dayLabel.snp.bottom)
            make.leading.equalToSuperview().offset(30.0)
            make.width.equalTo(25.0)
            make.height.equalTo(5.0)
        }

        self.casesLabel.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.leading.equalToSuperview().offset(32.0)
            make.top.equalTo(self.lineView.snp.bottom).offset(30.0)
            make.height.equalTo(40.0)
        }

        self.casesValueLabel.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.trailing.equalToSuperview().inset(16.0)
            make.top.equalTo(self.lineView.snp.bottom).offset(30.0)
            make.height.equalTo(40.0)
        }

        self.deathsLabel.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.leading.equalToSuperview().offset(32.0)
            make.top.equalTo(self.casesLabel.snp.bottom).offset(16.0)
            make.height.equalTo(40.0)
        }

        self.deathsValueLabel.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.trailing.equalToSuperview().inset(16.0)
            make.top.equalTo(self.casesValueLabel.snp.bottom).offset(16.0)
            make.height.equalTo(40.0)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
