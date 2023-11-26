//
//  Cases.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//

import Foundation

// Este struct aplica cuando el caso es el de país
struct CaseByCountry: Codable {
    var country: String
    var region: String
    var cases: [Date]
}

struct Date: Codable, Identifiable {
    var id: Int
    var date: Int
    var events: [Events]
}

// Este struct específicamente es el único que comparten ambos tipos del JSON
struct Events: Codable {
    var total: Int
    var new: Int
}

// Ahora el struct en caso de que sea por fecha
struct CaseByDate: Codable {
    var country: String
    var region: String
    var cases: [Events]
}
