//
//  Astral
//  Copyright (c) Julio Miguel Alorro
//  Licensed under the MIT license. See LICENSE file
//

import struct Foundation.URLRequest

/**
 The DSL used for URLRequest extensions.
*/
public struct AstralURLExtension {

    // MARK: Initializer
    /**
     AstralExtension is a struct used as a DSL for Astral specific extensions of existing Foundation classes/structs.
     - parameter base: The instance being managed to by the AstralExtension.
    */
    public init(base: URLRequest) {
        self.base = base
    }

    /**
     The underlying URLRequest
    */
    public let base: URLRequest

}

public extension AstralURLExtension {

    /**
     The string representation of the cURL command of the URLRequest.
    */
    var curlString: String {
        #if DEBUG
            // Logging URL requests in whole may expose sensitive data,
            // or open up possibility for getting access to your user data,
            // so make sure to disable this feature for production builds!
            var result = "curl -k "

            if let method = self.base.httpMethod {
                result += "-X \(method) \\\n"
            }

            if let headers = self.base.allHTTPHeaderFields {
                for (header, value) in headers {
                    result += "-H \"\(header): \(value)\" \\\n"
                }
            }

            if let body = self.base.httpBody, !body.isEmpty {

                let dataString: String

                if let string = String(data: body, encoding: String.Encoding.utf8) {

                    dataString = string

                } else {

                    dataString = body.base64EncodedString()

                }

                switch dataString.isEmpty {
                    case true:
                        break

                    case false:
                        result += "-d '\(dataString)' \\\n"
                }

            }

            if let url = self.base.url {
                result += url.absoluteString
            }

            return result

        #else
            return ""

        #endif
    }

}

public extension URLRequest {

    /**
     The DSL instance.
    */
    var ast: AstralURLExtension {
        return AstralURLExtension(base: self)
    }

}
