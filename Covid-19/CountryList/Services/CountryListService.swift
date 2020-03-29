//
//  CountryListService.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import Astral
import BrightFutures
import BFAstral

public struct CountryListService: AbstractAPIService {

    public func getCountries() -> Future <Countries, NetworkingError> {
        let request: Request = CountryListRequest()

        return self.transform(request: request)
    }

    public func getStatistics(country: String) -> Future<CountryStatistics, NetworkingError> {
        let request: Request = CountryStatisticsRequest(country: country)

        return self.transform(request: request)

    }
}
