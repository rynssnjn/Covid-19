//
//  Constants.swift
//  Covid-19
//
//  Created by Rael San Juan on 3/29/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation

let NetworkQueue: DispatchQueue = DispatchQueue(
    label: "NetworkQueue",
    qos: DispatchQoS.utility,
    attributes: DispatchQueue.Attributes.concurrent
)

public enum Constants {

    public static let apiKey = "e3c67bd577msh3d65758c607c0fap132613jsnceb804952c4e"
}
