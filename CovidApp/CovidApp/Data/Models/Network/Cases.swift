//
//  Cases.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//

import Foundation

struct CountryData: Codable {
    let country: String
    let region: String
    let cases: [String: CaseData]

    struct CaseData: Codable {
        let total: Int
        let new: Int
    }
}

