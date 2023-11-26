//
//  CasesAPIProtocol.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 26/11/23.
//

import Foundation

protocol CasesAPIProtocol {
        
    // https://api.api-ninjas.com/v1/covid19?date={country}
    func getCaseByCountry(country: String) async -> CaseByCountry?
        
    // https://api.api-ninjas.com/v1/covid19?country={date}
    func getCaseByDate(date: String) async -> CaseByDate?
}
