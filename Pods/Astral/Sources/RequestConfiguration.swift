//
//  Astral
//  Copyright (c) Julio Miguel Alorro
//  Licensed under the MIT license. See LICENSE file
//

import struct Foundation.URLComponents

/**
 A RequestConfiguration defines the base URL and base headers of a Request
*/
public protocol RequestConfiguration: CustomStringConvertible, CustomDebugStringConvertible {
    /**
     Scheme of Request
    */
    var scheme: URLScheme { get }

    /**
     Host of Request
    */
    var host: String { get }

    /**
     The URL path that is common in all Requests that use an instance of this RequestConfiguration
    */
    var basePathComponents: [String] { get }

    /**
     The URLComponents that are common in all Requests that use an isntance of this RequestConfiguration. 
     
     The default implementation creates a URLComponents instance and adds the scheme and host.
     
     The path property of baseURLComponents is finalized by the RequestBuilder.
    */
    var baseURLComponents: URLComponents { get }

    /**
     The headers that are common in all Requests that use an instance of this RequestConfiguration
    */
    var baseHeaders: Set<Header> { get }

}

public extension RequestConfiguration {

    var baseURLComponents: URLComponents {
        var components: URLComponents = URLComponents()
        components.scheme = self.scheme.rawValue
        components.host = self.host

        return components
    }

    var description: String {
        let strings: [String] = [
            "Scheme: \(self.scheme)",
            "Host: \(self.host)",
            "BasePathComponents: \(self.basePathComponents)",
            "BaseURLComponents: \(self.baseURLComponents)",
            "BaseHeaders: \(self.baseHeaders)"
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
