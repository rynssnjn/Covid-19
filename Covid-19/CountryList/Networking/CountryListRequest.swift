//
//  CountryListRequest.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import Astral

public struct CountryListRequest: Request {

    // MARK: Computed Properties
    public var configuration: RequestConfiguration {
        return BaseConfiguration()
    }

    public var method: HTTPMethod {
        return HTTPMethod.get
    }

    public var pathComponents: [String] {
        return [
            "countries/"
        ]
    }

    public var parameters: Parameters = Parameters.none

    public var headers: Set<Header> {
        return [
            Header(key: Header.Key.custom("x-rapidapi-host"), value: Header.Value.custom("covid-193.p.rapidapi.com")),
            Header(key: Header.Key.custom("x-rapidapi-key"), value: Header.Value.custom(Constants.apiKey))
        ]
    }

    public var cachePolicy: URLRequest.CachePolicy? {
        return nil
    }
}
