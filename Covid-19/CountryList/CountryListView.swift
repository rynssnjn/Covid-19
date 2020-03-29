//
//  CountryListView.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import SnapKit
import Kio

public final class CountryListView: KioView {

    // MARK: Subviews
    public let tableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.backgroundColor = UIColor.white

        return tableView
    }()

    public let searchBar: UISearchBar = {
        let searchBar: UISearchBar = UISearchBar()
        searchBar.placeholder = "Search Country"
        searchBar.barTintColor = AppUI.Color.lightGray
        searchBar.showsCancelButton = true

        return searchBar
    }()

    // MARK: Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white

        self.kio.subviews(forAutoLayout: self.searchBar, self.tableView)

        self.searchBar.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview().offset(16.0)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(0.0)
        }

        self.tableView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.searchBar.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Instance Methods
    public func showSearchBar(_ isShown: Bool) {
        UIView.animate(withDuration: 0.5) {
            self.searchBar.snp.updateConstraints { (make: ConstraintMaker) -> Void in
                let height: CGFloat = isShown ? 40.0 : 0.0
                make.height.equalTo(height)
            }
        }

        self.setNeedsLayout()
    }
}
