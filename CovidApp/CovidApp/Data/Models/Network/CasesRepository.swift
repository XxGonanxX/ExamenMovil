//
//  CasesRepository.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//

import Foundation

struct API {
    
    // Variables que siempre serán las mismas, la apiKey es la de mi cuenta así que no debería haber problemas
    let apiKey = "wQJQSBY0VEm6Si+tRjTpCQ==qTcldfbpLTdYr3Zc"
    let baseURL = "https://api.api-ninjas.com/v1/covid19?"
    
    struct routes {
        
        //Tenemos dos posibles rutas dependiendo el tipo de fetch que se busque, por fecha o por país
        static let Date = "date="
        static let Country = "country="
    }
}
    
protocol CasesAPIProtocol {
        
    // https://api.api-ninjas.com/v1/covid19?date={date}
    func CaseByCountry(country: String) async -> CaseByCountry?
        
    // https://api.api-ninjas.com/v1/covid19?country={country}
    func CaseByDate(date: Int) async -> CaseByDate?
}

class CasesRepository: CasesAPIProtocol {
    func CaseByCountry(country: String) async -> CaseByCountry? {
        // Aquí va el código bellaco
    }
    
    func CaseByDate(date: Int) async -> CaseByDate? {
        // Aquí va aún más código bellaco (que bellaco el código)
    }
}
