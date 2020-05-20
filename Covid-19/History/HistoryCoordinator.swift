//
//  HistoryCoordinator.swift
//  Covid-19
//
//  Created by Rael San Juan on 4/4/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import RSJ
import STPopup

public final class HistoryCoordinator: AbstractCoordinator {

    // MARK: Delegate Properties
    private unowned let delegate: HistoryCoordinatorDelegate

    // MARK: Initializer
    public init(delegate: HistoryCoordinatorDelegate, navigationController: UINavigationController, statistics: [Statistics]) { // swiftlint:disable:this line_length
        self.delegate = delegate
        self.navigationController = navigationController
        self.statistics = statistics

        super.init()
    }

    // MARK: Stored Properties
    private unowned let navigationController: UINavigationController
    private let statistics: [Statistics]
    private weak var vc: HistoryVC?
    private var popupVC: STPopupController?

    // MARK: Instance Methods
    public override func start() {
        let vc: HistoryVC = HistoryVC(delegate: self, statistics: self.statistics)
        self.vc = vc
        self.navigationController.pushViewController(vc, animated: true)
    }
}

// MARK: HistoryVCDelegate Properties
extension HistoryCoordinator: HistoryVCDelegate {
    public var country: String {
        return self.delegate.country
    }

    public func close() {
        self.navigationController.popViewController(animated: true)
    }

    public func showNoCasesPopup(in view: UIView, date: Date) {
         let vc: DayUpdateVC = DayUpdateVC(delegate: self, date: date)

               guard let presentingVC = self.vc else { return }
               switch UIIdiom {
                   case .pad:
                       let nvc: UINavigationController = UINavigationController(rootViewController: vc)
                       nvc.modalPresentationStyle = UIModalPresentationStyle.popover
                       nvc.preferredContentSize = CGSize(width: 450.0, height: 280.0)
                       let popoverVC: UIPopoverPresentationController = nvc.popoverPresentationController!
                       popoverVC.sourceView = view
                       popoverVC.sourceRect = view.bounds
                       self.navigationController.present(nvc, animated: true, completion: nil)

               default:
                   vc.contentSizeInPopup = CGSize(
                       width: presentingVC.view.bounds.width,
                       height: 283.0
                   )

                   let popupVC: STPopupController = STPopupController(rootViewController: vc)
                   self.popupVC = popupVC
                   popupVC.style = STPopupStyle.bottomSheet
                   popupVC.containerView.layer.cornerRadius = 5.0
                   popupVC.hidesCloseButton = true
                   popupVC.present(in: presentingVC)
               }
    }

    public func showDayUpdatePopup(in view: UIView, statistics: Statistics, date: Date) {
        let vc: DayUpdateVC = DayUpdateVC(delegate: self, statistics: statistics, date: date)

        guard let presentingVC = self.vc else { return }
        switch UIIdiom {
            case .pad:
                let nvc: UINavigationController = UINavigationController(rootViewController: vc)
                nvc.modalPresentationStyle = UIModalPresentationStyle.popover
                nvc.preferredContentSize = CGSize(width: 450.0, height: 280.0)
                let popoverVC: UIPopoverPresentationController = nvc.popoverPresentationController!
                popoverVC.sourceView = view
                popoverVC.sourceRect = view.bounds
                self.navigationController.present(nvc, animated: true, completion: nil)

        default:
            vc.contentSizeInPopup = CGSize(
                width: presentingVC.view.bounds.width,
                height: 283.0
            )

            let popupVC: STPopupController = STPopupController(rootViewController: vc)
            self.popupVC = popupVC
            popupVC.style = STPopupStyle.bottomSheet
            popupVC.containerView.layer.cornerRadius = 5.0
            popupVC.hidesCloseButton = true
            popupVC.present(in: presentingVC)
        }
    }

    public func showPopupAdvanceDate() {
        RSJAlert(
            title: "error".localized,
            message: "future_date_error".localized,
            viewController: self.navigationController
        ).showAlert(firstAction: (
            title: "close".localized,
            style: UIAlertAction.Style.destructive,
            action: {}
        ))
    }
}

// MARK: DayUpdateVCDelegate Properties
extension HistoryCoordinator: DayUpdateVCDelegate {
    public func dismiss() {
        guard let popupVC = self.popupVC else { return }
        popupVC.dismiss()
    }
}
