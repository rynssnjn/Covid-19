//
//  CountryListVC.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import Kio

public final class CountryListVC: KioViewController {

    // MARK: Delegate Properties
    private unowned let delegate: CountryListVCDelegate

    // MARK: Initializer
    public init(delegate: CountryListVCDelegate) {
        self.delegate = delegate

        super.init(nibName: nil, bundle: nil)
        self.dataSource = CountryListDataSource(tableView: self.rootView.tableView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Stored Properties
    private var dataSource: CountryListDataSource!

    // MARK: Computed Properties

    // MARK: LifeCycle Methods
    public override func loadView() {
        self.view = CountryListView()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        self.rootView.tableView.delegate = self
    }
}

// MARK: Views
extension CountryListVC {
    unowned var rootView: CountryListView { return self.view as! CountryListView } //swiftlint:disable:this force_cast line_length
}

// MARK: UITableViewDelegate Methods
extension CountryListVC: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}
