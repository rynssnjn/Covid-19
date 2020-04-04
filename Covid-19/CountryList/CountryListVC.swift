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
    public init(delegate: CountryListVCDelegate, countries: Countries) {
        self.delegate = delegate
        self.countries = countries

        super.init(nibName: nil, bundle: nil)
        self.dataSource = CountryListDataSource(
            tableView: self.rootView.tableView,
            countries: countries.countries
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Stored Properties
    private var dataSource: CountryListDataSource!
    private let countries: Countries

    // MARK: LifeCycle Methods
    public override func loadView() {
        self.view = CountryListView()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.rootView.tableView.delegate = self
        self.rootView.searchBar.delegate = self
        self.navigationItem.title = "countries".localized
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonItem.SystemItem.search,
            target: self,
            action: #selector(CountryListVC.searchBarItemTapped)
        )
    }
}

// MARK: Views
extension CountryListVC {
    unowned var rootView: CountryListView { return self.view as! CountryListView } // swiftlint:disable:this force_cast line_length
}

// MARK: Helper Methods
private extension CountryListVC {

    @objc func searchBarItemTapped() {
        DispatchQueue.main.async {
            self.rootView.showSearchBar(true)
            self.rootView.searchBar.becomeFirstResponder()
        }
    }
}

// MARK: UITableViewDelegate Methods
extension CountryListVC: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.delegate.getCountryStatistics(country: self.countries.countries[indexPath.item])
    }
}

extension CountryListVC: UISearchBarDelegate {
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        DispatchQueue.main.async {
            self.rootView.showSearchBar(false)
        }
    }

    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {}
}
