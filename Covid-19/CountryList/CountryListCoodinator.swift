//
//  CountryListCoodinator.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import Kio

public final class CountryListCoordinator: AbstractCoordinator {

    // MARK: Initializer
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController

        super.init()
    }

    // MARK: Stored Properties
    private unowned let navigationController: UINavigationController

    // MARK: Computed Properties

    // MARK: Instance Methods
    public override func start() {
        super.start()

        let vc: CountryListVC = CountryListVC(delegate: self) //swiftlint:disable:this identifier_name
        self.navigationController.viewControllers = [vc]
    }
}

// MARK: CountryListVCDelegate Methods
extension CountryListCoordinator: CountryListVCDelegate {}
