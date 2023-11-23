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
    var startDate: String
    var endDate: String
}


struct Case:Codable, Identifiable {
    var id: Int
    var date: Date
    var country: String?
}
