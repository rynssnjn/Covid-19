//
//  BaseConfiguration.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import Astral

public struct BaseConfiguration: RequestConfiguration {

    // MARK: Computed Properties
    public var scheme: URLScheme {
        return .https
    }

    public var host: String {
        return "covid-193.p.rapidapi.com"
    }

    public var basePathComponents: [String] {
        return []
    }

    public let baseHeaders: Set<Header> = [
        Header(key: Header.Key.contentType, value: Header.Value.mediaType(MediaType.applicationJSON))
    ]
}
