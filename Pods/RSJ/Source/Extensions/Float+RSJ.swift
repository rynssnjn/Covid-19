//
//  Float+RSJ.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import struct CoreGraphics.CGFloat

/**
 A Domain Specific Language for Float to access custom methods
 */
public struct RSJFloatSpecific {

    // MARK: Stored Propeties
    /**
     Underlying Float instance
    */
    public let float: Float

}

public extension RSJFloatSpecific {

    /**
     Float as a String
    */
    var stringValue: String {
        return "\(self.float)"
    }

    /**
     Float as an Integer
    */
    var integerValue: Int {
        return Int(self.float)
    }

    /**
     Float as a Double
    */
    var doubleValue: Double {
        return Double(self.float)
    }

    /**
     Float as a CGFloat
    */
    var cgFloatValue: CGFloat {
        return CGFloat(self.float)
    }

    /**
     Float as a UInt
     */
    var uintValue: UInt {
        return UInt(self.float)
    }

    /**
     Float as a UInt8
    */
    var uint8Value: UInt8 {
        return UInt8(self.float)
    }

    /**
     Float as a UInt16
    */
    var uint16Value: UInt16 {
        return UInt16(self.float)
    }

    /**
     Float as a UInt32
    */
    var uint32Value: UInt32 {
        return UInt32(self.float)
    }

    /**
     Float as a UInt64
    */
    var uint64Value: UInt64 {
        return UInt64(self.float)
    }

    /**
     Float as a UInt8
    */
    var int8Value: Int8 {
        return Int8(self.float)
    }

    /**
     Float as a UInt16
    */
    var int16Value: Int16 {
        return Int16(self.float)
    }

    /**
     Float as a UInt32
    */
    var int32Value: Int32 {
        return Int32(self.float)
    }

    /**
     Float as a UInt64
    */
    var int64Value: Int64 {
        return Int64(self.float)
    }

}

public extension Float {

    /**
     RSJFloatSpecific instance to access custom methods
     */
    var rsj: RSJFloatSpecific {
        return RSJFloatSpecific(float: self)
    }

}
