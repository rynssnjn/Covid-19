//
//  HistoryVC.swift
//  Covid-19
//
//  Created by Rael San Juan on 4/4/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import Kio

public final class HistoryVC: KioViewController {

    // MARK: Delegate Properties
    private unowned let delegate: HistoryVCDelegate

    // MARK: Initializers
    public init(delegate: HistoryVCDelegate) {
        self.delegate = delegate

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Stored Properties

    // MARK: LifeCycle Methods
    public override func loadView() {
        self.view = HistoryView()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: Views
private extension HistoryVC {
    unowned var rootView: HistoryView { return self.view as! HistoryView } // swiftlint:disable:this force_cast line_length
}
