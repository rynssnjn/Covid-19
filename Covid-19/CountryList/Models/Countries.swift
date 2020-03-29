//
//  Countries.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation

public struct Countries: Decodable {

    // MARK: CodingKeys
    public enum CodingKeys: String, CodingKey {
        case response
    }

    // MARK: Initializer
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Countries.CodingKeys.self)
        self.countries = try container.decode([String].self, forKey: Countries.CodingKeys.response)
    }

    // MARK: Stored Properties
    public let countries: [String]
}
