//
//  CountryStatisticsCoordinator.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import Kio

public final class CountryStatisticsCoordinator: AbstractCoordinator {

    // MARK: Delegate Properties
    private unowned let delegate: CountryStatisticsCoordinatorDelegate

    // MARK: Initializer
    public init(delegate: CountryStatisticsCoordinatorDelegate, statistics: Statistics, navigationController: UINavigationController) {
        self.delegate = delegate
        self.statistics = statistics
        self.navigationController = navigationController
    }

    // MARK: Stored Properties
    private unowned let navigationController: UINavigationController
    private let statistics: Statistics

    // MARK: Computed Properties

    // MARK: Instance Methods
    public override func start() {
        let vc: CountryStatisticsVC = CountryStatisticsVC(
            delegate: self,
            statistics: self.statistics
        )

        self.navigationController.pushViewController(vc, animated: true)
    }
}

// MARK: CountryStatisticsVCDelegate Methods
extension CountryStatisticsCoordinator: CountryStatisticsVCDelegate {}
