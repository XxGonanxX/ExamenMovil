//
//  NetworkAPIService.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//

import Foundation
import Alamofire

class NetworkAPIService {
    static let shared = NetworkAPIService()

    // Mi URL Base y la API Key siempre serán iguales, entonces solo necesito rehacer el método HTTP para cada caso
    
    func CaseByCountry(country: String) async -> CaseByCountry {
        
    }
    
    func CaseByDate(date: Int) async -> CaseByDate {
        
    }
}
