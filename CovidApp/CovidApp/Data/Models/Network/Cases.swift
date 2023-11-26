//
//  Cases.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//

import Foundation

// Este struct aplica cuando el caso es el de país
struct CaseByCountry: Codable, Identifiable {
    var id: UUID?
    var country: String
    var region: String
    var cases: [String: Cases]
}

struct Date: Codable, Identifiable {
    var id: UUID?
    var date: String
    var cases: Cases
}

// Este struct específicamente es el único que comparten ambos tipos del JSON
struct Cases: Codable, Identifiable {
    var id: UUID?
    let date: String?
    var total: Int
    var new: Int
}

// Ahora el struct en caso de que sea por fecha
struct CaseByDate: Codable, Identifiable {
    var id: UUID?
    var country: String
    var region: String
    var cases: Cases
}
