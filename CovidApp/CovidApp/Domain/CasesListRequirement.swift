//
//  CasesListRequirement.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//

import Foundation

protocol CaseListRequierementProtocol {
    func getCasesList(limit: Int) async -> [CountryData]?
    
}
    
class CaseListRequirement: CaseListRequierementProtocol {

    static let shared = CaseListRequirement()

    func getCasesList(limit: Int) async -> [CountryData]? {
            // Crea instancias válidas de Date para startDate y endDate
        let startDate: String = "2022-11-11" // Deberías proporcionar un valor real aquí
        let endDate: String = "2023-11-11"   // Deberías proporcionar un valor real aquí
            let country: String = "Mexico" // Puedes proporcionar un valor predeterminado o dejarlo como String?

            return await dataRepository.sendCaseData(startDate: startDate, endDate: endDate, country: country, limit: limit)
        }

        let dataRepository: CaseRepository

        init(dataRepository: CaseRepository = CaseRepository.shared) {
            self.dataRepository = dataRepository
        }
}
