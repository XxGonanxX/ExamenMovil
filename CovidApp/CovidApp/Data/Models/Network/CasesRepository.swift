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
        
        static let startDate = "date="
        static let endDate = "&"
        static let country = "&country="
        
    }
}

protocol CasesAPIProtocol {
    func sendCaseData(startDate: String, endDate: String, country: String?, limit: Int) async -> Cases?
}

class CaseRepository: CasesAPIProtocol {
    let nservice: NetworkAPIService
    
    static let shared = CaseRepository()
    
    init(nservice: NetworkAPIService = NetworkAPIService.shared){
        self.nservice = nservice
    }
    
    func sendCaseData(startDate: String, endDate: String, country: String?, limit: Int) async -> Cases? {
        let apiInstance = API()
        let urlString = "\(apiInstance.base)\(API.routes.startDate)\(startDate)\(API.routes.endDate)\(endDate)\(API.routes.country)\(country)"
        
        guard let url = URL(string: urlString) else {
            // Manejo de error si la URL no es válida
            return nil
        }
        
        

        return await nservice.sendCaseData(startDate: startDate, endDate: endDate, country: country, limit: limit)
    }

}

