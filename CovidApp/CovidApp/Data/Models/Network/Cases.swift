//
//  Cases.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//

import Foundation


struct Cases: Codable {
    var count: Int
    var results: [Case]
}

struct Case: Codable {
    var startDate: Date
    var endDate: Date
    var country: String?
}
