//
//  CountryStatistics.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation

public struct Statistics: Decodable {
    // MARK: CodingKeys
    public enum CodingKeys: String, CodingKey {
        case country
        case cases
        case deaths
        case day
        case time
    }

    // MARK: Initializer
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Statistics.CodingKeys.self)
        self.country = try container.decode(String.self, forKey: Statistics.CodingKeys.country)
        self.cases = try container.decode(Cases.self, forKey: Statistics.CodingKeys.cases)
        self.deaths = try container.decode(Deaths.self, forKey: Statistics.CodingKeys.deaths)
        self.day = try container.decode(String.self, forKey: Statistics.CodingKeys.day)
        self.time = try container.decode(String.self, forKey: Statistics.CodingKeys.time)
    }

    // MARK: Stored Properties
    public let country: String
    public let cases: Cases
    public let deaths: Deaths
    public let day: String
    public let time: String

}
