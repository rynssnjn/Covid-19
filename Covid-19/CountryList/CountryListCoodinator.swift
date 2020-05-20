//
//  CountryListCoodinator.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import RSJ
import Astral
import UIKit

public final class CountryListCoordinator: AbstractCoordinator {

    // MARK: Initializer
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController

        super.init()
        self.navigationController.delegate = self
    }

    // MARK: Stored Properties
    private unowned let navigationController: UINavigationController
    private let service: CountryListService = CountryListService()

    // MARK: Instance Methods
    public override func start() {
        super.start()
        self.navigationController.rsj.showActivityIndicator()
        self.service.getCountries()
            .onSuccess(DispatchQueue.main.context) { [weak self] (countries: Countries) -> Void in
                guard let s = self else { return }
                let vc: CountryListVC = CountryListVC(
                    delegate: s,
                    countries: countries
                ) // swiftlint:disable:this identifier_name
                s.navigationController.viewControllers = [vc]
            }
            .onFailure(DispatchQueue.main.context) { [weak self] (_: NetworkingError) -> Void in
                guard let s = self else { return }
                RSJAlert(message: "general_error".localized, viewController: s.navigationController)
                    .showAlert(firstAction: RSJAlertAction(
                        title: "close".localized,
                        style: UIAlertAction.Style.destructive
                    ))
            }
            .onComplete(DispatchQueue.main.context) { [weak self] (_) -> Void in
                guard let s = self else { return }
                s.navigationController.rsj.hideActivityIndicator()
            }
    }
}

// MARK: CountryListVCDelegate Methods
extension CountryListCoordinator: CountryListVCDelegate {
    public func getCountryStatistics(country: String) {
        self.navigationController.rsj.showActivityIndicator()
        self.service.getStatistics(country: country)
            .onSuccess(DispatchQueue.main.context) { [weak self] (countryStatistics: CountryStatistics) -> Void in
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
            .onFailure(DispatchQueue.main.context) { [weak self] (_: NetworkingError) -> Void in
                guard let s = self else { return }
                RSJAlert(message: "general_error".localized, viewController: s.navigationController)
                    .showAlert(firstAction: RSJAlertAction(
                        title: "close".localized,
                        style: UIAlertAction.Style.destructive
                    ))
            }
            .onComplete(DispatchQueue.main.context) { [weak self] (_) -> Void in
                guard let s = self else { return }
                s.navigationController.rsj.hideActivityIndicator()
            }
    }

    public func showLibraries() {
        let coordinator: AcknowledgementCoordinator = AcknowledgementCoordinator(
            delegate: self,
            navigationController: self.navigationController
        )

        coordinator.start()
        self.add(childCoordinator: coordinator)
    }

}

// MARK: CountryStatisticsCoordinatorDelegate Methods
extension CountryListCoordinator: CountryStatisticsCoordinatorDelegate {}

// MARK: LibrariesCoordinatorDelegate Methods
extension CountryListCoordinator: AcknowledgementCoordinatorDelegate {}

// MARK: UINavigationControllerDelegate Methods
extension CountryListCoordinator: UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) { //swiftlint:disable:this line_length

        guard
            let fromViewController = navigationController.transitionCoordinator?.viewController(
                forKey: UITransitionContextViewControllerKey.from
            ),
            !navigationController.viewControllers.contains(fromViewController),
            fromViewController is CountryStatisticsVC || fromViewController is AcknowledgementVC
        else {
            return
        }

        guard
            let coordinator = self.childCoordinators.first(where: {
                $0 is CountryStatisticsCoordinator || $0 is AcknowledgementCoordinator
            })
        else {
            return
        }

        self.remove(childCoordinator: coordinator)
        self.navigationController.delegate = self
    }
}
