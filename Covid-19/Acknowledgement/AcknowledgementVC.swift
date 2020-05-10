//
//  AcknowledgementVC.swift
//  Covid-19
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import RSJ

public final class AcknowledgementVC: RSJViewController {

    // MARK: Delegate Properties
    private unowned let delegate: AcknowledgementVCDelegate

    // MARK: Initializers
    public init(delegate: AcknowledgementVCDelegate, acknowledgements: [Acknowledgement]) {
        self.delegate = delegate
        self.acknowledgements = acknowledgements
        super.init(nibName: nil, bundle: nil)

        self.dataSource = AcknowledgementDataSource(
            tableView: self.rootView.tableView,
            acknowledgements: self.acknowledgements
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Stored Properties
    private var dataSource: AcknowledgementDataSource!
    private let acknowledgements: [Acknowledgement]

    // MARK: UIViewController LifeCycle Methods
    public override func loadView() {
        self.view = AcknowledgementView()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.rootView.tableView.delegate = self
        self.navigationItem.title = "libraries_used".localized

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: #imageLiteral(resourceName: "close_icon").withRenderingMode(UIImage.RenderingMode.alwaysTemplate),
            style: UIBarButtonItem.Style.plain,
            target: self,
            action: #selector(AcknowledgementVC.closeButtonItemTapped)
        )
    }

}

// MARK: Views
private extension AcknowledgementVC {
    unowned var rootView: AcknowledgementView { return self.view as! AcknowledgementView } // swiftlint:disable:this force_cast line_length
}

// MARK: Target Action Methods
private extension AcknowledgementVC {

    @objc func closeButtonItemTapped() {
        self.delegate.close()
    }
}

// MARK: UITableViewDelegate Methods
extension AcknowledgementVC: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.delegate.show(library: self.acknowledgements[indexPath.row])
    }
}
