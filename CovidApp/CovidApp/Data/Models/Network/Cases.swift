//
//  Cases.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//

import Foundation


struct Cases: Codable{
    var count: Int
    var results: [DateCases]
    var startDate: String
    var endDate: String
}

struct DateCases: Codable, Identifiable {
    var id: Int
    var date: String
    var cases: Case
}

struct Case: Codable, Identifiable {
    var id: Int
    var total: Int
    var new: Int
}
