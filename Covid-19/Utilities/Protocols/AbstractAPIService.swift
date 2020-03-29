//
//  AbstractAPIService.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import BFAstral
import Astral
import BrightFutures

public protocol AbstractAPIService {

    func transform<T: Decodable>(request: Request) -> Future<T, NetworkingError>

}

public extension AbstractAPIService {
    var decoder: JSONDecoder { return JSONDecoder() }

    var dispatcher: BFDispatcher { return BFDispatcher() }

    func transform<T: Decodable>(request: Request) -> Future<T, NetworkingError> {
        return BFDispatcher().response(of: request)
            .map(NetworkQueue.context) { (response: Response) -> T in
                do {
                    return try self.decoder.decode(T.self, from: response.data)

                } catch let error {
                    fatalError(error.localizedDescription)

                }
            }
    }
}
