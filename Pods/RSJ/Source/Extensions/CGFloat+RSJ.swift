//
//  CGFloat+RSJ.swift
//  RSJ
//
//  Created by Rael San Juan on 5/10/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import struct CoreGraphics.CGFloat

/**
 A Domain Specific Language for Float to access custom methods
 */
public struct RSJCGFloatSpecific {

    // MARK: Stored Propeties
    /**
     Underlying CGFloat instance
    */
    public let cgFloat: CGFloat

}

public extension RSJCGFloatSpecific {

    /**
     CGFloat as a String
    */
    var stringValue: String {
        return "\(self.cgFloat)"
    }

    /**
     CGFloat as an Integer
    */
    var integerValue: Int {
        return Int(self.cgFloat)
    }

    /**
     CGFloat as a Double
    */
    var doubleValue: Double {
        return Double(self.cgFloat)
    }

    /**
     CGFloat as a Float
    */
    var floatValue: Float {
        return Float(self.cgFloat)
    }

    /**
     CGFloat as a UInt
     */
    var uintValue: UInt {
        return UInt(self.cgFloat)
    }

    /**
     CGFloat as a UInt8
    */
    var uint8Value: UInt8 {
        return UInt8(self.cgFloat)
    }

    /**
     CGFloat as a UInt16
    */
    var uint16Value: UInt16 {
        return UInt16(self.cgFloat)
    }

    /**
     CGFloat as a UInt32
    */
    var uint32Value: UInt32 {
        return UInt32(self.cgFloat)
    }

    /**
     CGFloat as a UInt64
    */
    var uint64Value: UInt64 {
        return UInt64(self.cgFloat)
    }

    /**
     CGFloat as a UInt8
    */
    var int8Value: Int8 {
        return Int8(self.cgFloat)
    }

    /**
     CGFloat as a UInt16
    */
    var int16Value: Int16 {
        return Int16(self.cgFloat)
    }

    /**
     CGFloat as a UInt32
    */
    var int32Value: Int32 {
        return Int32(self.cgFloat)
    }

    /**
     CGFloat as a UInt64
    */
    var int64Value: Int64 {
        return Int64(self.cgFloat)
    }

}

public extension CGFloat {

    /**
     RSJCGFloatSpecific instance to access custom methods
    */
    var rsj: RSJCGFloatSpecific {
        return RSJCGFloatSpecific(cgFloat: self)
    }

}
