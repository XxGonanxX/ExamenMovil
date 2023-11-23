//
//  DetailViewModel.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//

import Foundation
import Foundation

class DetailViewModel: ObservableObject {
    @Published var casesList: [Case] = []
    @Published var apiResponse: Cases?
    
    private let casesRepository: CaseRepository

    init(casesRepository: CaseRepository = CaseRepository.shared) {
        self.casesRepository = casesRepository
    }

    func getCasesList(forCountry country: String, startDate: String, endDate: String) async {
        apiResponse = await casesRepository.sendCaseData(startDate: startDate, endDate: endDate, country: country, limit: 10)
    }
}
