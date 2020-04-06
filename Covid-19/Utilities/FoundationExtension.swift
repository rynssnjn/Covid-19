//
//  FoundationExtension.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import UIKit

extension String {
    public var localized: String {
        return NSLocalizedString(self, comment: self)
    }

    public var toInteger: Int {
        return Int(self) ?? 0
    }
}

extension UIFont {

    public func alegreya(size: CGFloat) -> UIFont {
        return UIFont(name: "AlegreyaSansSC-Regular", size: size)!
    }

    public func alegreyaBold(size: CGFloat) -> UIFont {
        return UIFont(name: "AlegreyaSansSC-Bold", size: size)!
    }

    public func alegreyaBoldItalic(size: CGFloat) -> UIFont {
        return UIFont(name: "AlegreyaSansSC-BoldItalic", size: size)!
    }

    public func alegreyaItalic(size: CGFloat) -> UIFont {
        return UIFont(name: "AlegreyaSansSC-Italic", size: size)!
    }

    public func alegreyaExtraBold(size: CGFloat) -> UIFont {
        return UIFont(name: "AlegreyaSansSC-ExtraBold", size: size)!
    }

    public func alegreyaExtraBoldItalic(size: CGFloat) -> UIFont {
        return UIFont(name: "AlegreyaSansSC-ExtraBoldItalic", size: size)!
    }

    public func alegreyaLight(size: CGFloat) -> UIFont {
        return UIFont(name: "AlegreyaSansSC-Light", size: size)!
    }

    public func alegreyaLightItalic(size: CGFloat) -> UIFont {
        return UIFont(name: "AlegreyaSansSC-LightItalic", size: size)!
    }

    public func alegreyaMedium(size: CGFloat) -> UIFont {
        return UIFont(name: "AlegreyaSansSC-Medium", size: size)!
    }

    public func alegreyaMediumItalic(size: CGFloat) -> UIFont {
        return UIFont(name: "AlegreyaSansSC-MediumItalic", size: size)!
    }

    public func alegreyaBlack(size: CGFloat) -> UIFont {
        return UIFont(name: "AlegreyaSansSC-Black", size: size)!
    }

    public func alegreyaBlackItalic(size: CGFloat) -> UIFont {
        return UIFont(name: "AlegreyaSansSC-BlackItalic", size: size)!
    }

    public func alegreyaThin(size: CGFloat) -> UIFont {
        return UIFont(name: "AlegreyaSansSC-Thin", size: size)!
    }
}
