//
//  CasesListRequirement.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//

import Foundation

protocol CaseListRequierementProtocol {
    func getCasesList(limit: Int) async -> Cases?
    
}
    
class CaseListRequirement: CaseListRequierementProtocol {

    static let shared = CaseListRequirement()

    func getCasesList(limit: Int) async -> Cases? {
            // Crea instancias válidas de Date para startDate y endDate
        let startDate: String = "" // Deberías proporcionar un valor real aquí
        let endDate: String = ""   // Deberías proporcionar un valor real aquí
            let country: String = "" // Puedes proporcionar un valor predeterminado o dejarlo como String?

            return await dataRepository.sendCaseData(startDate: startDate, endDate: endDate, country: country, limit: limit)
        }

        let dataRepository: CaseRepository

        init(dataRepository: CaseRepository = CaseRepository.shared) {
            self.dataRepository = dataRepository
        }
}
