//
//  CountryStatisticsCoordinator.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Astral
import Foundation
import RSJ

public final class CountryStatisticsCoordinator: AbstractCoordinator {

    // MARK: Delegate Properties
    private unowned let delegate: CountryStatisticsCoordinatorDelegate

    // MARK: Initializer
    public init(delegate: CountryStatisticsCoordinatorDelegate, statistics: Statistics, navigationController: UINavigationController) { //swiftlint:disable:this line_length
        self.delegate = delegate
        self.statistics = statistics
        self.navigationController = navigationController

        super.init()
        self.navigationController.delegate = self
    }

    // MARK: Stored Properties
    private unowned let navigationController: UINavigationController
    private let statistics: Statistics
    private let service: CountryHistoryService = CountryHistoryService()

    // MARK: Instance Methods
    public override func start() {
        super.start()
        let vc: CountryStatisticsVC = CountryStatisticsVC(
            delegate: self,
            statistics: self.statistics
        )

        self.navigationController.pushViewController(vc, animated: true)
    }
}

// MARK: CountryStatisticsVCDelegate Methods
extension CountryStatisticsCoordinator: CountryStatisticsVCDelegate {

    public func close() {
        self.navigationController.popViewController(animated: true)
    }

    public func goToHistory() {
        self.navigationController.rsj.showActivityIndicator()
        self.service.getHistory(country: self.statistics.country)
            .onSuccess(DispatchQueue.main.context) { [weak self] (country: CountryStatistics) -> Void in
                guard let s = self else { return }
                let coordinator: HistoryCoordinator = HistoryCoordinator(
                    delegate: s,
                    navigationController: s.navigationController,
                    statistics: country.statistics
                )

                coordinator.start()
                s.add(childCoordinator: coordinator)
            }
            .onFailure(DispatchQueue.main.context) { [weak self] (_: NetworkingError) -> Void in
                guard let s = self else { return }
                RSJAlert(message: "general_error".localized, viewController: s.navigationController)
                    .showAlert(firstAction: (
                        title: "close".localized,
                        style: UIAlertAction.Style.destructive,
                        action: {}
                    ))
            }
            .onComplete(DispatchQueue.main.context) { [weak self] (_) -> Void in
                guard let s = self else { return }
                s.navigationController.rsj.hideActivityIndicator()
            }
    }
}

// MARK: HistoryCoordinatorDelegate Methods
extension CountryStatisticsCoordinator: HistoryCoordinatorDelegate {

    public var country: String {
        return self.statistics.country
    }

}

// MARK: UINavigationControllerDelegate Methods
extension CountryStatisticsCoordinator: UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) { //swiftlint:disable:this line_length

        guard
            let fromViewController = navigationController.transitionCoordinator?.viewController(
                forKey: UITransitionContextViewControllerKey.from
            ),
            !navigationController.viewControllers.contains(fromViewController),
            fromViewController is HistoryVC
        else {
            return
        }

        guard
            let coordinator = self.childCoordinators.first(where: { $0 is HistoryCoordinator })
        else {
            return
        }

        self.remove(childCoordinator: coordinator)
        self.navigationController.delegate = self.delegate
    }
}
