//
//  CountryListVC.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import RSJ

public final class CountryListVC: RSJViewController {

    // MARK: Delegate Properties
    private unowned let delegate: CountryListVCDelegate

    // MARK: Initializer
    public init(delegate: CountryListVCDelegate, countries: Countries) {
        self.delegate = delegate
        self.countries = countries
        self.filteredCountries = countries.countries

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
    private var filteredCountries: [String]

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

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "libraries".localized,
            style: UIBarButtonItem.Style.plain,
            target: self,
            action: #selector(CountryListVC.getLibraries)
        )
    }
}

// MARK: Views
extension CountryListVC {
    unowned var rootView: CountryListView { return self.view as! CountryListView } // swiftlint:disable:this force_cast line_length
}

// MARK: Target Methods
private extension CountryListVC {

    @objc func searchBarItemTapped() {
        DispatchQueue.main.async {
            self.rootView.showSearchBar(true)
            self.rootView.searchBar.becomeFirstResponder()
        }
    }

    @objc func getLibraries() {
        self.delegate.showLibraries()
//        var dictRoot: NSDictionary?
//        if let path = Bundle.main.path(forResource: "Acknowledgements", ofType: "plist") {
//            dictRoot = NSDictionary(contentsOfFile: path)
//        }
//
//        if let dict = dictRoot {
//            // Your dictionary contains an array of dictionary
//            // Now pull an Array out of it.
//            let libraries:[NSDictionary] = dict["PreferenceSpecifiers"] as! Array
//            // Now a loop through Array to fetch single Item from catList which is Dictionary
//            libraries.forEach({ (library) in
//                print("Category Name \(library["FooterText"]!)")
//            })
//        }
    }
}

// MARK: Helper Methods
extension CountryListVC {

    private func reloadCountryList(countries: [String]) {
        self.filteredCountries = countries
        self.dataSource.countries = countries
        self.rootView.tableView.reloadData()
    }

}

// MARK: UITableViewDelegate Methods
extension CountryListVC: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.view.endEditing(true)
        self.delegate.getCountryStatistics(country: self.filteredCountries[indexPath.item])
    }
}

extension CountryListVC: UISearchBarDelegate {
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        DispatchQueue.main.async {
            self.rootView.showSearchBar(false)
            self.reloadCountryList(countries: self.countries.countries)
        }

        if #available(iOS 13.0, *) {
            searchBar.searchTextField.text = nil
        } else {
            searchBar.text = nil
        }

        self.view.endEditing(true)
    }

    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let text = searchBar.text else { return }
        let countries: [String]

        switch text.isEmpty {
            case true:
                countries = self.countries.countries

            case false:
                countries = self.countries.countries.filter { (country: String) -> Bool in
                    return country.lowercased().contains(searchText.lowercased())
                }.sorted(by: { $0.uppercased() < $1.uppercased() })
        }

        self.reloadCountryList(countries: countries)
    }
}
