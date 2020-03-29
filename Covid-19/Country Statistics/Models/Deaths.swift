//
//  CountryStatistics.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation

public struct Deaths: Decodable {
    // MARK: CodingKeys
    public enum CodingKeys: String, CodingKey {
        case new
        case total
    }

    // MARK: Initializer
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Deaths.CodingKeys.self)
        self.new = try container.decodeIfPresent(String.self, forKey: Deaths.CodingKeys.new)
        self.total = try container.decode(Int.self, forKey: Deaths.CodingKeys.total)
    }

    // MARK: Stored Properties
    public let new: String?
    public let total: Int
}
