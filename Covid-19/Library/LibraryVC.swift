//
//  LibraryVC.swift
//  Covid-19
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import RSJ

public final class LibraryVC: RSJViewController {

    // MARK: Delegate Properties
    private unowned let delegate: LibraryVCDelegate

    // MARK: Initializer
    public init(delegate: LibraryVCDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UIViewController LifeCycle Methods
    public override func loadView() {
        self.view = LibraryView()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        self.rsj.setUpNavigationItem { [weak self] (item: UINavigationItem) -> Void in
            guard let s = self else { return }
            item.leftBarButtonItem = UIBarButtonItem(
                image: #imageLiteral(resourceName: "close_icon").withRenderingMode(UIImage.RenderingMode.alwaysTemplate),
                style: UIBarButtonItem.Style.plain,
                target: s,
                action: #selector(LibraryVC.closeButtonItemTapped)
            )
        }

        self.rootView.setTexts(acknowledgement: self.delegate.library)
    }
}

// MARK: Views
private extension LibraryVC {
    unowned var rootView: LibraryView { return self.view as! LibraryView } // swiftlint:disable:this force_cast line_length
}

// MARK: Target Action Methods
private extension LibraryVC {
    @objc func closeButtonItemTapped() {
        self.delegate.close()
    }
}
