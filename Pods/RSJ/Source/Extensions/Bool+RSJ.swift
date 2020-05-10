//
//  Bool+RSJ.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation

/**
 A Domain Specific Language for Bool to access custom methods
 */
public struct RSJBoolSpecific {

    // MARK: Stored Propeties
    /**
     Underlying Bool instance
     */
    public let bool: Bool

}

public extension RSJBoolSpecific {

    /**
     Bool is true
     */
    var isTrue: Bool {
        return self.bool == true
    }

    /**
     Bool is false
     */
    var isFalse: Bool {
        return self.bool == false
    }
}

public extension Bool {

    /**
     RSJBoolSpecific instance to access custom methods
     */
    var rsj: RSJBoolSpecific {
        return RSJBoolSpecific(bool: self)
    }
}
