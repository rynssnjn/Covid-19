//
//  CountryHistoryService.swift
//  Covid-19
//
//  Created by Rael San Juan on 4/4/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation


import Foundation
import Astral
import BrightFutures
import BFAstral

public struct CountryHistoryService: AbstractAPIService {

    public func getHistory(country: String) -> Future<CountryStatistics, NetworkingError> {
        let request: Request = CountryHistoryRequest(country: country)

        return self.transform(request: request)
    }
}
