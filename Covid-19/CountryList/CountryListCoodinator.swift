//
//  CountryListCoodinator.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import Kio
import Astral

public final class CountryListCoordinator: AbstractCoordinator {

    // MARK: Initializer
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController

        super.init()
    }

    // MARK: Stored Properties
    private unowned let navigationController: UINavigationController
    private let service: CountryListService = CountryListService()

    // MARK: Computed Properties

    // MARK: Instance Methods
    public override func start() {
        super.start()
        self.navigationController.kio.showActivityIndicator()
        self.service.getCountries()
            .onSuccess { [weak self] (countries: Countries) -> Void in
                guard let s = self else { return }
                let vc: CountryListVC = CountryListVC(
                    delegate: s,
                    countries: countries
                ) //swiftlint:disable:this identifier_name
                s.navigationController.viewControllers = [vc]
            }
            .onFailure { [weak self] (_: NetworkingError) -> Void in
                guard let s = self else { return }
                let alert: UIAlertController = UIAlertController(
                    title: nil,
                    message: "general_error".localized,
                    preferredStyle: UIAlertController.Style.alert
                )

                s.navigationController.present(alert, animated: true)
            }
            .onComplete { [weak self] (_) -> Void in
                guard let s = self else { return }
                s.navigationController.kio.hideActivityIndicator()
            }
    }
}

// MARK: CountryListVCDelegate Methods
extension CountryListCoordinator: CountryListVCDelegate {
    public func getCountryStatistics(country: String, onComplete: @escaping () -> Void) {
        self.service.getStatistics(country: country)
            .onSuccess { [weak self] (countryStatistics: CountryStatistics) -> Void in
                if let statistics: Statistics = countryStatistics.statistics.first {
                    guard let s = self else { return }
                    let coordinator: CountryStatisticsCoordinator = CountryStatisticsCoordinator(
                        delegate: s,
                        statistics: statistics,
                        navigationController: s.navigationController
                    )

                    coordinator.start()
                    s.add(childCoordinator: coordinator)
                }
            }
            .onFailure { [weak self] (_: NetworkingError) -> Void in
                guard let s = self else { return }
                let alert: UIAlertController = UIAlertController(
                    title: nil,
                    message: "An error has occured",
                    preferredStyle: UIAlertController.Style.alert
                )

                s.navigationController.present(alert, animated: true)
            }
            .onComplete { (_) -> Void in
                onComplete()
            }
    }
}

// MARK: CountryStatisticsCoordinatorDelegate Methods
extension CountryListCoordinator: CountryStatisticsCoordinatorDelegate {}
