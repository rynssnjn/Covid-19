//
//  AcknowledgementCoordinator.swift
//  Covid-19
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import RSJ

public final class AcknowledgementCoordinator: AbstractCoordinator {

    // MARK: Delegate Properties
    private unowned let delegate: AcknowledgementCoordinatorDelegate

    // MARK: Initializer
    public init(delegate: AcknowledgementCoordinatorDelegate, navigationController: UINavigationController) {
        self.delegate = delegate
        self.navigationController = navigationController

        super.init()
        self.navigationController.delegate = self
    }

    // MARK: Stored Properties
    private unowned let navigationController: UINavigationController

    // MARK: Instance Methods
    public override func start() {
        super.start()

        if let acknowledgementFile = Bundle.main.path(forResource: "Acknowledgements", ofType: "plist"),
            let dict = NSDictionary(contentsOfFile: acknowledgementFile) {

            let acknowledgements: [Acknowledgement] = self.transformDictionary(dict)
            let vc: AcknowledgementVC = AcknowledgementVC(
                delegate: self,
                acknowledgements: acknowledgements
            )

            self.navigationController.pushViewController(vc, animated: true)
        }

    }

    private func transformDictionary(_ originalDictionary: NSDictionary) -> [Acknowledgement] {
        var acknowledgements: [Acknowledgement] = []
        if let dict = originalDictionary.object(forKey: "PreferenceSpecifiers") as? NSMutableArray {

            if let mutableTmp = dict.mutableCopy() as? NSMutableArray {
                mutableTmp.removeObject(at: 0)
                mutableTmp.removeLastObject()

                mutableTmp.forEach { (innerDict) -> Void in
                    if let dictionary = innerDict as? NSDictionary,
                        let tempTitle = dictionary.object(forKey: "Title") as? String,
                        let tempContent = dictionary.object(forKey: "FooterText") as? String {
                        acknowledgements.append(Acknowledgement(title: tempTitle, content: tempContent))
                    }
                }
            }
        }

        return acknowledgements
    }
}

extension AcknowledgementCoordinator: AcknowledgementVCDelegate {
    public func show(library: Acknowledgement) {
        let coordinator: LibraryCoordinator = LibraryCoordinator(
            delegate: self,
            library: library,
            navigationController: self.navigationController
        )

        coordinator.start()
        self.add(childCoordinator: coordinator)
    }

    public func close() {
       self.navigationController.popViewController(animated: true)
    }
}

// MARK: LibraryCoordinatorDelegate Methods
extension AcknowledgementCoordinator: LibraryCoordinatorDelegate {}

// MARK: UINavigationControllerDelegate Methods
extension AcknowledgementCoordinator: UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) { //swiftlint:disable:this line_length

        guard
            let fromViewController = navigationController.transitionCoordinator?.viewController(
                forKey: UITransitionContextViewControllerKey.from
            ),
            !navigationController.viewControllers.contains(fromViewController),
            fromViewController is LibraryVC
        else {
            return
        }

        guard
            let coordinator = self.childCoordinators.first(where: { $0 is LibraryCoordinator })
        else {
            return
        }

        self.remove(childCoordinator: coordinator)
        self.navigationController.delegate = self.delegate

    }
}
