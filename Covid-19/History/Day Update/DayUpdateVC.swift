//
//  DayUpdateVC.swift
//  Covid-19
//
//  Created by Rael San Juan on 4/4/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import Kio

public final class DayUpdateVC: KioViewController {

    // MARK: Delegate Properties
    private unowned let delegate: DayUpdateVCDelegate

    public init(delegate: DayUpdateVCDelegate, statistics: Statistics? = nil, date: Date) {
        self.delegate = delegate
        self.statistics = statistics
        self.date = date

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Stored Properties
    private let statistics: Statistics?
    private let date: Date

    // MARK: LifeCycle Methods
    public override func loadView() {
        self.view = DayUpdateView()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()

        switch UIIdiom {
            case .pad:
                break
            default:
                self.navigationItem.leftBarButtonItem = UIBarButtonItem(
                    image: #imageLiteral(resourceName: "close_icon").withRenderingMode(UIImage.RenderingMode.alwaysTemplate),
                    style: UIBarButtonItem.Style.plain,
                    target: self,
                    action: #selector(DayUpdateVC.closeButtonItemTapped)
                )
        }

        self.navigationItem.title = "day_update".localized
    }

    // MARK: Instance Methods
    private func setupView() {
        let totalCases: Int

        if let statistics = self.statistics,
            let cases = statistics.cases.new {
            totalCases = cases.replacingOccurrences(of: "+", with: "").toInteger
        } else {
            totalCases = 0
        }

        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"

        let calendar = Calendar(identifier: .gregorian)
        let weekDay: Int = calendar.component(Calendar.Component.weekday, from: self.date)

        guard let day = WeekDay(rawValue: weekDay) else { return }

        self.rootView.dayLabel.text = day.string
        self.rootView.dateLabel.text = formatter.string(from: self.date)
        self.rootView.casesValueLabel.text = totalCases.kio.stringValue

    }
}

// MARK: Views
private extension DayUpdateVC {
    unowned var rootView: DayUpdateView { return self.view as! DayUpdateView } // swiftlint:disable:this force_cast line_length
}

// MARK: Target Action Methods
private extension DayUpdateVC {
    @objc func closeButtonItemTapped() {
        self.delegate.dismiss()
    }
}
