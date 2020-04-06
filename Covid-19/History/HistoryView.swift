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
        let appearance: FSCalendarAppearance = calendar.appearance

        calendar.backgroundColor = AppUI.Color.lightPrimary

        // Sets Header Appearance
        appearance.headerTitleFont = UIFont().alegreyaBlack(size: 25.0)
        appearance.headerTitleColor = AppUI.Color.secondary

        // Sets Weekday Appearance
        appearance.weekdayFont = UIFont().alegreyaBold(size: 20.0)
        appearance.weekdayTextColor = AppUI.Color.secondary

        // Sets Today Appearance
        appearance.titleTodayColor = AppUI.Color.secondary
        appearance.todayColor = AppUI.Color.darkPrimary

        // Sets Calendar Date Appearance
        appearance.titleFont = UIFont().alegreyaItalic(size: 20.0)
        appearance.titleDefaultColor = UIColor.white

        // Sets Selection Appearance
        appearance.selectionColor = AppUI.Color.secondary
        appearance.titleSelectionColor = AppUI.Color.darkPrimary

        return calendar
    }()

    // MARK: Initializers
    public override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = AppUI.Color.darkPrimary

        self.kio.subview(forAutoLayout: self.calendar)

        self.calendar.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.edges.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
