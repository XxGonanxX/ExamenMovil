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
    func getCaseList(limit: Int) async -> Cases?
}

class CaseRepository: CasesAPIProtocol {
    let nservice: NetworkAPIService
    
    static let shared = CaseRepository()
    
    init(nservice: NetworkAPIService = NetworkAPIService.shared){
        self.nservice = nservice
    }
    
    func getCaseList(limit: Int) async -> Cases? {
        
        let apiInstance = API()
        
        return await nservice.getCases(url: URL(string:"\(apiInstance.base)\(API.routes.startDate)\(API.routes.endDate)\(API.routes.country)")!,Limit: limit)
        
    }
}

