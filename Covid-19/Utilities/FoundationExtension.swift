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

    public func chunkFive(size: CGFloat) -> UIFont {
        return UIFont(name: "ChunkFive-Regular", size: size)!
    }

    public func seasideResortNF(size: CGFloat) -> UIFont {
        return UIFont(name: "SeasideResortNF", size: size)!
    }

    public func leagueSpartan(size: CGFloat) -> UIFont {
        return UIFont(name: "LeagueSpartan-Bold", size: size)!
    }

    public func alphaEcho(size: CGFloat) -> UIFont {
        return UIFont(name: "AlphaEcho", size: size)!
    }

    public func kinsaleDisplay(size: CGFloat) -> UIFont {
        return UIFont(name: "KinsaleDisplay", size: size)!
    }

}
