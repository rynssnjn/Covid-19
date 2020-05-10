//
//  Int+RSJ.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import struct CoreGraphics.CGFloat

/**
 A Domain Specific Language for Int to access custom methods
*/
public struct RSJIntSpecific {

    // MARK: Stored Propeties
    /**
     Underlying Int instance
    */
    public let int: Int

}

public extension RSJIntSpecific {

    /**
     Integer as a String
    */
    var stringValue: String {
        return "\(self.int)"
    }

    /**
     Integer as a Double
    */
    var doubleValue: Double {
        return Double(self.int)
    }

    /**
     Integer as a Float
    */
    var floatValue: Float {
        return Float(self.int)
    }

    /**
     Integer as a CGFloat
    */
    var cgFloatValue: CGFloat {
        return CGFloat(self.int)
    }

    /**
     Integer as a UInt
     */
    var uintValue: UInt {
        return UInt(self.int)
    }

    /**
     Integer as a UInt8
    */
    var uint8Value: UInt8 {
        return UInt8(self.int)
    }

    /**
     Integer as a UInt16
    */
    var uint16Value: UInt16 {
        return UInt16(self.int)
    }

    /**
     Integer as a UInt32
    */
    var uint32Value: UInt32 {
        return UInt32(self.int)
    }

    /**
     Integer as a UInt64
    */
    var uint64Value: UInt64 {
        return UInt64(self.int)
    }

    /**
     Integer as a UInt8
    */
    var int8Value: Int8 {
        return Int8(self.int)
    }

    /**
     Integer as a UInt16
    */
    var int16Value: Int16 {
        return Int16(self.int)
    }

    /**
     Integer as a UInt32
    */
    var int32Value: Int32 {
        return Int32(self.int)
    }

    /**
     Integer as a UInt64
    */
    var int64Value: Int64 {
        return Int64(self.int)
    }
}

public extension Int {

    /**
     RSJIntSpecific instance to access custom methods
    */
    var rsj: RSJIntSpecific {
        return RSJIntSpecific(int: self)
    }
}
