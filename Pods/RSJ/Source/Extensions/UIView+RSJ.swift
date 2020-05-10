//
//  UIView+RSJ.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import class UIKit.UIView
import struct CoreGraphics.CGFloat

/**
 A Domain Specific Language for UIView to access custom methods
*/
public struct RSJViewSpecific {

    // MARK: Stored Propeties
    /**
     Specific UIView instance
    */
    public let view: UIView

}

public extension RSJViewSpecific {

    /**
     Adds subview and sets translatesAutoresizingMaskIntoConstraints to false.

     - Parameter subview: The subview to be added for AutoLayout.
    */
    func subview(forAutoLayout subview: UIView) {
        self.view.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
    }

    /**
     Adds subviews and sets translatesAutoresizingMaskIntoConstraints to false.

     - Parameter subviews: The subviews to be added for AutoLayout.
    */
    func subviews(forAutoLayout subviews: UIView...) {
        self.subviews(forAutoLayout: subviews)
    }

    /**
     Array version of subview(forAutoLayout subview:) method.

     Adds subviews and sets translatesAutoresizingMaskIntoConstraints to false.

     - Parameter subviews: The subviews to be added for AutoLayout.
    */
    func subviews(forAutoLayout subviews: [UIView]) {
        subviews.forEach(self.subview)
    }

    /**
     Helper function that sets the UIView's cornerRadius to a
     specific value and sets that UIView's layer to the same backgroundColor

     More performant than setting maskToBounds to true when dealing with many subviews
     with rounded corners such as UICollectionView/UITableView oriented screens

     - Parameter value: The value used to set the UIView's cornerRadius.
    */
    func cornerRadius(of value: CGFloat) {
        self.view.layer.cornerRadius = value
        self.view.layer.backgroundColor = self.view.backgroundColor?.cgColor
    }

}

public extension UIView {
    /**
     RSJViewSpecific instance use to access custom methods
    */
    var rsj: RSJViewSpecific {
        return RSJViewSpecific(view: self)
    }
}
