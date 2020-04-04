//
//  HistoryView.swift
//  Covid-19
//
//  Created by Rael San Juan on 4/4/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import Kio
import SnapKit
import FSCalendar

public final class HistoryView: KioView {

    // MARK: Subviews
    public let calendar: FSCalendar = {
        let calendar: FSCalendar = FSCalendar()
        calendar.backgroundColor = UIColor.white

        return calendar
    }()

    // MARK: Initializers
    public override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = AppUI.Color.darkNavyBlue

        self.kio.subview(forAutoLayout: self.calendar)

        self.calendar.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.edges.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
