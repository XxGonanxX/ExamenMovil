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
        
        static let startDate = ""
        static let endDate = ""
        static let country = ""
        
    }
}

protocol CasesAPIProtocol {
    func sendCaseData(startDate: String, endDate: String, country: String?, limit: Int) async -> [CountryData]?
}

class CaseRepository: CasesAPIProtocol {
    let nservice: NetworkAPIService
    
    static let shared = CaseRepository()
    
    init(nservice: NetworkAPIService = NetworkAPIService.shared){
        self.nservice = nservice
    }
    
    func sendCaseData(startDate: String, endDate: String, country: String?, limit: Int) async -> [CountryData]? {
        let apiInstance = API()
        let urlString = "\(apiInstance.base)\(API.routes.startDate)\(startDate)\(API.routes.endDate)\(endDate)\(API.routes.country)\(country)"
        
        guard let url = URL(string: urlString) else {
            // Manejo de error si la URL no es válida
            print("No funcionó")
            return nil
        }
        
        do {
            print("estoy en el sendcasedata")
            
            // Aquí utilizamos try await dentro de un bloque do-catch para manejar posibles errores
            return try await nservice.sendCaseData(startDate: startDate, endDate: endDate, country: country, limit: limit)
        } catch {
            // Manejo de errores
            print("Error al enviar datos de casos: \(error)")
            return nil
        }
    }


}

