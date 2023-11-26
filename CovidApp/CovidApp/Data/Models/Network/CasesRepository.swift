//
//  CasesRepository.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//

import Foundation

struct API {
    
    // Variables que siempre serán las mismas
    static let base = "https://api.api-ninjas.com/v1/covid19?"
    
    struct routes {
        
        //Tenemos dos posibles rutas dependiendo el tipo de fetch que se busque, por fecha o por país
        static let Date = "date="
        static let Country = "country="
    }
}


class CasesRepository: CasesAPIProtocol {
    
    let nservice: NetworkAPIService
    
    init(nservice: NetworkAPIService = NetworkAPIService.shared) {
        self.nservice = nservice
    }
    
    func getCaseByCountry(country: String) async -> [CaseByCountry]? {
        // Aquí va el código bellaco
        return await nservice.getCaseByCountry(url: URL(string:"\(API.base)\(API.routes.Country)\(country)")!, Country: country)
    }
    
    func getCaseByDate(date: String) async -> [CaseByDate]? {
        // Aquí va aún más código bellaco (que bellaco el código)
        return await nservice.getCaseByDate(url: URL(string:"\(API.base)\(API.routes.Date)\(date)")!, Date: date)
        
    }
    
}
