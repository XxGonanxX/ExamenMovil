//
//  CasesRepository.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//

import Foundation

struct API {
    let base = "https://api.api-ninjas.com/v1/covid19?"
    
    struct routes {
        
        static let startDate = "date=StartDate"
        static let endDate = "&endDate"
        static let country = "&country=country"
        
    }
}

protocol CasesAPIProtocol {
    func getCasesList(limit: Int) async -> Cases?
}

class CasesRepository: CasesAPIProtocol {
    let nservice: NetworkAPIService
    
    static let shared = CasesRepository()
    
    init(nservice: NetworkAPIService = NetworkAPIService.shared){
        self.nservice = nservice
    }
    
    func getCasesList(limit: Int) async -> Cases? {
        
        return await nservice.getCases(url: URL(string:"\(API.base)\(API.routes.startDate)\(API.routes.endDate)\(API.routes.country)")!,Limit: limit)
        
    }
}

