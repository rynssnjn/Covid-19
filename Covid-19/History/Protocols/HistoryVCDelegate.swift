//
//  HistoryVCDelegate.swift
//  Covid-19
//
//  Created by Rael San Juan on 4/4/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import UIKit

public protocol HistoryVCDelegate: class {

    var country: String { get }

    func close()

    func showDayUpdatePopup(in view: UIView, statistics: [Statistics], date: Date)

    func showPopupAdvanceDate()

}
