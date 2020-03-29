//
//  Kio
//  Copyright (c) Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

/**
 Result that occurs when a Validator evaluates a string
*/
public enum ValidatorResult {

    /**
     A valid result
    */
    case valid

    /**
     An invalid result with the errors describing the invalid result
    */
    case invalid([Swift.Error])

}

extension ValidatorResult: Equatable {
    public static func == (lhs: ValidatorResult, rhs: ValidatorResult) -> Bool {
        switch (lhs, rhs) {
            case (.valid, .valid): return true
            case (.invalid, .invalid): return true
            case (.valid, .invalid): return false
            case (.invalid, .valid): return false
        }
    }
}
