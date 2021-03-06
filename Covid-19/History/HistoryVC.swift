//
//  HistoryVC.swift
//  Covid-19
//
//  Created by Rael San Juan on 4/4/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import RSJ
import FSCalendar

public final class HistoryVC: RSJViewController {

    // MARK: Delegate Properties
    private unowned let delegate: HistoryVCDelegate

    // MARK: Initializers
    public init(delegate: HistoryVCDelegate, statistics: [Statistics]) {
        self.delegate = delegate
        self.statistics = statistics

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Stored Properties
    private let statistics: [Statistics]

    // MARK: LifeCycle Methods
    public override func loadView() {
        self.view = HistoryView()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.rootView.calendar.dataSource = self
        self.rootView.calendar.delegate = self

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: #imageLiteral(resourceName: "close_icon").withRenderingMode(UIImage.RenderingMode.alwaysTemplate),
            style: UIBarButtonItem.Style.plain,
            target: self,
            action: #selector(HistoryVC.closeButtonItemTapped)
        )

        self.navigationItem.title = self.delegate.country
    }
}

// MARK: Views
private extension HistoryVC {
    unowned var rootView: HistoryView { return self.view as! HistoryView } // swiftlint:disable:this force_cast line_length
    var calendar: FSCalendar { return rootView.calendar }
}

// MARK: Target Action Methods
private extension HistoryVC {
    @objc func closeButtonItemTapped() {
        self.delegate.close()
    }
}

// MARK: FSCalendarDataSource Methods
extension HistoryVC: FSCalendarDataSource {}

// MARK: FSCalendarDelegate Methods
extension HistoryVC: FSCalendarDelegate {
    public func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {

        guard let cell = calendar.cell(for: date, at: monthPosition) else { return }

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        guard
            let statistics = self.statistics.first(where: {
                $0.day == formatter.string(from: date)
            }
        ) else {
            DispatchQueue.main.async {
                switch Date() >= date {
                    case true:
                        self.delegate.showNoCasesPopup(in: cell, date: date)
                    case false:
                        self.delegate.showPopupAdvanceDate()
                }
            }
            return
        }

        DispatchQueue.main.async {
            switch Date() >= date {
                case true:
                    self.delegate.showDayUpdatePopup(in: cell, statistics: statistics, date: date)
                case false:
                    self.delegate.showPopupAdvanceDate()
            }
        }
    }
}
