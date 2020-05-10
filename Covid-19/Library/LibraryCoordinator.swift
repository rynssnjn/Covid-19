//
//  LibraryCoordinator.swift
//  Covid-19
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import RSJ

public final class LibraryCoordinator: AbstractCoordinator {

    // MARK: Delegate Properties
    private unowned let delegate: LibraryCoordinatorDelegate

    // MARK: Initializer
    public init(delegate: LibraryCoordinatorDelegate, library: Acknowledgement, navigationController: UINavigationController) { //swiftlint:disable:this line_length
        self.delegate = delegate
        self._library = library
        self.navigationController = navigationController

        super.init()
    }

    // MARK: Stored Properties
    private unowned let navigationController: UINavigationController
    public let _library: Acknowledgement

    // MARK: Instance Methods
    public override func start() {
        super.start()

        let vc: LibraryVC = LibraryVC(delegate: self)

        self.navigationController.pushViewController(vc, animated: true)
    }
}

// MARK: LibraryVCDelegate Properties
extension LibraryCoordinator: LibraryVCDelegate {
    public var library: Acknowledgement {
        return self._library
    }

    public func close() {
        self.navigationController.popViewController(animated: true)
    }
}
