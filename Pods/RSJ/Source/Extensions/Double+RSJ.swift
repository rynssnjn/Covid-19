//
//  Double+RSJ.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import struct CoreGraphics.CGFloat

/**
 A Domain Specific Language for Double to access custom methods
*/
public struct RSJDoubleSpecific {

    // MARK: Stored Propeties
    /**
     Specific Double instance
    */
    public let double: Double

}

public extension RSJDoubleSpecific {

    /**
     Double as a String
    */
    var stringValue: String {
        return "\(self.double)"
    }

    /**
     Double as an Integer
    */
    var integerValue: Int {
        return Int(self.double)
    }

    /**
     Double as a Float
    */
    var floatValue: Float {
        return Float(self.double)
    }

    /**
     Double as a CGFloat
    */
    var cgFloatValue: CGFloat {
        return CGFloat(self.double)
    }

    /**
     Double as a UInt8
     */
    var uintValue: UInt {
        return UInt(self.double)
    }

    /**
     Double as a UInt8
    */
    var uint8Value: UInt8 {
        return UInt8(self.double)
    }

    /**
     Double as a UInt16
    */
    var uint16Value: UInt16 {
        return UInt16(self.double)
    }

    /**
     Double as a UInt32
    */
    var uint32Value: UInt32 {
        return UInt32(self.double)
    }

    /**
     Double as a UInt64
    */
    var uint64Value: UInt64 {
        return UInt64(self.double)
    }

    /**
     Double as a UInt8
    */
    var int8Value: Int8 {
        return Int8(self.double)
    }

    /**
     Double as a UInt16
    */
    var int16Value: Int16 {
        return Int16(self.double)
    }

    /**
     Double as a UInt32
    */
    var int32Value: Int32 {
        return Int32(self.double)
    }

    /**
     Double as a UInt64
    */
    var int64Value: Int64 {
        return Int64(self.double)
    }

}

public extension Double {

    /**
     RSJDoubleSpecific instance to access custom methods
    */
    var rsj: RSJDoubleSpecific {
        return RSJDoubleSpecific(double: self)
    }

}
