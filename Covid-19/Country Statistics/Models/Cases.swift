//
//  CountryStatistics.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation

public struct Cases: Decodable {
    // MARK: CodingKeys
    public enum CodingKeys: String, CodingKey {
        case new
        case active
        case critical
        case recovered
        case total
    }

    // MARK: Initializer
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Cases.CodingKeys.self)
        self.new = try container.decodeIfPresent(String.self, forKey: Cases.CodingKeys.new)
        self.active = try container.decode(Int.self, forKey: Cases.CodingKeys.active)
        self.critical = try container.decode(Int.self, forKey: Cases.CodingKeys.critical)
        self.recovered = try container.decode(Int.self, forKey: Cases.CodingKeys.recovered)
        self.total = try container.decode(Int.self, forKey: Cases.CodingKeys.total)
    }

    // MARK: Stored Properties
    public let new: String?
    public let active: Int
    public let critical: Int
    public let recovered: Int
    public let total: Int
}
