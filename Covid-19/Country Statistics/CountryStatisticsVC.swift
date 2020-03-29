//
//  CountryStatisticsVC.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import Kio

public final class CountryStatisticsVC: KioViewController {

    // MARK: Delegate Properties
    private unowned let delegate: CountryStatisticsVCDelegate

    // MARK: Initializer
    public init(delegate: CountryStatisticsVCDelegate, statistics: Statistics) {
        self.delegate = delegate
        self.statistics = statistics

        super.init(nibName: nil, bundle: nil)
        self.dataSource = CountryStatisticsDataSource(
            tableView: self.rootView.tableView,
            statistics: self.statistics
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Stored Properties
    private var dataSource: CountryStatisticsDataSource!
    private let statistics: Statistics

    // MARK: Computed Properties

    // MARK: LifeCycle Methods
    public override func loadView() {
        self.view = CountryStatisticsView()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        self.rootView.tableView.delegate = self
        self.navigationItem.title = self.statistics.country
    }
}

// MARK: Views
private extension CountryStatisticsVC {
    unowned var rootView: CountryStatisticsView { return self.view as! CountryStatisticsView } //swiftlint:disable:this force_cast line_length
}

// MARK: UITableViewDelegate Methods
extension CountryStatisticsVC: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let section = CategorySection(rawValue: section) else { return nil }
        let sectionView: TableSectionView = TableSectionView(title: section.title)

        return sectionView
    }

    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70.0
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
