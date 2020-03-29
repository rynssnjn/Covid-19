//
//  Astral
//  Copyright (c) Julio Miguel Alorro
//  Licensed under the MIT license. See LICENSE file
//

import struct Foundation.Data
import class Foundation.HTTPURLResponse

/**
 A Response encapsulates the data retreived after an http request was made.
*/
public protocol Response: CustomStringConvertible, CustomDebugStringConvertible {
    /**
     Initializer for Response
    */
    init(httpResponse: HTTPURLResponse, data: Data)

    /**
     Status code of the http response
    */
    var statusCode: Int { get }

    /**
     Payload of information from the http response as Data
    */
    var data: Data { get }

    /**
     Payload of information from the http response as JSON
    */
    var json: JSON { get }

}

public extension Response {
    var description: String {
        let strings: [String] = [
            "Status Code: \(self.statusCode)",
            "Data: \(self.data)",
            "JSON: \(self.json)"
        ]

        let description: String = strings.reduce(into: "") { (result: inout String, string: String) -> Void in
            result = "\(result)\n\t\(string)"
        }

        return "Type: \(type(of: self)): \(description)"
    }

    var debugDescription: String {
        return self.description
    }
}
