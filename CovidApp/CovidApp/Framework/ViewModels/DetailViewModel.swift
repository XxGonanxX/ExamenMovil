//
//  DetailViewModel.swift
//  CovidApp
//
//  Created by Alan Patricio González Bernal on 23/11/23.
//

import Foundation

class DetailViewModel: ObservableObject {
    
    @Published var caseList = [CaseByDate]()
    @Published var caseListCountry = [CaseByCountry]()
    @Published var totalCases = 0
    @Published var inputCountry = "Mexico"
    @Published var inputDate = "2022-11-11"
    
    
    private let casesRepository: CasesRepository

          init(casesRepository: CasesRepository = CasesRepository.shared) {
              self.casesRepository = casesRepository
          }
    
    
    func getCaseByDate() async {
        
        print("Se ingresó: \(inputCountry) y \(inputDate)")
        
        if inputDate != "" {
            
            do {
                let repository = CasesRepository()
                if let result = await repository.getCaseByDate(date: "\(inputDate)") {
                    var tempCaseByDate = [CaseByDate]()
                    for (_, casesData) in result.enumerated() {
                        let tempCase = CaseByDate(id: UUID(), country: casesData.country, region: casesData.region, cases: casesData.cases)
                        tempCaseByDate.append(tempCase)
                        totalCases += 1
                    }
                    caseList = tempCaseByDate
                    
                }
            }
        }
    }
    
    func getCaseByCountry() async {
        if inputCountry != "" {
        do {
                let repository = CasesRepository()
                if let resultCountry = await repository.getCaseByCountry(country: "\(inputCountry)") {
                    var tempCaseByCountry = [CaseByCountry]()
                    for (_, casesData) in resultCountry.enumerated() {
                        let tempCase = CaseByCountry(id: UUID(), country: casesData.country, region: casesData.region, cases: casesData.cases)
                        tempCaseByCountry.append(tempCase)
                        totalCases += 1
                    }
                    
                    caseListCountry = tempCaseByCountry
                }
            }
        }
    }
}
