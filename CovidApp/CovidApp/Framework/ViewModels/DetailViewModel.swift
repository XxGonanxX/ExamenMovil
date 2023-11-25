//
//  DetailViewModel.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//

import Foundation

class DetailViewModel: ObservableObject {
    @Published var casesList: [DateCases] = []
    @Published var apiResponse: Cases?
    
    
    private let casesRepository: CaseRepository

    init(casesRepository: CaseRepository = CaseRepository.shared) {
        self.casesRepository = casesRepository
    }

    func getCasesList(forCountry country: String, startDate: String, endDate: String) async {
        do {
            apiResponse = try await casesRepository.sendCaseData(startDate: startDate, endDate: endDate, country: country, limit: 10)
            
            if let results = apiResponse?.results {
                casesList = results
            }
        } catch {
            print("Error al obtener datos: \(error)")
        }
    }
}
