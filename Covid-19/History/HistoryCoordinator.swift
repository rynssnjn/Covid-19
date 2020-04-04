//
//  HistoryCoordinator.swift
//  Covid-19
//
//  Created by Rael San Juan on 4/4/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import Kio

public final class HistoryCoordinator: AbstractCoordinator {

    // MARK: Delegate Properties
    private unowned let delegate: HistoryCoordinatorDelegate

    // MARK: Initializer
    public init(delegate: HistoryCoordinatorDelegate, navigationController: UINavigationController) {
        self.delegate = delegate
        self.navigationController = navigationController

        super.init()
    }

    // MARK: Stored Properties
    private unowned let navigationController: UINavigationController

    // MARK: Stored Properties
    public override func start() {
        let vc: HistoryVC = HistoryVC(delegate: self)

        self.navigationController.pushViewController(vc, animated: true)
    }
}

// MARK: HistoryVCDelegate Properties
extension HistoryCoordinator: HistoryVCDelegate {
    
}
