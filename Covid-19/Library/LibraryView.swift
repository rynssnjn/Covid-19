//
//  LibraryView.swift
//  Covid-19
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import RSJ
import SnapKit

public final class LibraryView: RSJView {

    // MARK: Subviews
    public let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = AppUI.Color.secondary
        label.font = UIFont().alegreyaBlack(size: 45.0)
        label.textAlignment = NSTextAlignment.left

        return label
    }()

    public let contentTextView: UITextView = {
        let view: UITextView = UITextView()
        view.isEditable = false
        view.backgroundColor = AppUI.Color.primary
        view.textColor = UIColor.white
        view.font = UIFont().alegreya(size: 20.0)
        view.textAlignment = NSTextAlignment.left

        return view
    }()

    // MARK: Initializers
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = AppUI.Color.primary
        self.rsj.subviews(forAutoLayout: self.titleLabel, self.contentTextView)

        self.titleLabel.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview().offset(16.0)
            make.leading.equalToSuperview().offset(16.0)
            make.trailing.equalToSuperview().inset(16.0)
            make.height.equalTo(50.0)
        }

        self.contentTextView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(16.0)
            make.leading.equalToSuperview().offset(16.0)
            make.trailing.equalToSuperview().inset(16.0)
            make.bottom.equalToSuperview().inset(16.0)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Instance Methods
    public func setTexts(acknowledgement: Acknowledgement) {
        self.titleLabel.text = acknowledgement.title
        self.contentTextView.text = acknowledgement.content
    }
}
